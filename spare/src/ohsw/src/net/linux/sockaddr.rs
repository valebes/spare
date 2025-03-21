use std::mem;
use std::net::Ipv4Addr;

pub trait SockaddrConvertible {
    fn to_sockaddr(&self) -> libc::sockaddr;
    fn from_sockaddr(addr: libc::sockaddr) -> Self;
}

impl SockaddrConvertible for Ipv4Addr {
    fn to_sockaddr(&self) -> libc::sockaddr {
        let mut address: libc::sockaddr_in = unsafe { mem::zeroed() };
        address.sin_family = libc::AF_INET as u16;
        address.sin_port = 0;
        address.sin_addr = libc::in_addr {
            s_addr: u32::from_ne_bytes(self.octets()),
        };

        unsafe { mem::transmute(address) }
    }

    fn from_sockaddr(addr: libc::sockaddr) -> Self {
        unsafe {
            mem::transmute::<libc::sockaddr, libc::sockaddr_in>(addr)
                .sin_addr
                .s_addr
                .to_ne_bytes()
                .into()
        }
    }
}
