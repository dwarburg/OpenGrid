# OpenGrid Service

This is the FastAPI backend service for the OpenGrid project.

## Prerequisites

- Python 3.9+
- PostgreSQL 12+ with PostGIS 3.0+
- pip

## Setup

1. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Create a `.env` file in the `service` directory with the following variables:
   ```
   DATABASE_URL=postgresql://opengrid:opengrid123@localhost:5432/opengrid
   SECRET_KEY=your-secret-key-here
   ALGORITHM=HS256
   ACCESS_TOKEN_EXPIRE_MINUTES=30
   ```

## Running the Application

Start the development server:
```bash
uvicorn fastapi_app.main:app --reload
```

The API will be available at `http://localhost:8000`

## API Documentation

Once the server is running, you can access:

- Swagger UI: `http://localhost:8000/docs`
- ReDoc: `http://localhost:8000/redoc`

## Project Structure

```
fastapi_app/
├── __init__.py
├── main.py           # FastAPI application setup
├── config.py         # Configuration settings
├── db/               # Database configuration
│   ├── __init__.py
│   ├── database.py   # Database connection
│   └── models.py     # SQLAlchemy models
├── api/              # API routes
│   ├── __init__.py
│   ├── v1/           # API version 1
│   │   ├── __init__.py
│   │   ├── endpoints/
│   │   │   ├── nodes.py
│   │   │   ├── edges.py
│   │   │   └── auth.py
│   │   └── api.py    # API router
│   └── deps.py       # Dependencies
├── core/             # Core functionality
│   ├── __init__.py
│   ├── security.py   # Authentication
│   └── config.py     # Core configuration
└── schemas/          # Pydantic models
    ├── __init__.py
    ├── node.py
    ├── edge.py
    └── token.py
```

## Development

### Running Tests

Create a test database and run:

```bash
pytest
```

### Database Migrations

This project uses Alembic for database migrations.

1. Initialize Alembic (if not already done):
   ```bash
   alembic init migrations
   ```

2. Create a new migration:
   ```bash
   alembic revision --autogenerate -m "Your migration message"
   ```

3. Apply migrations:
   ```bash
   alembic upgrade head
   ```

## Deployment

For production deployment, consider using:

- Gunicorn with Uvicorn workers
- Nginx as a reverse proxy
- Environment variables for configuration
- Proper logging and monitoring

## License

[Your License Here]
