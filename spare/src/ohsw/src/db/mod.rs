//! Database module for SPARE project.
use models::Instance;
use serde::{Deserialize, Serialize};
use sqlx::{
    sqlite::{self, SqlitePoolOptions},
    Pool, Sqlite,
};
use std::io;

pub mod models;

// Establish a connection to the database
// If is a test, use an in-memory database. Otherwise, use the DATABASE_URL environment variable.
pub async fn establish_connection() -> Result<Pool<sqlite::Sqlite>, sqlx::Error> {
    if cfg!(test) {
        let pool = SqlitePoolOptions::new()
            .max_connections(100)
            .connect(":memory:")
            .await?;
        sqlx::migrate!().run(&pool).await?;

        Ok(pool)
    } else {
        let env = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
        let pool = SqlitePoolOptions::new()
            .max_connections(100)
            .connect(&env)
            .await?;
        sqlx::migrate!().run(&pool).await?;
        Ok(pool)
    }
}

// Return a list of all instances in the database
pub async fn get_list(pool: &Pool<sqlite::Sqlite>) -> Result<Vec<models::Instance>, sqlx::Error> {
    Instance::list(pool).await
}

// Used in SPARE paper. Struct that represents the statistics of an epoch.
#[derive(Deserialize, Serialize)]
pub struct Stats {
    pub hops_avg: f64,
    pub vcpus: i64,
    pub memory: i64,
    pub requests: i64,
}

// Get statistics from the database from start to end timestamps.
pub async fn stats(
    pool: &Pool<Sqlite>,
    start_timestamp: &str,
    end_timestamp: &str,
) -> Result<Stats, io::Error> {
    // SQL query to aggregate statistics from start to end timestamps
    let result = sqlx::query!(
        r#"
        SELECT
            strftime('%s', ?) * 1000 AS timestamp_ms,  -- Convert end timestamp to milliseconds
            COALESCE(AVG(hops), 0.0) AS hops_avg,
            COALESCE(SUM(vcpus), 0) AS vcpus_sum,
            COALESCE(SUM(memory), 0) AS memory_sum,
            COALESCE(COUNT(id), 0) AS requests
        FROM
            instances
        WHERE
            created_at BETWEEN ? AND ?
            AND status = 'terminated'
        "#,
        end_timestamp,
        start_timestamp,
        end_timestamp
    )
    .fetch_one(pool)
    .await
    .map_err(|e| io::Error::new(io::ErrorKind::Other, e))?;

    // Extract values, defaulting to 0 if null
    let hops_avg = result.hops_avg;
    let vcpus = result.vcpus_sum;
    let memory = result.memory_sum;
    let requests = result.requests;

    Ok(Stats {
        hops_avg,
        vcpus,
        memory,
        requests,
    })
}
