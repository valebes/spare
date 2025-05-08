fn main() {
    // Let the orchestrator know we're ready
    let mut vsock = VsockStream::connect(&VsockAddr::new(2, 1234)).expect("Failed to connect");
    vsock.set_nonblocking(true).expect("Failed to set non-blocking");

    let buf = b"ready";
    let mut bytes_written = 0;
    while bytes_written < buf.len() {
        match vsock.write(&buf[bytes_written..]) {
            Ok(n) => bytes_written += n,
            Err(e) => println!("Failed to write to VsockStream: {}", e),
        }
    }

    vsock.flush().expect("Failed to flush");

    let mut buf_len = [0u8; 8];
    let mut bytes_read = 0;
    while bytes_read < 8 {
        match vsock.read(&mut buf_len[bytes_read..]) {
            Ok(n) => bytes_read += n,
            Err(e) => {
                println!("Failed to read from VsockStream: {}", e);
                return;
            }
        }
    }

    let len = u64::from_be_bytes(buf_len);
    let mut buf = vec![0u8; len as usize];
    bytes_read = 0;
    while bytes_read < len as usize {
        match vsock.read(&mut buf[bytes_read..]) {
            Ok(n) => bytes_read += n,
            Err(e) => {
                println!("Failed to read from VsockStream: {}", e);
                return;
            }
        }
    }
    println!("Received {} bytes", len);

    let mut buffer = handler(buf); // Call to the function
    println!("Output generated!");

    // Write back the result
    let len = buffer.len();
    let mut buf = len.to_be_bytes().to_vec();
    buf.append(&mut buffer);

    let mut bytes_written = 0;
    while bytes_written < buf.len() {
        match vsock.write(&buf[bytes_written..]) {
            Ok(n) => bytes_written += n,
            Err(e) => {
                println!("Failed to write to VsockStream: {}", e);
                return;
            }
        }
    }
    vsock.flush().expect("Failed to flush");
    let _ = vsock.shutdown(std::net::Shutdown::Both);
}
