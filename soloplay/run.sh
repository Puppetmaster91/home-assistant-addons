#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

APP_TOKEN=$(jq --raw-output '.app_token' $CONFIG_PATH)
ENABLE_MIGRATION=$(jq --raw-output '.enable_migration' $CONFIG_PATH)
DB_HOST=$(jq --raw-output '.db_host' $CONFIG_PATH)
DB_PORT=$(jq --raw-output '.db_port' $CONFIG_PATH)
DB_NAME=$(jq --raw-output '.db_name' $CONFIG_PATH)
DB_USER=$(jq --raw-output '.db_user' $CONFIG_PATH)
DB_PASSWORD=$(jq --raw-output '.db_password' $CONFIG_PATH)

export AppSettings__Token="$APP_TOKEN"
export AppSettings__IsMigrationEnabled="$ENABLE_MIGRATION"
export ConnectionStrings__DefaultConnection="Host=$DB_HOST;Port=$DB_PORT;Database=$DB_NAME;Username=$DB_USER;Password=$DB_PASSWORD"
export ASPNETCORE_ENVIRONMENT="Production"

echo "Starter SoloPlay Server..."
exec dotnet SoloPlay.Server.dll --urls http://0.0.0.0:6968
