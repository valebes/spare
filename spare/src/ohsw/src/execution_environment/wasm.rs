use limes::runtime::lambda::{Lambda, WasiFlags};
use limes::runtime::lambda_error::LambdaError;
use limes::tools::loader::*;
use std::collections::HashMap;
use std::net::Ipv4Addr;
use std::path::{Path, PathBuf};
use std::sync::Arc;
use wasmtime::component::Component;
use wasmtime::*;
use wasmtime_wasi::{DirPerms, FilePerms};

#[derive(Debug, Clone, PartialEq)]
pub enum WasmStatus {
    Ready,
    Running,
    Stopped,
}

pub struct WasmInstance {
    lambda: Arc<tokio::sync::Mutex<Lambda>>,
    status: Arc<tokio::sync::Mutex<WasmStatus>>,
}

pub struct WasmImage {
    image_bytes: Option<Vec<u8>>,
    image_file_path: Option<PathBuf>,
}

impl WasmImage {
    pub fn from_file(path: &Path) -> Self {
        Self {
            image_bytes: None,
            image_file_path: Some(path.to_path_buf()),
        }
    }

    pub fn from_bytes(bytes: &[u8]) -> Self {
        Self {
            image_bytes: Some(bytes.to_vec()),
            image_file_path: None,
        }
    }

    async fn into_component(self, engine: &Engine) -> Result<Arc<Component>, LambdaError> {
        match (self.image_bytes, self.image_file_path) {
            (Some(bytes), _) => load_module_from_bytes(engine, &bytes)
                .await
                .map_err(|_| LambdaError::ModuleNotFound),
            (None, Some(file_path)) => load_module_from_file(engine, file_path.as_path())
                .await
                .map_err(|_| LambdaError::ModuleNotFound),
            (None, None) => Err(LambdaError::ModuleNotFound),
        }
    }
}

impl WasmInstance {
    /// Build a new WasmInstance
    pub async fn new(
        image: WasmImage,
        memory_size: usize,
        tap_ip: Ipv4Addr,
        file_map: HashMap<String, (String, DirPerms, FilePerms)>,
    ) -> Result<Arc<Self>, LambdaError> {
        // Gen Engine
        let engine = build_engine(true, true)
            .await
            .map_err(|_| LambdaError::EngineBuildError)?;

        let component = image.into_component(&engine).await?;

        // Set WasiFlags
        let wasi_flags = WasiFlags::new(Some(()), Some(file_map));

        // Create LambdaInstance
        let lambda = Arc::new(tokio::sync::Mutex::new(
            Lambda::new(component, memory_size, tap_ip, wasi_flags).await?,
        ));
        let status = Arc::new(tokio::sync::Mutex::new(WasmStatus::Ready));
        Ok(Arc::new(WasmInstance { lambda, status }))
    }

    async fn set_status(&self, new_status: WasmStatus) {
        let mut status = self.status.lock().await;
        *status = new_status;
    }

    /// Get the name of the instance.
    pub async fn get_status(&self) -> WasmStatus {
        let status = self.status.lock().await;
        status.clone()
    }

    /// Start the instance.
    pub async fn start(&self, args: &str) -> Result<String, LambdaError> {
        // Update Status
        self.set_status(WasmStatus::Running).await;

        // Get function && Execute it
        let func = self.lambda.lock().await;
        let result = func.run(args).await?;
        Ok(result)
    }

    /// Stop the instance.
    pub async fn stop(&self) -> Result<(), LambdaError> {
        let func = self.lambda.lock().await;
        func.stop().await?;

        // Update Status
        self.set_status(WasmStatus::Stopped).await;
        Ok(())
    }

    /// Delete the instance.
    pub async fn delete(&mut self) {
        todo!();
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use std::str::FromStr;

    /// From ohsw dir exec: export ROOT_DIR=$(realpah ../../../)
    /// cargo test execution_environment
    #[tokio::test]
    async fn test_wasm() {
        // Get file path
        let root_dir = std::env::var("ROOT_DIR").expect("ROOT_DIR enviroment variable not define");
        let mut file_path = std::path::PathBuf::from(root_dir);
        file_path.push("data_wasm/mandelbrotset_no_io.wasm");
        println!("RESULT -> {}", file_path.as_path().to_str().unwrap());

        // Init image from file
        let image = WasmImage::from_file(file_path.as_path());

        // Fictional Tap IP
        let tap_ip = Ipv4Addr::from_str("192.168.1.100").expect("Error while defining tap ip");

        // Host to Guest file map
        let file_map = HashMap::new();

        // Init WasmInstance
        let wasm_instance = WasmInstance::new(image, 1024 * 1024 * 2, tap_ip, file_map)
            .await
            .expect("Error initializing the WasmInstance");

        // Status check
        let status = wasm_instance.get_status().await;
        assert_eq!(status, WasmStatus::Ready);

        // Exec function
        wasm_instance.start("").await.unwrap();
        assert!(true);
    }
}
