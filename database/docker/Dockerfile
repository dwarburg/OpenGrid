FROM postgis/postgis:15-3.3

# Install required extensions
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    postgresql-15-pgrouting \
    postgresql-15-pgrouting-scripts \
    postgresql-15-postgis-3 \
    postgresql-15-postgis-3-scripts \
    postgresql-15-tableversion \
    && rm -rf /var/lib/apt/lists/*

# Create directory for initialization scripts
RUN mkdir -p /docker-entrypoint-initdb.d

# Copy initialization scripts
COPY ./schema/*.sql /docker-entrypoint-initdb.d/
COPY ./sample_data/*.sql /docker-entrypoint-initdb.d/

# Set environment variables
ENV POSTGRES_USER=opengrid
ENV POSTGRES_PASSWORD=opengrid123
ENV POSTGRES_DB=opengrid

# Expose PostgreSQL port
EXPOSE 5432
