use std::net::Ipv4Addr;

use ipnetwork::{IpNetworkError, Ipv4Network};
use qfilter::Filter;

/// A struct that manages the allocation of IP addresses.
/// It uses an AMQ filter to keep track of the available addresses.
#[derive(Clone)]
pub struct Addresses {
    network: Ipv4Network,
    available: Vec<Ipv4Addr>,
    last_assigned: u32,
    filter: Filter,
}

impl Addresses {
    /// Create a new Addresses object.
    /// The `addr` parameter is the network address and the `prefix` is the prefix length.
    /// # Arguments
    /// * `addr` - The network address.
    /// * `prefix` - The prefix length.
    /// # Returns
    /// A new Addresses object.
    pub fn new(addr: Ipv4Addr, prefix: u8) -> Result<Addresses, IpNetworkError> {
        let network = Ipv4Network::new(addr, prefix)?;
        let size = network.size() as u64;
        Ok(Addresses {
            network,
            available: vec![],
            last_assigned: 1, // We start with 1 because .1 is reserved
            filter: Filter::new(size, 0.0001).unwrap(),
        })
    }

    /// Get the next available IP address.
    /// # Returns
    /// An `Option<Ipv4Addr>` with the next available IP address.
    /// If there are no more addresses available, it returns `None`.
    /// If the address is available, it returns `Some(Ipv4Addr)`.
    pub fn get(&mut self) -> Option<Ipv4Addr> {
        // If there are no ready addresses, we need to find one
        if self.available.is_empty() {
            let mut i = self.last_assigned + 1;
            while let Some(ip) = self.network.nth(i) {
                if !self.filter.contains(ip) {
                    break;
                }
                i += 1;
                if i >= self.network.size() - 1 as u32 {
                    // The last ip is reserved for broadcast
                    self.last_assigned = 1;
                    return None; // No more addresses available
                }
            }
            let ip = self.network.nth(i).unwrap();
            self.last_assigned = i;
            assert!(self.filter.insert(ip).is_ok());
            Some(ip)
        } else {
            let ip = self.available.pop().unwrap();
            assert!(self.filter.insert(ip).is_ok());
            Some(ip)
        }
    }

    /// Release an IP address.
    pub fn release(&mut self, ip: Ipv4Addr) {
        self.available.push(ip);
        self.filter.remove(&ip);
    }

    /// Get the network address.
    pub fn get_gateway(&self) -> Ipv4Addr {
        self.network.network()
    }

    /// Get the netmask.
    pub fn get_netmask(&self) -> Ipv4Addr {
        self.network.mask()
    }
}

// Unit tests
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_addresses() {
        let addr = Ipv4Addr::new(127, 0, 0, 1);
        let mut addresses = Addresses::new(addr, 24).unwrap();
        for i in 2..255 {
            assert_eq!(addresses.get(), Some(Ipv4Addr::new(127, 0, 0, i)));
        }
        addresses.release(Ipv4Addr::new(127, 0, 0, 2));
        assert_eq!(addresses.get(), Some(Ipv4Addr::new(127, 0, 0, 2)));

        addresses.release(Ipv4Addr::new(127, 0, 0, 254));
        assert_eq!(addresses.get(), Some(Ipv4Addr::new(127, 0, 0, 254)));
    }
}
