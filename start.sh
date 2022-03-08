#!/bin/bash

podman network create out-of-order-network
podman pod create --name collector-pod -p 4317:4317 --network out-of-order-network
podman run --pod collector-pod -dt --rm --name otelcol out-of-order-collector-image

for i in $(seq 0 5) 
do
    echo Starting container $i
    port=$((3000+i))
    podman pod create --name out-of-order-pod-$i -p $port:3000 --network out-of-order-network
    podman run --pod out-of-order-pod-$i -dt --rm --name out-of-order-container-$i out-of-order-container-image
    podman run --pod out-of-order-pod-$i -dt --rm --name agent-$i out-of-order-agent-image
done
