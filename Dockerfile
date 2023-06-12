# base image
FROM ubuntu:22.04

ARG RUNNER_VERSION=2.304.0

# update the base packages + add a non-sudo user
RUN apt-get update -y && apt-get install -y curl && useradd -m docker

WORKDIR /home/docker/actions-runner

# # Download the latest runner package
RUN curl -s -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
RUN tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# install some additional dependencies
RUN chown -R docker ~docker && /home/docker/actions-runner/bin/installdependencies.sh

# add over the start.sh script
COPY start.sh start.sh

# make the script executable
RUN chmod +x start.sh

USER docker

# set the entrypoint to the start.sh script
CMD ["./start.sh"]
