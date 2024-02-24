#!/bin/bash

# Path to your Docker Compose file
DOCKER_COMPOSE_FILE="$(dirname "$0")/docker-compose.yml"

# Decrypt the private key
echo "${{ secrets.SSH_PRIVATE_KEY }}" > key.pem.enc
openssl aes-256-cbc -d -a -in key.pem.enc -out key.pem -pass env:SSH_PASSPHRASE

# Set appropriate permissions for the key
chmod 600 key.pem

# SSH into your EC2 instance
ssh -i "key.pem" ubuntu@13.201.229.180 << 'ENDSSH'
  # Commands to execute on the remote server
  # Pull the latest Docker image
  docker pull sstpl/myweb:latest
  
  # Restart the Docker containers using Docker Compose
  docker-compose -f "$DOCKER_COMPOSE_FILE" up -d
ENDSSH
