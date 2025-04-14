use actix_web::rt::{
    net::UnixStream,
    time::{sleep, timeout},
};

pub async fn read_exact(stream: &mut UnixStream, buf: &mut [u8]) -> Result<(), std::io::Error> {
    let mut total_read = 0;
    let mut delay = 5;

    loop {
        match timeout(std::time::Duration::from_millis(delay), stream.readable()).await {
            Ok(Ok(_)) => {}
            Ok(Err(e)) => return Err(e),
            Err(_) => {
                if delay > 10000 {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::TimedOut,
                        "Timeout Reading!",
                    ));
                }
                delay = (delay * 2).min(10000); // Exponential backoff with a max delay
                continue;
            }
        }

        match stream.try_read(&mut buf[total_read..]) {
            Ok(0) => {
                if total_read < buf.len() {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::UnexpectedEof,
                        "Stream closed before reading the expected amount of data",
                    ));
                }
                break;
            }
            Ok(n) => {
                total_read += n;
                if total_read == buf.len() {
                    break;
                }
            }
            Err(e) => {
                if e.kind() != std::io::ErrorKind::WouldBlock {
                    return Err(e);
                } else {
                    continue;
                }
            }
        }
    }
    Ok(())
}

pub async fn write_all(stream: &mut UnixStream, buf: &[u8]) -> Result<(), std::io::Error> {
    let mut total_written = 0;
    let mut delay = 5;

    loop {
        match timeout(std::time::Duration::from_millis(delay), stream.writable()).await {
            Ok(Ok(_)) => {}
            Ok(Err(e)) => return Err(e),
            Err(_) => {
                if delay > 10000 {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::TimedOut,
                        "Timeout Writing!",
                    ));
                }
                delay = (delay * 2).min(10000); // Exponential backoff with a max delay
                continue;
            }
        }

        match stream.try_write(&buf[total_written..]) {
            Ok(0) => {
                if total_written < buf.len() {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::UnexpectedEof,
                        "Stream closed before writing the expected amount of data",
                    ));
                }
                break;
            }
            Ok(n) => {
                total_written += n;
                if total_written == buf.len() {
                    break;
                }
            }
            Err(e) => {
                if e.kind() != std::io::ErrorKind::WouldBlock {
                    return Err(e);
                } else {
                    continue;
                }
            }
        }
    }
    Ok(())
}
