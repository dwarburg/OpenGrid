-- Core tables for network nodes and edges
CREATE TABLE IF NOT EXISTS nodes (
    id SERIAL PRIMARY KEY,
    geom GEOMETRY(Point, 4326) NOT NULL,
    properties JSONB
);

CREATE TABLE IF NOT EXISTS edges (
    id SERIAL PRIMARY KEY,
    source INTEGER NOT NULL,
    target INTEGER NOT NULL,
    cost FLOAT8,
    reverse_cost FLOAT8,
    geom GEOMETRY(LineString, 4326) NOT NULL,
    properties JSONB
);

-- Metadata table for tracking changes and versions
CREATE TABLE IF NOT EXISTS metadata (
    id SERIAL PRIMARY KEY,
    key TEXT NOT NULL UNIQUE,
    value TEXT,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
