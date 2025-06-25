#!/bin/bash

# Map Home Assistant options to NetBox environment variables
export DB_HOST="$db_host"
export DB_USER="$db_user"
export DB_PASSWORD="$db_password"
export DB_NAME="$db_name"
export REDIS_HOST="$redis_host"
export REDIS_PORT="$redis_port"
export SUPERUSER_NAME="$admin_username"
export SUPERUSER_PASSWORD="$admin_password"
export SUPERUSER_EMAIL="admin@example.com"

# Start the NetBox container (executes the image's entrypoint)
exec /docker-entrypoint.sh
