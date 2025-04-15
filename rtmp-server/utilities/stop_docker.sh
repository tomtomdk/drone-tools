#!/bin/bash

# Partial name of the container you want to stop
CONTAINER_NAME_FILTER="rtmp"

# Find matching container(s) and stop them
docker ps --filter "name=${CONTAINER_NAME_FILTER}" --format "{{.ID}}" | xargs -r docker stop