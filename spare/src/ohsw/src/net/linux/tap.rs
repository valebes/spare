use super::sockaddr::SockaddrConvertible;
use log::info;
use nix::libc::{__c_anonymous_ifr_ifru, IFF_TAP};
use nix::libc::{IFF_NO_PI, IFF_VNET_HDR};
use nix::libc::{TUN_F_CSUM, TUN_F_TSO4, TUN_F_TSO6};
use nix::sys::socket::{socket, AddressFamily, SockFlag, SockType};
use private::*;
use std::{
    fs::{File, OpenOptions},
    net::Ipv4Addr,
    os::{
        fd::{AsRawFd, OwnedFd},
        raw::c_short,
        unix::fs::OpenOptionsExt,
    },
};

/// A private module containing ioctl definitions.
mod private {
    use nix::ioctl_read_bad;
    use nix::ioctl_write_int;
    use nix::ioctl_write_ptr_bad;

    pub const TUNSETVNETHDRSZ: u32 = 1074025688;

    ioctl_write_ptr_bad!(siocsifflags, libc::SIOCSIFFLAGS, libc::ifreq);
    ioctl_write_ptr_bad!(siocsifaddr, libc::SIOCSIFADDR, libc::ifreq);
    ioctl_write_ptr_bad!(siocsifnetmask, libc::SIOCSIFNETMASK, libc::ifreq);
    ioctl_write_ptr_bad!(tunsetvnethdrsz, TUNSETVNETHDRSZ, libc::c_int);
    ioctl_write_int!(tunsetoffload, b'T', 208);
    ioctl_write_int!(tunsetiff, b'T', 202);
    ioctl_write_int!(tunsetpersist, b'T', 203);
    ioctl_read_bad!(siocgifmtu, libc::SIOCGIFMTU, libc::ifreq);
    ioctl_read_bad!(siocgifflags, libc::SIOCGIFFLAGS, libc::ifreq);
    ioctl_read_bad!(siocgifaddr, libc::SIOCGIFADDR, libc::ifreq);
    ioctl_read_bad!(siocgifdstaddr, libc::SIOCGIFDSTADDR, libc::ifreq);
    ioctl_read_bad!(siocgifbrdaddr, libc::SIOCGIFBRDADDR, libc::ifreq);
    ioctl_read_bad!(siocgifnetmask, libc::SIOCGIFNETMASK, libc::ifreq);
}

const VNET_HDR_SIZE: libc::c_int = 12;

/// A TAP interface.
pub struct TapRaw {
    ifname: String,
    fd: Option<File>,
    owned_socket: Option<OwnedFd>,
}

impl TapRaw {
    fn open_tundev_raw() -> File {
        let file = OpenOptions::new()
            .read(true)
            .write(true)
            .custom_flags(nix::libc::O_NONBLOCK)
            .open("/dev/net/tun");

        if let Err(e) = file {
            panic!("Failed to open /dev/net/tun: {}", e);
        }

        file.unwrap()
    }

    pub fn new(name: &str) -> Result<Self, nix::Error> {
        let fd = Self::open_tundev_raw();

        /* Validate the interface name */
        if name.len() == 0 || name.len() >= libc::IFNAMSIZ {
            return Err(nix::Error::from(nix::errno::Errno::EINVAL));
        }

        let mut ifr_name = [0i8; 16];
        for (i, c) in name.as_bytes().iter().enumerate() {
            ifr_name[i] = *c as i8;
        }

        let mut ifr: libc::ifreq = unsafe { std::mem::zeroed() };
        ifr.ifr_name = ifr_name;
        ifr.ifr_ifru = __c_anonymous_ifr_ifru {
            ifru_flags: (IFF_TAP | IFF_NO_PI | IFF_VNET_HDR) as c_short,
        };

        // Set the TAP interface up
        unsafe { tunsetiff(fd.as_raw_fd(), &ifr as *const _ as _) }?;

        // Set the vnet header size and enable offload (See https://blog.cloudflare.com/virtual-networking-101-understanding-tap/)
        unsafe { tunsetvnethdrsz(fd.as_raw_fd(), &VNET_HDR_SIZE) }?;

        let flags_offload = TUN_F_CSUM | TUN_F_TSO4 | TUN_F_TSO6;

        unsafe { tunsetoffload(fd.as_raw_fd(), flags_offload.into()) }?;

        let ifname = name.to_owned();

        match socket(
            AddressFamily::Inet,
            SockType::Datagram,
            SockFlag::empty(),
            None,
        ) {
            Ok(s) => Ok(TapRaw {
                ifname,
                fd: Some(fd),
                owned_socket: Some(s),
            }),
            Err(e) => {
                panic!("Failed to create socket: {}", e);
            }
        }
    }

    fn with_name(&self) -> Result<libc::ifreq, nix::Error> {
        let mut ifr_name = [0i8; 16];
        for (i, c) in self.ifname.as_bytes().iter().enumerate() {
            ifr_name[i] = *c as i8;
        }

        let mut ifr: libc::ifreq = unsafe { std::mem::zeroed() };
        ifr.ifr_name = ifr_name;

        Ok(ifr)
    }

    pub fn set_persistent(&self, persist: bool) -> Result<(), nix::Error> {
        let val = if persist { 1 } else { 0 };
        let raw_fd = self.fd.as_ref().unwrap().as_raw_fd();
        unsafe { tunsetpersist(raw_fd, val) }?;
        Ok(())
    }

