#!/bin/bash

REGION="<your-region>"
ACCOUNT_ID="<your-account-id>"
IMAGE_NAME="myapp"

echo "Logging into ECR..."
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

echo "Pulling Docker image..."
docker pull $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$IMAGE_NAME:latest

echo "Stopping old container (if exists)..."
docker stop myapp || true
docker rm myapp || true

echo "Running Docker container..."
docker run -d -p 80:80 --name myapp $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$IMAGE_NAME:latest
