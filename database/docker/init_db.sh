#!/bin/bash
set -e

# Initialize the database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- Create extensions
    \i /docker-entrypoint-initdb.d/01_extensions.sql
    
    -- Create schema
    \i /docker-entrypoint-initdb.d/02_schema.sql
    
    -- Add constraints
    \i /docker-entrypoint-initdb.d/03_constraints.sql
    
    -- Add triggers
    \i /docker-entrypoint-initdb.d/04_triggers.sql
    
    -- Add functions
    \i /docker-entrypoint-initdb.d/05_functions.sql
    
    -- Load sample data
    \i /docker-entrypoint-initdb.d/sample_network.sql
    \i /docker-entrypoint-initdb.d/sample_topology.sql
EOSQL

echo "Database initialization complete!"
