# GraphHopper Docker Setup

This project sets up a GraphHopper server using Docker Compose. Follow the steps below to get started.

## Prerequisites

- Docker installed on your system.
- Docker Compose installed on your system.

## Project Structure

- `DockerFile`: Defines the Docker image for the GraphHopper server.
- `docker-compose.graphhoper.yml`: Docker Compose configuration file.
- `config.yml`: Configuration file for GraphHopper.
- `entrypoint.sh`: Script to download OSM data and start the GraphHopper server.
- `graphhopper-web-10.2.jar`: GraphHopper JAR file.
- `HaNoi.osm.pbf`: Example OSM data file (replace with your own data if needed).

## Steps to Run

1. **Clone the Repository**
   
   Clone this repository to your local machine.
2. **Prepare Data Directories**
   
   Ensure the following directories exist and are properly configured:
   
   - `/app/data` for storing graph-cache and OSM data.
3. **Build and Start the Docker Container**
   
   Run the following command to build and start the container:
   
   ```sh
   docker-compose -f docker-compose.graphhoper.yml up -d
   ```

