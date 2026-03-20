FROM maven:3.9.11-eclipse-temurin-21

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        curl \
        docker.io \
        git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
