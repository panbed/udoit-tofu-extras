#!/bin/bash

cd /home/ubuntu/udoit

# check .env file for SETUP_COMPLETE
if grep -q "SETUP_COMPLETE=true" .env; then
    echo "Starting UDOIT..."
    docker compose -f docker-compose.yml up -d
else
    echo "Setup is not complete, starting UCONFIGIT..."
    docker compose -f docker-compose-setup.yml up -d
fi