FROM php:8.2-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip curl \
    sqlite3 libsqlite3-dev \
    git

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_sqlite zip

# Install Composer globally
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy app files to container
COPY . .

# Set permissions and prepare storage folders
RUN mkdir -p storage/framework/{cache,sessions,views} \
    && chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

# Make bootstrap.sh executable
RUN chmod +x /var/www/html/bootstrap.sh

# Entrypoint: run bootstrap script then start PHP
ENTRYPOINT ["sh", "-c", "./bootstrap.sh && php-fpm"]
