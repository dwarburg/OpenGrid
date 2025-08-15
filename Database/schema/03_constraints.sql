-- Primary key constraints
ALTER TABLE nodes ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);
ALTER TABLE edges ADD CONSTRAINT edges_pkey PRIMARY KEY (id);

-- Foreign key constraints
ALTER TABLE edges ADD CONSTRAINT edges_source_fkey FOREIGN KEY (source) REFERENCES nodes(id);
ALTER TABLE edges ADD CONSTRAINT edges_target_fkey FOREIGN KEY (target) REFERENCES nodes(id);

-- Spatial indexes
CREATE INDEX IF NOT EXISTS nodes_geom_idx ON nodes USING GIST (geom);
CREATE INDEX IF NOT EXISTS edges_geom_idx ON edges USING GIST (geom);

-- Indexes for performance
CREATE INDEX IF NOT EXISTS edges_source_idx ON edges (source);
CREATE INDEX IF NOT EXISTS edges_target_idx ON edges (target);
