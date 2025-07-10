#!/bin/bash

# Exit script immediately on any error
set -e

echo "🔧 Starting Laravel bootstrap..."

# Step 1: Ensure storage and bootstrap/cache have correct permissions
echo "📁 Fixing permissions for storage and bootstrap/cache..."
chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

# Step 2: Ensure the SQLite file exists with proper permissions
echo "🗃️ Checking SQLite database file..."
if [ ! -f database/database.sqlite ]; then
  echo "📄 Creating SQLite database file..."
  touch database/database.sqlite
fi
chown www-data:www-data database/database.sqlite
chmod 664 database/database.sqlite

# Step 3: Copy .env if it doesn't exist
echo "⚙️ Checking .env file..."
if [ ! -f .env ]; then
  echo "📄 Copying .env.example to .env..."
  cp .env.example .env
fi

# Step 4: Run Laravel setup commands
echo "🔑 Generating app key..."
php artisan key:generate

echo "🧹 Clearing config and cache..."
php artisan config:clear
php artisan cache:clear
php artisan config:cache

echo "✅ Bootstrap complete. Laravel is ready!"
