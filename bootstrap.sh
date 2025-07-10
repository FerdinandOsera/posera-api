#!/bin/bash

set -e

echo "🔧 Starting Laravel bootstrap..."

echo "📁 Fixing permissions for storage and bootstrap/cache..."
chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

echo "⚙️ Checking .env file..."
if [ ! -f .env ]; then
  cp .env.example .env
fi

echo "⏳ Waiting for MySQL to be ready..."
until mysqladmin ping -h "$DB_HOST" -u "$DB_USERNAME" -p"$DB_PASSWORD" --silent; do
  echo "⏳ Still waiting for MySQL... retrying in 3s"
  sleep 3
done

echo "✅ MySQL is up."

echo "🔑 Generating app key..."
php artisan key:generate

echo "🛠️ Running database migrations..."
php artisan migrate --force

echo "🧹 Clearing config and cache..."
php artisan config:clear
php artisan cache:clear
php artisan config:cache

echo "✅ Bootstrap complete. Laravel is ready!"
