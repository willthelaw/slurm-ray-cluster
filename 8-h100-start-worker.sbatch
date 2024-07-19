#!/bin/bash

#SBATCH --partition gpu
#SBATCH --time=00:30:00

### This script works for any number of nodes, Ray will find and manage all resources
#SBATCH --nodes=1

### Give all resources on each node to a single Ray task, ray can manage the resources internally
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-task=8
SBATCH --constraint=h100
#SBATCH --cpus-per-task=8


#get head node
this_node_ip=`hostname --ip-address`

#send ray logs to stderr, via https://github.com/ray-project/ray/pull/21767
# and https://github.com/ray-project/ray/pull/21767/commits/64231b573932cb574dc7c8261d13a4358ee86ca3
#but does not work on head https://github.com/ray-project/kuberay/issues/353

source ./env.sh

env 

echo "starting ray worker node"
apptainer run --nv --bind /hpc:/hpc --bind /tmp:/tmp $CONTAINER_IMAGE_FILE ray start --node-ip-address $this_node_ip --num-cpus $SLURM_CPUS_ON_NODE --num-gpus $SLURM_GPUS_ON_NODE  --address `cat $HEAD_NODE_FILE`:6379 --block
