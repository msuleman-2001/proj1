#!/bin/bash

#move directory
cd /home/u583874119/domains/proj1.techlab360.com

# Pull the latest changes from GitHub
git pull origin main

# Install/update dependencies
composer install --no-interaction --prefer-dist --optimize-autoloader

# Run migrations (if any)
php artisan migrate --force

# Clear and cache configurations
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Set correct permissions
chmod -R 775 storage
chmod -R 775 bootstrap/cache
