#!/usr/bin/env bash
set -e

# Obtenir le nom et la version du package depuis package.json
name=$(npm pkg get name | tr -d '"')
version=$(npm pkg get version | tr -d '"')

# Construire l'image Docker
docker buildx build \
    --platform=linux/amd64,linux/arm64 \
    --load \
    -t "$name:$version" \
    .
