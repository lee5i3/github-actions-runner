#!/bin/bash

# Create the runner and start the configuration experience
./config.sh --unattended --url ${GITHUB_URL} --token ${GITHUB_TOKEN} --name ${RUNNER_NAME}

# Last step, run it!
./run.sh
