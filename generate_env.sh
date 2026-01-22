#!/bin/bash

cd /home/ubuntu/udoit

# get secrets json from secrets manager, parse using jq then dump all values into .env file
REGION=$(TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')

aws secretsmanager get-secret-value --region $REGION --secret-id "UDOIT_Secrets" --query "SecretString" --output text | jq -r 'to_entries|map("\(.key)=\(.value|tostring)")|.[]' >> .env
echo "Appended secrets to .env file."