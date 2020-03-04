#!/bin/bash

module load pytorch/v1.2.0-gpu 
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

echo "starting ray head node"
# Launch the head node
/global/homes/m/mustafa/.local/cori/pytorchv1.2.0-gpu/bin/ray start --head --node-ip-address=$1 --redis-port=6379 --redis-password=$2
sleep infinity