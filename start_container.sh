#!/bin/bash
set -e

# Debugging: Log environment details
echo "Current PATH: $PATH"
echo "Checking Docker location..."
which docker || { echo "Docker is not in PATH"; exit 1; }
docker --version || { echo "Docker is not accessible"; exit 1; }

# Start Docker service if not already running
if ! systemctl is-active --quiet docker; then
    echo "Starting Docker service..."
    sudo systemctl start docker
fi

# Pull the Docker image from Docker Hub
echo "Pulling Docker image: godwinchukks/simple-python-flask-app"
docker pull godwinchukks/simple-python-flask-app

# Run the Docker container
echo "Running Docker container..."
docker run -d -p 5000:5000 godwinchukks/simple-python-flask-app
