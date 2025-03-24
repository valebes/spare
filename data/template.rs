use std::net::{TcpStream, TcpListener};
use std::io::{Read, Write};
use libflate::gzip::Encoder;
use chunked_transfer::Encoder as OtherEncoder;
use vsock::{VsockAddr, VsockStream};


use crate::mandelbrot::mandelbrot;


fn handle_read(mut stream: &TcpStream) {
    let mut buf = [0u8 ;4096];
    match stream.read(&mut buf) {
        Ok(_) => {
            let req_str = String::from_utf8_lossy(&buf);
            println!("{}", req_str);
            },
        Err(e) => println!("Unable to read stream: {}", e),
    }
}

fn handle_write(mut stream: TcpStream, encoded: Vec<u8>) {
    let headers = [
        "HTTP/1.1 200 OK",
        "Content-type: image/png", // Deped on the content type
        "Content-Encoding: gzip",
        "Transfer-Encoding: chunked",
        &String::from("Content-Length: " .to_owned()+ &encoded.len().to_string()),
        "\r\n"
    ];
    let mut response = headers.join("\r\n")
        .to_string()
        .into_bytes();
    response.extend(encoded);

    match stream.write(&response) {
        Ok(_) => println!("Response sent"),
        Err(e) => println!("Failed sending response: {}", e),
    }
}

fn handle_client(stream: TcpStream, buf: Vec<u8>) {
    handle_read(&stream);
    handle_write(stream, buf);
}

fn main() {
    
    let threads = num_cpus::get();
   
    // Let the orchestrator know we're ready
    let mut vsock = VsockStream::connect(&VsockAddr::new(2, 1234)).expect("Failed to connect"); 
    vsock.write(b"ready").expect("Failed to write");
    vsock.flush().expect("Failed to flush");
    
    // We listen for incoming connections on port 8084
    let listener = TcpListener::bind("0.0.0.0:8084").unwrap();
    println!("Listening for connections on port {}", 8084);
    
    for stream in listener.incoming() {

        match stream {
            Ok(stream) => {
                thread::spawn(|| {
                    let buffer =  todo!(); // Generate the answer
                    handle_client(stream, buffer);
                });
            }
            Err(e) => {
                println!("Unable to connect: {}", e);
            }
        }
    }
}
