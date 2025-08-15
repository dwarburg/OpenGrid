# Installation Guide

This guide will walk you through setting up the OpenGrid system.

## Prerequisites

- Docker and Docker Compose
- Node.js 16+ (for client development)
- Python 3.9+ (for service development)
- Git

## Quick Start with Docker

The easiest way to get started is using Docker Compose:

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/opengrid.git
   cd opengrid
   ```

2. Start the database:
   ```bash
   cd database/docker
   docker-compose up -d
   ```

3. Start the backend service:
   ```bash
   cd ../../service
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   pip install -r requirements.txt
   uvicorn fastapi_app.main:app --reload
   ```

4. Start the frontend:
   ```bash
   cd ../client/web
   npm install
   npm start
   ```

5. Open your browser to [http://localhost:3000](http://localhost:3000)

## Manual Installation

### Database Setup

1. Install PostgreSQL 12+ with PostGIS 3.0+
2. Create a new database:
   ```sql
   CREATE DATABASE opengrid;
   CREATE USER opengrid WITH PASSWORD 'opengrid123';
   GRANT ALL PRIVILEGES ON DATABASE opengrid TO opengrid;
   ```
3. Connect to the database and run the schema scripts in order:
   ```bash
   psql -U opengrid -d opengrid -f database/schema/01_extensions.sql
   # Repeat for other schema files in order
   ```

### Backend Service

1. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

2. Install dependencies:
   ```bash
   cd service
   pip install -r requirements.txt
   ```

3. Configure environment variables in `.env`:
   ```
   DATABASE_URL=postgresql://opengrid:opengrid123@localhost:5432/opengrid
   SECRET_KEY=your-secret-key
   ```

4. Run migrations:
   ```bash
   alembic upgrade head
   ```

5. Start the server:
   ```bash
   uvicorn fastapi_app.main:app --reload
   ```

### Frontend Setup

1. Install Node.js 16+ and npm
2. Install dependencies:
   ```bash
   cd client/web
   npm install
   ```

3. Create `.env` file:
   ```
   REACT_APP_API_URL=http://localhost:8000/api/v1
   REACT_APP_MAPBOX_ACCESS_TOKEN=your-mapbox-token
   ```

4. Start the development server:
   ```bash
   npm start
   ```

## Verifying the Installation

1. Access the web interface at [http://localhost:3000](http://localhost:3000)
2. Check the API documentation at [http://localhost:8000/docs](http://localhost:8000/docs)
3. Verify the database connection by querying the nodes table:
   ```sql
   SELECT COUNT(*) FROM nodes;
   ```

## Troubleshooting

- **Database connection issues**: Verify the database is running and credentials are correct
- **Missing dependencies**: Run `npm install` or `pip install -r requirements.txt`
- **Port conflicts**: Check if ports 3000 (frontend) and 8000 (backend) are available

For additional help, please open an issue on our GitHub repository.
