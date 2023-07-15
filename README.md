# Docker build combining R and Python

This Docker build combines the Subramaniam Lab R and Python environments built in https://github.com/rasilab/python/pkgs/container/r and https://github.com/rasilab/python/pkgs/container/python.
See [Dockerfile](./Dockerfile) for build details.

We use this build for interactive analysis inside a Singularity container started on the Fred Hutch cluster.

Use the separate R and Python containers for Snakemake workflows.

The image version corresponds to the R and Python image version numbers.

## How to use the Singularity container for interactive data analysis in R and Python

***Do the remote operations below from within a [`tmux`](https://www.redhat.com/sysadmin/introduction-tmux-linux) session so that you can detach and logout of your remote session and still keep the container running.***

- Pull the Singularity container from the Subramaniam lab GitHub Packages Repo:

```
module load Singularity
cd /fh/scratch/delete90/subramaniam_a/user/rasi/singularity/
singularity pull --name r_python:1.1.0.simg docker://ghcr.io/rasilab/r_python:1.1.0
```

- Make sure that any `conda` initialization is commented out in your `.bashrc` or `.bash_profile` file on the remote machine. This step is **important**. Otherwise, VScode will not recognize the `conda` environments within the Singularity container.

- Start an interactive Singularity container using the above image while mounting the cluster filesystem:

```
singularity exec -B /fh r_python\:1.1.0.simg /bin/bash
```

- Start a VScode CLI tunnel from within the container:

```
./code tunnel
```

- If you are doing the above the first time, you will have to login to GitHub using the displayed code and also name the tunnel.

- Install [Remote Tunnels](https://code.visualstudio.com/docs/remote/tunnels) extension on your local machine.

- Use the [`Remote Tunnels: Connect to Tunnel`](https://code.visualstudio.com/docs/remote/tunnels#_remote-tunnels-extension) command to connect to the tunnel you created and named above.

- You can open any folder on the remote machine and create a Jupyter notebook.

- You should be able to pick the Python interpreter at `/opt/conda/bin/python` or the Jupyter R kernel at `/opt/conda/envs/R/lib/R/bin/R` to run your Python or R notebook.
