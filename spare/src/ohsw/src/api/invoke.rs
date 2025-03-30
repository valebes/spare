/// Define a struct to represent the invocation of a function
#[derive(serde::Deserialize, serde::Serialize, Clone)]
pub struct InvokeFunction {
    // The name of the function to be invoked
    pub function: String,
    // The image associated with the function
    pub image: String,
    // The number of virtual CPUs allocated for the function
    pub vcpus: i32,
    // The amount of memory allocated for the function
    pub memory: i32,
    // The payload to be passed to the function
    pub payload: Option<String>,
    // A flag indicating if the invocation is an emergency
    pub emergency: bool,
    // The number of hops the invocation has taken
    pub hops: i32,
}
