#!/bin/bash

# Path to your private key
PRIVATE_KEY="$(dirname "$0")/tolearn.pem"

# Path to your Docker Compose file
DOCKER_COMPOSE_FILE="$(dirname "$0")/docker-compose.yml"

# SSH into your EC2 instance
ssh -i "$PRIVATE_KEY" ubuntu@13.201.229.180 << 'ENDSSH'
  # Pull the latest Docker image
  docker pull sstpl/myweb:latest
  
  # Restart the Docker containers using Docker Compose
  docker-compose -f "$DOCKER_COMPOSE_FILE" up -d
ENDSSH
