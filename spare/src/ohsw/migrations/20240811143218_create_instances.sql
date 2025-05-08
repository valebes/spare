-- Add migration script here
CREATE TABLE IF NOT EXISTS instances (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    functions TEXT NOT NULL,
    kernel TEXT NOT NULL,
    image TEXT NOT NULL,
    vcpus INTEGER NOT NULL,
    memory INTEGER NOT NULL,
    ip TEXT NOT NULL,
    port INTEGER NOT NULL,
    hops INTEGER NOT NULL,
    status TEXT NOT NULL CHECK(status IN ('started', 'terminated', 'failed')),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL  
);