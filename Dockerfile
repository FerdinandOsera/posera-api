FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip curl \
    sqlite3 libsqlite3-dev \
    libpng-dev libonig-dev libxml2-dev \
    libcurl4-openssl-dev default-mysql-client \
    git

RUN docker-php-ext-install pdo pdo_sqlite pdo_mysql zip bcmath gd mbstring exif pcntl

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY . .

RUN mkdir -p storage/framework/{cache,sessions,views} \
    && chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

RUN chmod +x /var/www/html/bootstrap.sh || true

ENTRYPOINT ["sh", "-c", "./bootstrap.sh && php-fpm"]
#  CMD ["tail", "-f", "/dev/null"]