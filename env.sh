#!/bin/bash

#set this to the path to your container image
#to pull a new container, for example, do:
#apptainer pull docker://rayproject/ray:latest-gpu
#which will create a file called ray_latest-gpu.sif
#in your current working directory
export CONTAINER_IMAGE_FILE=$MYDATA/ray_latest-gpu.sif

#use "computer english"
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

export HEAD_NODE_FILE=$MYDATA/.ray_head_node

#send ray logs to stderr, via https://github.com/ray-project/ray/pull/21767
# and https://github.com/ray-project/ray/pull/21767/commits/64231b573932cb574dc7c8261d13a4358ee86ca3
#but does not work on head https://github.com/ray-project/kuberay/issues/353
#export RAY_LOG_TO_STDERR=1


