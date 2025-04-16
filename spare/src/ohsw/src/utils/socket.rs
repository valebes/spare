use actix_web::rt::{
    net::UnixStream,
    time::{sleep, timeout},
};
use log::error;

/// Reads exactly `buf.len()` bytes from the stream, or returns an error if the stream is closed before that.
/// This function will block until the specified amount of data is read or an error occurs.
/// It uses exponential backoff for retries in case of `WouldBlock` errors.
/// The `max_timeout` parameter specifies the maximum timeout for the read operation.
/// If the read operation takes longer than this timeout, an error will be returned.
/// # Arguments
/// * `stream` - The UnixStream to read from.
/// * `buf` - The buffer to read the data into.
/// * `max_timeout` - The maximum timeout for the read operation (in milliseconds).
/// # Returns
/// A Result indicating success or failure.
/// # Errors
/// If the stream is closed before reading the expected amount of data, or if a timeout occurs.
pub async fn read_exact(stream: &mut UnixStream, buf: &mut [u8], max_timeout: u64) -> Result<(), std::io::Error> {
    let mut total_read = 0;
    let mut delay = 2;

    loop {
        match timeout(std::time::Duration::from_millis(max_timeout), stream.readable()).await {
            Ok(Ok(_)) => {}
            Ok(Err(e)) => return Err(e),
            Err(_) => {
                if delay > max_timeout {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::TimedOut,
                        "Timeout Reading!",
                    ));
                }
                continue;
            }
        }

        match stream.try_read(&mut buf[total_read..]) {
            Ok(0) => {
                if total_read < buf.len() {
                    error!("Total read: {}", total_read);
                    error!("Buffer length: {}", buf.len());
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
                    sleep(std::time::Duration::from_millis(delay)).await;
                    delay = (delay * 2).min(max_timeout); // Exponential backoff with a max delay
                    continue;
                }
            }
        }
    }
    Ok(())
}

/// Writes all bytes from the buffer to the stream, or returns an error if the stream is closed before that.
/// This function will block until the specified amount of data is written or an error occurs.
/// It uses exponential backoff for retries in case of `WouldBlock` errors.
/// The `max_timeout` parameter specifies the maximum timeout for the write operation.
/// If the write operation takes longer than this timeout, an error will be returned.
/// # Arguments
/// * `stream` - The UnixStream to write to.
/// * `buf` - The buffer to write the data from.
/// * `max_timeout` - The maximum timeout for the write operation (in milliseconds).
/// # Returns
/// A Result indicating success or failure.
/// # Errors
/// If the stream is closed before writing the expected amount of data, or if a timeout occurs.
pub async fn write_all(stream: &mut UnixStream, buf: &[u8], max_timeout: u64) -> Result<(), std::io::Error> {
    let mut total_written = 0;
    let mut delay = 2;

    loop {
        match timeout(std::time::Duration::from_millis(max_timeout), stream.writable()).await {
            Ok(Ok(_)) => {}
            Ok(Err(e)) => return Err(e),
            Err(_) => {
                if delay > max_timeout {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::TimedOut,
                        "Timeout Writing!",
                    ));
                }
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
                    sleep(std::time::Duration::from_millis(delay)).await;
                    delay = (delay * 2).min(max_timeout); // Exponential backoff with a max delay
                    continue;
                }
            }
        }
    }
    Ok(())
}
