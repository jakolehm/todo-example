#!/bin/bash
set -e

# Run tests once more in containers
docker-compose -f docker-compose.test.yml build
docker-compose -f docker-compose.test.yml run app rspec spec/

# Login to image repo
docker login -u "${QUAY_USERNAME}" -p "${QUAY_PASSWORD}" quay.io

# Push image
kontena stack build

# Deploy
kontena stack install --name todo kontena.yml || \
    kontena stack upgrade todo kontena.yml