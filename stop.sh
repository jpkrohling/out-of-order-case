#!/bin/bash

for i in $(seq 0 5) 
do
    echo Removing pod $i
    port=$((3000+i))
    podman pod stop out-of-order-pod-$i
    podman pod rm out-of-order-pod-$i
done

podman pod stop collector-pod
podman pod rm collector-pod

podman network rm out-of-order-network
