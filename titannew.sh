#!/bin/bash

sudo ufw allow 1234
sudo ufw allow 55702
sudo ufw allow 48710
docker stop titan-edge-container
docker rm titan-edge-container

#!/bin/bash

# Pull the Titan Docker image
docker pull nezha123/titan-edge

# Create the Titan directory
mkdir -p ~/.titanedge

# Change to that directory
cd ~/.titanedge

# Run the Titan Docker container with a specific name
docker run --network=host -d -v ~/.titanedge:/root/.titanedge --name titan-edge-container nezha123/titan-edge
