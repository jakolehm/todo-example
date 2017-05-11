#!/bin/bash
set -e

docker login -u "${QUAY_USERNAME}" -p "${QUAY_PASSWORD}" quay.io

kontena stack build
kontena stack install --name todo kontena.yml || \
    kontena stack upgrade todo kontena.yml