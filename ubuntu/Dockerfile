FROM ubuntu:24.04

ARG RUNNER_VERSION=2.327.1
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt upgrade -y && useradd -m docker
RUN apt install -y --no-install-recommends \
    curl \
    jq \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3 \
    python3-venv \
    python3-dev \
    python3-pip \
    libicu-dev

RUN mkdir -p /home/docker/actions-runner \
    && cd /home/docker/actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

RUN rm -rf actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
RUN /home/docker/actions-runner/bin/installdependencies.sh
RUN chown -R docker ~docker

COPY start.sh start.sh

RUN chmod +x start.sh

USER docker

ENTRYPOINT [ "./start.sh" ]
