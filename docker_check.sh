#!/bin/bash

while true; do
	if [ -z "$(docker ps -q)" ]; then
		echo "No Docker containers are running, restarting..."
        # check if setup is complete
        if grep -q "SETUP_COMPLETE=true" /home/ubuntu/udoit/.env; then
            docker compose -f /home/ubuntu/udoit/docker-compose.yml up -d
        else
            docker compose -f /home/ubuntu/udoit/docker-compose-setup.yml up -d
        fi        
	else
		echo "Docker containers are running."
	fi

	sleep 5
done