    pub fn set_address(&self, address: &Ipv4Addr) -> Result<(), nix::Error> {
        let mut req = self.with_name()?;
        req.ifr_ifru.ifru_addr = address.to_sockaddr();
        let owned_socket = self.owned_socket.as_ref().unwrap().as_raw_fd();
        unsafe { siocsifaddr(owned_socket, &req) }?;
        Ok(())
    }

    pub fn get_address(&self) -> Result<Ipv4Addr, nix::Error> {
        let mut req = self.with_name()?;
        let owned_socket = self.owned_socket.as_ref().unwrap().as_raw_fd();
        unsafe { siocgifaddr(owned_socket, &mut req) }?;
        Ok(Ipv4Addr::from_sockaddr(unsafe { req.ifr_ifru.ifru_addr }))
    }

    pub fn set_netmask(&self, address: &Ipv4Addr) -> Result<(), nix::Error> {
        let mut req = self.with_name()?;
        req.ifr_ifru.ifru_addr = address.to_sockaddr();
        let owned_socket = self.owned_socket.as_ref().unwrap().as_raw_fd();
        unsafe { siocsifnetmask(owned_socket, &req) }?;
        Ok(())
    }

    pub fn get_netmask(&self) -> Result<Ipv4Addr, nix::Error> {
        let mut req = self.with_name()?;
        let owned_socket = self.owned_socket.as_ref().unwrap().as_raw_fd();
        unsafe { siocgifnetmask(owned_socket, &mut req) }?;
        Ok(Ipv4Addr::from_sockaddr(unsafe { req.ifr_ifru.ifru_addr }))
    }

    pub fn set_flags(&self, flags: i16) -> Result<(), nix::Error> {
        let mut req = self.with_name()?;
        req.ifr_ifru.ifru_flags = flags;
        let owned_socket = self.owned_socket.as_ref().unwrap().as_raw_fd();
        unsafe { siocsifflags(owned_socket, &req) }?; // ERROR
        Ok(())
    }

    pub fn get_flags(&self) -> Result<i16, nix::Error> {
        let mut req = self.with_name()?;
        let owned_socket = self.owned_socket.as_ref().unwrap().as_raw_fd();
        unsafe { siocgifflags(owned_socket, &mut req) }?;
        unsafe { Ok(req.ifr_ifru.ifru_flags) }
    }

    pub fn set_ifup(&self) -> Result<(), nix::Error> {
        let flags = libc::IFF_UP as i16 | libc::IFF_RUNNING as i16;
        self.set_flags(flags)
    }

    pub fn set_ifdown(&self) -> Result<(), nix::Error> {
        let mut flags = self.get_flags()?;
        let upflags = libc::IFF_UP as i16 | libc::IFF_RUNNING as i16;
        flags &= !upflags;
        self.set_flags(flags)
    }

    pub fn close(mut self) {
        if let Some(_) = self.fd {
            self.fd = None;
        }
        if let Some(_) = self.owned_socket {
            self.owned_socket = None;
        }
    }
}

/// Abstraction over a TAP interface.
pub struct Tap {
    ifname: String,
}

impl Tap {
    /// Create a new TAP interface.
    /// # Arguments
    /// * `name` - The name of the TAP interface.
    /// # Returns
    /// A new Tap object.
    /// # Errors
    /// If the TAP interface cannot be created.
    /// # Example
    /// ```rust
    /// use ohsw::net::linux::tap::Tap;
    /// let tap = Tap::create("tap0").unwrap();
    /// ```
    pub fn create(name: &str) -> Result<Self, nix::Error> {
        let raw = TapRaw::new(name);
        if raw.is_err() {
            return Err(raw.err().unwrap());
        }  
        let raw = raw.unwrap();

        info!("Create tap {}", name);
        raw.set_persistent(true)?;

        info!("Set ifup {}", name);
        raw.set_ifup()?;

        let ifname = raw.ifname.to_owned();
        raw.close();

        Ok(Tap { ifname })
    }

    /// Create a new TAP interface with a specific IP address.
    /// # Arguments
    /// * `name` - The name of the TAP interface.
    /// * `ip` - The IP address to assign to the interface.
    /// * `netmask` - The netmask to use.
    /// # Returns
    /// A new Tap object.
    /// # Errors
    /// If the TAP interface cannot be created.
    pub fn create_with_ip(
        name: &str,
        ip: &Ipv4Addr,
        netmask: &Ipv4Addr,
    ) -> Result<Self, nix::Error> {
        let raw = TapRaw::new(name).unwrap();
        raw.set_address(ip)?;
        raw.set_netmask(netmask)?;
        raw.set_persistent(true)?;
        raw.set_ifup()?;
        let ifname = raw.ifname.to_owned();
        raw.close();

        Ok(Tap { ifname })
    }

    /// Remove the TAP interface.
    pub fn remove(&self) -> Result<(), nix::Error> {
        let raw = TapRaw::new(&self.ifname)?;
        raw.set_ifdown()?;
        raw.set_persistent(false)?;
        raw.close();

        Ok(())
    }

    /// Get the name of the TAP interface.
    pub fn name(&self) -> &str {
        &self.ifname
    }
}

// Unit tests
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_tap() {
        let tap = Tap::create("test_tap").expect("Failed to create tap");
        tap.remove().expect("Failed to remove tap");
    }
}
