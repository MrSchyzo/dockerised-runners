#!/bin/bash

# Relies on REPO and TOKEN being defined
cd /home/docker/actions-runner

./config.sh --url https://github.com/$REPO --token $TOKEN

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --token $TOKEN
}

trap cleanup SIGTERM SIGINT SIGQUIT

./run.sh
