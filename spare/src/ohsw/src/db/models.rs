use serde::{Deserialize, Serialize};
use sqlx::Pool;

/// Struct that represents a function instance in the database
#[derive(Debug, sqlx::FromRow, Serialize, Deserialize)]
pub struct Instance {
    pub id: i64,
    pub functions: String,
    pub kernel: String,
    pub image: String,
    pub vcpus: i32,
    pub memory: i32,
    pub ip: String,
    pub port: i32,
    pub hops: i32,
    pub status: String,
    pub created_at: chrono::NaiveDateTime,
}

impl Instance {
    /// Create a new instance
    pub fn new(
        functions: String,
        kernel: String,
        image: String,
        vcpus: i32,
        memory: i32,
        hops: i32,
        ip: String,
        port: i32,
    ) -> Self {
        Instance {
            id: 0,
            functions,
            kernel,
            image,
            vcpus,
            memory,
            ip,
            port,
            hops,
            status: "started".to_string(),
            created_at: chrono::Utc::now().naive_utc(),
        }
    }

    /// Set the status of the instance
    pub fn set_status(&mut self, status: String) {
        self.status = status;
    }

    /// Insert the instance into the database
    pub async fn insert(&mut self, pool: &Pool<sqlx::Sqlite>) -> Result<(), sqlx::Error> {
        self.id = sqlx::query(
            "INSERT INTO instances (functions, kernel, image, vcpus, memory, ip, port, hops, status, created_at) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)",
        )
        .bind(&self.functions)
        .bind(&self.kernel)
        .bind(&self.image)
        .bind(&self.vcpus)
        .bind(&self.memory)
        .bind(&self.ip)
        .bind(&self.port)
        .bind(&self.hops)
        .bind(&self.status)
        .bind(&self.created_at)
        .execute(pool)
        .await?
        .last_insert_rowid();

        Ok(())
    }

    /// Update the instance in the database
    pub async fn update(&self, pool: &Pool<sqlx::Sqlite>) -> Result<(), sqlx::Error> {
        sqlx::query(
            "UPDATE instances SET functions = $1, kernel = $2, image = $3, vcpus = $4, memory = $5, ip = $6, port = $7, hops = $8, status = $9, created_at = $10 WHERE id = $11",
        )
        .bind(&self.functions)
        .bind(&self.kernel)
        .bind(&self.image)
        .bind(&self.vcpus)
        .bind(&self.memory)
        .bind(&self.ip)
        .bind(&self.port)
        .bind(&self.hops)
        .bind(&self.status)
        .bind(&self.created_at)
        .bind(&self.id)
        .execute(pool)
        .await?;
        Ok(())
    }

    /// Delete the instance from the database
    pub async fn delete(&self, pool: &Pool<sqlx::Sqlite>) -> Result<(), sqlx::Error> {
        sqlx::query("DELETE FROM instances WHERE id = $1")
            .bind(&self.id)
            .execute(pool)
            .await?;
        Ok(())
    }

    /// List all instances in the database
    pub async fn list(pool: &Pool<sqlx::Sqlite>) -> Result<Vec<Instance>, sqlx::Error> {
        let instances = sqlx::query_as::<_, Instance>("SELECT * FROM instances")
            .fetch_all(pool)
            .await?;
        Ok(instances)
    }

    /// Get an instance by its ID
    pub async fn get_by_id(
        id: i64,
        pool: &Pool<sqlx::Sqlite>,
    ) -> Result<Option<Instance>, sqlx::Error> {
        let instance = sqlx::query_as::<_, Instance>("SELECT * FROM instances WHERE id = $1")
            .bind(id)
            .fetch_optional(pool)
            .await?;
        Ok(instance)
    }
}

// Unit tests
#[cfg(test)]
mod tests {
    use super::*;
    use crate::db;

    #[actix_web::test]
    async fn test_insert() {
        let pool = db::establish_connection().await.unwrap();
        let mut instance = Instance::new(
            "test".to_string(),
            "test".to_string(),
            "test".to_string(),
            1,
            1,
            1,
            "test".to_string(),
            1,
        );
        instance.insert(&pool).await.unwrap();
        let instance = Instance::get_by_id(1, &pool).await.unwrap();
        assert!(instance.is_some());
        let instance = instance.unwrap();
        assert_eq!(instance.id, 1);
    }

    #[actix_web::test]
    async fn test_delete() {
        let pool = db::establish_connection().await.unwrap();
        let mut instance = Instance::new(
            "test".to_string(),
            "test".to_string(),
            "test".to_string(),
            1,
            1,
            1,
            "test".to_string(),
            1,
        );
        instance.insert(&pool).await.unwrap();
        instance.delete(&pool).await.unwrap();
        let instance = Instance::get_by_id(1, &pool).await.unwrap();
        println!("instance: {:?}", instance);
        assert!(instance.is_none());
    }

    #[actix_web::test]
    async fn test_list() {
        let pool = db::establish_connection().await.unwrap();
        let instances = Instance::list(&pool).await.unwrap();
        assert!(instances.is_empty());

        let mut instance = Instance::new(
            "test".to_string(),
            "test".to_string(),
            "test".to_string(),
            1,
            1,
            1,
            "test".to_string(),
            1,
        );
        instance.insert(&pool).await.unwrap();
        let instances = Instance::list(&pool).await.unwrap();
        assert_eq!(instances.len(), 1);
    }
}
