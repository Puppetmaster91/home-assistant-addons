#!/bin/bash

set -e

echo "Starting Bluesky PDS..."

# Print variables
echo "HANDLE: $HANDLE"
echo "PDS_HOSTNAME: $PDS_HOSTNAME"
echo "DB_URL: $DB_URL"

# Export them for node
export PDS_HANDLE="${HANDLE}"
export PDS_HOSTNAME="${PDS_HOSTNAME}"
export PDS_DB_URL="${DB_URL}"
export PDS_REPO_SIGNING_KEY="${REPO_SIGNING_KEY}"
export PDS_ADMIN_PASSWORD="${ADMIN_PASSWORD}"

# Check node is installed
which node || { echo "Node.js is not installed!"; exit 1; }

# Run the app
exec node ./bin.js
