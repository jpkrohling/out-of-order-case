#!/bin/bash

echo Building the container image
podman build -t out-of-order-container-image .

echo Building the agent image
podman build -t out-of-order-agent-image -f agent.Dockerfile .

echo Building the collector image
podman build -t out-of-order-collector-image -f collector.Dockerfile .

