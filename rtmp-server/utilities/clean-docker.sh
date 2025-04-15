#!/bin/bash

# Name filter to search for (adjust as needed)
CONTAINER_NAME_FILTER="rtmp"

# Find matching container IDs
CONTAINERS=$(docker ps -a --filter "name=${CONTAINER_NAME_FILTER}" --format "{{.ID}}")

# Check if we found any containers
if [ -z "$CONTAINERS" ]; then
  echo "No matching containers found with name filter: ${CONTAINER_NAME_FILTER}"
  exit 0
fi

# Stop and remove each container
for CONTAINER in $CONTAINERS; do
  echo "Stopping container $CONTAINER..."
  docker stop "$CONTAINER"

  echo "Removing container $CONTAINER..."
  docker rm "$CONTAINER"
done

echo "✅ All matching containers have been stopped and removed."

echo "🛠️  Stopping old container (if any)..."
docker compose down

echo "🚀 Building new image..."
docker compose up -d --build

echo "🧪 Waiting a few seconds for health checks..."
sleep 10

echo "🔍 Checking container health..."
docker ps

echo "✅ Done. Open http://localhost:8080 to confirm landing page is working!"
