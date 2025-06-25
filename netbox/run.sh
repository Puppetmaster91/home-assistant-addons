#!/bin/bash
echo "Starting NetBox..."

export SUPERUSER_USERNAME="${ADMIN_USERNAME}"
export SUPERUSER_PASSWORD="${ADMIN_PASSWORD}"
export DB_HOST="${DB_HOST}"
export DB_USER="${DB_USER}"
export DB_PASSWORD="${DB_PASSWORD}"
export DB_NAME="${DB_NAME}"

# Start NetBox
exec /opt/netbox/venv/bin/gunicorn \
  --env DJANGO_SETTINGS_MODULE=netbox.settings \
  --bind 0.0.0.0:8000 netbox.wsgi
