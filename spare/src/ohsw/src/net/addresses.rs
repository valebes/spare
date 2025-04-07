use ipnetwork::{IpNetworkError, Ipv4Network};
use std::net::Ipv4Addr;

/// A struct that manages the allocation of IP addresses.
#[derive(Clone)]
pub struct Addresses {
    network: Ipv4Network,
    available: Vec<Ipv4Addr>,
}

impl Addresses {
    /// Create a new Addresses object.
    /// The `addr` parameter is the network address and the `prefix` is the prefix length.
    pub fn new(addr: Ipv4Addr, prefix: u8) -> Result<Addresses, IpNetworkError> {
        let network = Ipv4Network::new(addr, prefix)?;

        // Generate all usable addresses (skip network and broadcast)
        let mut available = vec![];
        for i in 1..(network.size() - 1) {
            if let Some(ip) = network.nth(i as u32) {
                available.push(ip);
            }
        }

        Ok(Addresses { network, available })
    }

    /// Get the next available IP address.
    pub fn get(&mut self) -> Option<Ipv4Addr> {
        self.available.pop()
    }

    /// Release an IP address.
    pub fn release(&mut self, ip: Ipv4Addr) {
        // Prevent duplicates and invalid entries
        if self.network.contains(ip) && !self.available.contains(&ip) {
            self.available.push(ip);
        }
    }

    /// Get the network gateway (first usable IP).
    pub fn get_gateway(&self) -> Ipv4Addr {
        self.network.nth(1).unwrap_or(self.network.network())
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
        let addr = Ipv4Addr::new(192, 168, 1, 0);
        let mut addresses = Addresses::new(addr, 24).unwrap();

        for i in 1..255 {
            if i == 255 - 1 {
                break;
            } // Skip broadcast
            assert_eq!(addresses.get(), Some(Ipv4Addr::new(192, 168, 1, i)));
        }

        addresses.release(Ipv4Addr::new(192, 168, 1, 2));
        assert_eq!(addresses.get(), Some(Ipv4Addr::new(192, 168, 1, 2)));

        addresses.release(Ipv4Addr::new(192, 168, 1, 254));
        assert_eq!(addresses.get(), Some(Ipv4Addr::new(192, 168, 1, 254)));
    }
}
