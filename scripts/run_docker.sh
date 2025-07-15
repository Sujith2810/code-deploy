#!/bin/bash

REGION="us-west-2"
ACCOUNT_ID="010426082127"
IMAGE_NAME="myapp"

echo "Logging into ECR..."
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 010426082127.dkr.ecr.us-west-2.amazonaws.com

echo "Pulling Docker image..."
docker pull 010426082127.dkr.ecr.us-west-2.amazonaws.com/myapp:latest

echo "Stopping old container (if exists)..."
docker stop myapp || true
docker rm myapp || true

echo "Running Docker container..."
docker run -d -p 80:80 --name myapp 010426082127.dkr.ecr.us-west-2.amazonaws.com/myapp:latest
