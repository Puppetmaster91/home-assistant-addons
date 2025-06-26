#!/bin/bash

export DB_HOST="${DB_HOST}"
export DB_USER="${DB_USER}"
export DB_PASSWORD="${DB_PASSWORD}"
export DB_NAME="${DB_NAME}"
export ADMIN_USERNAME="${ADMIN_USERNAME}"
export ADMIN_PASSWORD="${ADMIN_PASSWORD}"

if [ "${DB_WAIT_DEBUG}" = "true" ]; then
  export DB_WAIT_DEBUG=1
  echo "🔍 DB_WAIT_DEBUG is enabled"
fi

# Start NetBox
echo "🚀 Starting NetBox via supervisord..."
exec /usr/bin/supervisord -c /etc/supervisord.conf
