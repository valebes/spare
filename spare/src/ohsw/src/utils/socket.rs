use actix_web::rt::{net::UnixStream, task::yield_now, time::{sleep, timeout}};

pub async fn read_exact(stream: &mut UnixStream, buf: &mut [u8]) -> Result<(), std::io::Error> {
    let mut total_read = 0;
    loop {
        match timeout(std::time::Duration::from_millis(5000),stream.readable()).await {
            Ok(Ok(())) => {
                // Stream is readable
            }
            Ok(Err(e)) => {
                return Err(e);
            }
            Err(_) => {
                return Err(std::io::Error::new(
                    std::io::ErrorKind::TimedOut,
                    "Timeout while waiting for stream to be readable",
                ));
            }
        }
        let mut delay = 5;

        match stream.try_read(&mut buf[total_read..]) {
            Ok(0) => {
                if total_read < buf.len() {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::UnexpectedEof,
                        "Stream closed before reading the expected amount of data",
                    ));
                }
                break;
            },
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
                    if delay > 5000 {
                        return Err(std::io::Error::new(
                            std::io::ErrorKind::TimedOut,
                            "Timeout Reading!",
                        ));
                    }
                    sleep(std::time::Duration::from_millis(delay)).await;
                    delay = (delay * 2).min(100); // Exponential backoff with a max delay of 100ms
                    continue;
                }
            }
        }
    }
    Ok(())
}

pub async fn write_all(stream: &mut UnixStream, buf: &[u8]) -> Result<(), std::io::Error> {
    let mut total_written = 0;
    loop {
        match timeout(std::time::Duration::from_millis(5000),stream.writable()).await {
            Ok(Ok(())) => {
                // Stream is writable
            }
            Ok(Err(e)) => {
                return Err(e);
            }
            Err(_) => {
                return Err(std::io::Error::new(
                    std::io::ErrorKind::TimedOut,
                    "Timeout while waiting for stream to be writable",
                ));
            }
        }
        let mut delay = 5;

        match stream.try_write(&buf[total_written..]) {
            Ok(0) => {
                if total_written < buf.len() {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::UnexpectedEof,
                        "Stream closed before writing the expected amount of data",
                    ));
                }
                break;
            },
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
                    if delay > 5000 {
                        return Err(std::io::Error::new(
                            std::io::ErrorKind::TimedOut,
                            "Timeout Writing!",
                        ));
                    }
                    sleep(std::time::Duration::from_millis(delay)).await;
                    delay = (delay * 2).min(100); // Exponential backoff with a max delay of 100ms
                    continue;
                }
            }
        }
    }
    Ok(())
}
