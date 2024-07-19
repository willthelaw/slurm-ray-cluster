These are basic scripts for running Ray.io with slurm<br> <br><br>
To run, try the following<br>
```#pull the container image```<br>
```apptainer pull docker://container-image  //your/output-file.sif```<br>
```#example: apptainer pull docker://rayproject/ray:latest-gpu $MYDATA/ray_latest-gpu.sif```<br>
```#update env.sh to point to your container file```<br>
```#edit submit files to match partitions and times you need```<br>
```#submit job to slurm to start head```<br>
```sbatch start-head.sbatch```<br>
```#wait for job to start```<br>
```#submit worker nodes to slurm```<br>
```sbatch  gpu-start-worker.sbatch```<br>
```#wait for worker to start```<br>
```#you can check the cluster is up by running```<br>
```#which runs ray status inside the container```<br>
```check.sh```<br>
<br>
One item - right now, you'll want to modify the times / partitions in each `*.sbatch` file to better match your environment and what you want to do.
<br><br>
To use, once you've edited the files to match your environment, submit `start-head.sbatch` to slurm.  Once the job starts running, run one of the `*-worker.sbatch` files to run a Ray worker which will connect to the ray head.  You can submit the workers multiple times to get more GPUs.
