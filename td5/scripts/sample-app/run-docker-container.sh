#!/usr/bin/env bash
set -e

# Variables
IMAGE_NAME="sample-app"
IMAGE_VERSION="1.0.0"
CONTAINER_NAME="sample-app-container"

# Run the Docker container
docker run -d \
  --name "$CONTAINER_NAME" \
  -p 8080:8080 \
  "$IMAGE_NAME:$IMAGE_VERSION"

echo "Application is running at http://localhost:8080"