#!/bin/bash
set -e

export SSL_IGNORE_ERRORS=true

# Login to image repo
docker login -u "${QUAY_USERNAME}" -p "${QUAY_PASSWORD}" quay.io

# Push image
kontena stack build

# Deploy
kontena stack install --name todo kontena.yml || \
    kontena stack upgrade todo kontena.yml