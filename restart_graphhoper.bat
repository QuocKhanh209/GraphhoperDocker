@echo off
echo Stopping old containers...
docker-compose -f docker-compose.graphhoper.yml down

echo Removing old graphhopper-data volume...
FOR /f "tokens=*" %%i IN ('docker volume ls -q --filter name=graphhopper-data') DO docker volume rm %%i

echo Rebuilding docker images...
docker-compose -f docker-compose.graphhoper.yml build

echo Starting containers...
docker-compose -f docker-compose.graphhoper.yml up -d

echo Done! GraphHopper restarted successfully!
pause
