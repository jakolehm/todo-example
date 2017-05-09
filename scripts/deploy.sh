#!/bin/bash

kontena stack install --name todo kontena.yml || \
    kontena stack upgrade todo kontena.yml