use actix_web::rt::{net::UnixStream, task::yield_now, time::sleep};

pub async fn read_exact(stream: &mut UnixStream, buf: &mut [u8]) -> Result<(), std::io::Error> {
    let mut total_read = 0;
    loop {
        stream.readable().await?;

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
                    yield_now().await;
                    sleep(std::time::Duration::from_millis(5)).await;
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
        stream.writable().await?;

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
                    yield_now().await;
                    sleep(std::time::Duration::from_millis(5)).await;
                    continue;
                }
            }
        }
    }
    Ok(())
}
