use std::time::Duration;

use actix_web::rt::{net::UnixStream, time::{sleep, timeout}};
use log::error;

pub async fn read_exact(stream: &mut UnixStream, buf: &mut [u8]) -> Result<(), std::io::Error> {
    let mut total_read = 0;

    loop {
        error!("Reading from stream");
        timeout(Duration::from_millis(1000), stream.readable()).await;

        match stream.try_read(&mut buf[total_read..]) {
            Ok(0) => break,
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
                    error!("Stream not readable");
                    sleep(Duration::from_millis(10)).await;
                    continue;
                }
            }
        }
    }
    error!("Finished reading from stream");
    Ok(())
}

pub async fn write_all(stream: &mut UnixStream, buf: &[u8]) -> Result<(), std::io::Error> {
    let mut total_written = 0;
    error!("Writing to stream");
    loop {
        timeout(Duration::from_millis(1000), stream.writable()).await;

        match stream.try_write(&buf[total_written..]) {
            Ok(0) => break,
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
                    error!("Stream not writable");
                    sleep(Duration::from_millis(10)).await;
                    continue;
                }
            }
        }
    }
    error!("Finished writing to stream");
    Ok(())
}
