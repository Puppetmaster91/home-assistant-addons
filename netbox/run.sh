#!/bin/bash

# Export all values from options
export SECRET_KEY="${SECRET_KEY}"
export DB_HOST="${DB_HOST}"
export DB_USER="${DB_USER}"
export DB_PASSWORD="${DB_PASSWORD}"
export DB_NAME="${DB_NAME}"
export SUPERUSER_NAME="${ADMIN_USERNAME}"
export SUPERUSER_PASSWORD="${ADMIN_PASSWORD}"

if [ "$DB_WAIT_DEBUG" = "true" ]; then
  export DB_WAIT_DEBUG=1
  echo "🔍 DB_WAIT_DEBUG is enabled"
fi

# Debug
echo "✅ Environment loaded"
echo "🔑 SECRET_KEY length: ${#SECRET_KEY}"
echo "📦 DB: ${DB_USER}@${DB_HOST}/${DB_NAME}"

# Start NetBox
/docker-entrypoint.sh
