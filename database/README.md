# OpenGrid Database

This directory contains the database schema, sample data, and Docker configuration for the OpenGrid project.

## Directory Structure

- `schema/`: SQL scripts for database schema setup
  - `01_extensions.sql`: PostgreSQL extensions
  - `02_schema.sql`: Core tables
  - `03_constraints.sql`: Keys and indexes
  - `04_triggers.sql`: Database triggers
  - `05_functions.sql`: Stored procedures
  - `README.md`: Schema documentation

- `sample_data/`: Sample data for development and testing
  - `sample_network.sql`: Sample network data
  - `sample_topology.sql`: Topology setup
  - `README.md`: Data documentation

- `docker/`: Docker configuration
  - `Dockerfile`: Database image definition
  - `docker-compose.yml`: Service definition
  - `init_db.sh`: Database initialization script

## Getting Started

### Prerequisites

- Docker and Docker Compose
- Git

### Quick Start

1. Navigate to the `docker` directory:
   ```bash
   cd database/docker
   ```

2. Start the database:
   ```bash
   docker-compose up -d
   ```

3. The database will be available at `localhost:5432` with the following credentials:
   - Username: opengrid
   - Password: opengrid123
   - Database: opengrid

4. To stop the database:
   ```bash
   docker-compose down
   ```

## Development

### Loading Sample Data

The sample data is automatically loaded when the container starts. If you need to reload it:

1. Stop and remove the container:
   ```bash
   docker-compose down -v
   ```

2. Start it again:
   ```bash
   docker-compose up -d
   ```

### Connecting to the Database

You can connect to the database using any PostgreSQL client:

```bash
psql -h localhost -p 5432 -U opengrid -d opengrid
```

Or use a GUI tool like pgAdmin or DBeaver.

## License

[Your License Here]
