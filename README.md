These are basic scripts for running Ray.io with slurm

Hopefully, just update the environment variables in `env.sh` to match your environment and you should be good to go.

One item - right now, you'll want to modify the times / partitions in each `*.sbatch` file to better match your environment and what you want to do.

To use, once you've edited the files to match your environment, submit `start-head.sbatch` to slurm.  Once the job starts running, run one of the `*-worker.sbatch` files to run a Ray worker which will connect to the ray head.  You can submit the workers multiple times to get more GPUs.
