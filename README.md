These are basic scripts for running Ray.io with slurm

To run, try the following
```#pull the container image```
```apptainer pull docker://container-image  //your/output-file.sif```
```#example: apptainer pull docker://rayproject/ray:latest-gpu $MYDATA/ray_latest-gpu.sif```
```#update env.sh to point to your container file```
```#edit submit files to match partitions and times you need```
```#submit job to slurm to start head```
```sbatch start-head.sbatch```
```#wait for job to start```
```#submit worker nodes to slurm```
```sbatch  gpu-start-worker.sbatch```
```#wait for worker to start```
```#you can check the cluster is up by running```
```#which runs ray status inside the container```
```check.sh```

One item - right now, you'll want to modify the times / partitions in each `*.sbatch` file to better match your environment and what you want to do.

To use, once you've edited the files to match your environment, submit `start-head.sbatch` to slurm.  Once the job starts running, run one of the `*-worker.sbatch` files to run a Ray worker which will connect to the ray head.  You can submit the workers multiple times to get more GPUs.
