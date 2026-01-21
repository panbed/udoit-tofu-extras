#!/bin/bash

cd /home/ubuntu/udoit

# get secrets json from secrets manager, parse using jq then dump all values into .env file
aws secretsmanager get-secret-value --secret-id "UDOIT_Secrets" --query "SecretString" --output text | jq -r 'to_entries|map("\(.key)=\(.value|tostring)")|.[]' >> .env
echo "Appended secrets to .env file."