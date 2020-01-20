FROM php:7.3-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql bcmath

RUN curl -sS https://getcomposer.org/installer | php -- \
  --install-dir=/usr/bin --filename=composer

COPY . /app

RUN cd "/app" && cp .env.production .env && composer install && php artisan migrate

WORKDIR /app

EXPOSE 8080

CMD php -S 0.0.0.0:9000 -t public
