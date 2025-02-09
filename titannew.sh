#!/bin/bash

sudo ufw allow 1234
sudo ufw allow 55702
sudo ufw allow 48710
docker stop titan-edge-container
docker rm titan-edge-container

# Pull the Titan Docker image
docker pull nezha123/titan-edge

# Create the Titan directory
mkdir -p ~/.titanedge

# Change to that directory
cd ~/.titanedge

# Run the Titan Docker container with a specific name
docker run --network=host -d -v ~/.titanedge:/root/.titanedge --name titan-edge-container nezha123/titan-edge

# Prompt for Titan identity code
echo -e "Enter your Titan identity code: "
read identity_code  # Read input from the user

# Bind the identity code to the device
docker run --rm -it -v ~/.titanedge:/root/.titanedge nezha123/titan-edge bind --hash="$identity_code" https://api-test1.container1.titannet.io/api/v2/device/binding

# Success message
echo "Titan identity successfully bound!"
