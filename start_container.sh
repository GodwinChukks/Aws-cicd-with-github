#!/bin/bash
set -e

sudo su - root

# pull the Docker image from Docker Hub
docker pull godwinchukks/simple-python-flask-app

# run the docker image as container
docker run -d -p 5000:5000 godwinchukks/simple-python-flask-app