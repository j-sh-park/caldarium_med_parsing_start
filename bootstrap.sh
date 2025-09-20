#!/usr/bin/env bash
set -e

# Environment
POSTGRES_HOST=${POSTGRES_HOST:-ls_postgres}
POSTGRES_PORT=${POSTGRES_PORT:-5432}
POSTGRES_DB=${POSTGRES_DB:-med_parsing}
POSTGRES_USER=${POSTGRES_USER:-postgres}
POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-postgres}

MINIO_HOST=${MINIO_HOST:-ls_minio}
MINIO_PORT=${MINIO_PORT:-9000}
MINIO_USER=${MINIO_ROOT_USER:-minio}
MINIO_PASSWORD=${MINIO_ROOT_PASSWORD:-minio123}

# Restore Postgres
if [ -f "./postgres_dump/labelstudio_dump.sql" ]; then
    echo "Restoring Postgres database..."
    PGPASSWORD=$POSTGRES_PASSWORD psql -h $POSTGRES_HOST -p $POSTGRES_PORT -U $POSTGRES_USER -d $POSTGRES_DB -f ./postgres_dump/med_parsing_dump.sql
else
    echo "No Postgres dump found. Skipping restore."
fi

# Restore MinIO
if [ -d "./minio_bucket" ]; then
    echo "Restoring MinIO bucket..."
    mc alias set local http://$MINIO_HOST:$MINIO_PORT $MINIO_USER $MINIO_PASSWORD
    mc mb local/labelstudio-bucket || true
    mc mirror ./minio_bucket local/labelstudio-bucket
else
    echo "No MinIO bucket found. Skipping restore."
fi
