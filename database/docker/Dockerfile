#start
FROM postgis/postgis:17-3.4

# Install pgRouting + build deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    jq \
    postgresql-17-pgrouting \
    postgresql-17-pgrouting-scripts \
    build-essential \
    git \
    postgresql-server-dev-17 \
    autoconf \
    automake \
    libtool \
    cmake \
    && rm -rf /var/lib/apt/lists/*

# Build and install table_version from source
RUN git clone https://github.com/linz/postgresql-tableversion.git /tmp/tableversion \
    && cd /tmp/tableversion \
    && make -i install \
    && cd / \
    && rm -rf /tmp/tableversion

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
