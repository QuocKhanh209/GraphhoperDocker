#!/bin/bash
set -e

echo "Stopping old containers..."
docker-compose -f docker-compose.graphhoper.yml down

echo "Removing old graphhopper-data volume..."
docker volume rm $(docker volume ls -q --filter name=graphhopper-data)

echo "Rebuilding docker images..."
docker-compose -f docker-compose.graphhoper.yml build

echo "Starting containers..."
docker-compose -f docker-compose.graphhoper.yml up -d

echo "Done. GraphHopper restarted successfully!"
