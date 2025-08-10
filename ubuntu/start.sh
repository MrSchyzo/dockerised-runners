#!/bin/bash

# Relies on REPO and ACCESS_TOKEN being defined

TOKEN=$(curl -X POST -H "Authorization: token ${ACCESS_TOKEN}" -H "Accept: application/vnd.github+json" https://api.github.com/repos/${REPO}/actions/runners/registration-token | jq .token --raw-output)

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --token $TOKEN
}
trap cleanup SIGTERM SIGINT SIGQUIT

cd /home/docker/actions-runner

./config.sh --url https://github.com/$REPO --token $TOKEN

./run.sh
