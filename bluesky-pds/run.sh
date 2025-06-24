#!/bin/bash

export PDS_HANDLE="${HANDLE}"
export PDS_HOSTNAME="${PDS_HOSTNAME}"
export PDS_DB_URL="${DB_URL}"
export PDS_REPO_SIGNING_KEY="${REPO_SIGNING_KEY}"
export PDS_ADMIN_PASSWORD="${ADMIN_PASSWORD}"

echo "Launching Bluesky PDS with the following settings:"
echo "Handle: $PDS_HANDLE"
echo "Hostname: $PDS_HOSTNAME"
echo "DB: $PDS_DB_URL"

# Start the PDS
exec node ./bin.js
