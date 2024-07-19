#!/bin/bash

#SBATCH --time=1-00:00:00
#SBATCH --partition=cpu

### This script works for any number of nodes, Ray will find and manage all resources
#SBATCH --nodes=1

### Give all resources on each node to a single Ray task, ray can manage the resources internally
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#memory is in MB, will be multiplied by 1024^2 for ray
#SBATCH --mem=8192

source ./env.sh

#send ray logs to stderr, via https://github.com/ray-project/ray/pull/21767
# and https://github.com/ray-project/ray/pull/21767/commits/64231b573932cb574dc7c8261d13a4358ee86ca3
#but does not work on head https://github.com/ray-project/kuberay/issues/353
#export RAY_LOG_TO_STDERR=1

echo "starting ray head node"
# Launch the head node

head_node=$(hostname)
head_node_ip=$(hostname --ip-address)

echo $head_node_ip > $HEAD_NODE_FILE

#memory is in kb; sticking with ray defaults of 30% memory for object store and 70% for everything else
# probably not necessary but being very explicit

apptainer run --bind /hpc:/hpc --bind /tmp:/tmp $CONTAINER_IMAGE_FILE ray start --head   --dashboard-host $head_node_ip --memory $(expr $SLURM_MEM_PER_NODE \* 1024 \* 1024 \*  7 \/ 10) --object-store-memory $(expr $SLURM_MEM_PER_NODE \* 1024 \* 1024 \* 3 \/ 10) --num-cpus $SLURM_CPUS_ON_NODE --port=6379 --block 
