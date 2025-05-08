/// Structure that contain a Base64 encoded payload
#[derive(serde::Deserialize, serde::Serialize, Clone)]
pub struct Payload {
    /// Base64 encoded payload
    pub payload: String,
}
