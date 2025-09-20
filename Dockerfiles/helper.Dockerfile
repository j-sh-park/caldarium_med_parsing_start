# Use Postgres 15 as base (matches ls_postgres)
FROM postgres:15

# Install MinIO client
RUN apt-get update && apt-get install -y wget bash ca-certificates unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc \
    && chmod +x /usr/local/bin/mc

# Set working directory
WORKDIR /workspace

# Default command
CMD ["bash"]
