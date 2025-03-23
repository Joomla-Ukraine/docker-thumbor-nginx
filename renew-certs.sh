#!/bin/bash

docker compose run --rm certbot renew --quiet

if [ $? -eq 0 ]; then
    echo "OK, reload Nginx..."
    docker compose exec nginx nginx -s reload
    echo "Nginx reloaded."
else
    echo "Error cerbot renew."
fi
