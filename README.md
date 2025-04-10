## Install

### Install (docker)
```
.\scripts\build_docker.sh
```

Note that all tensorboard graphs will be stored in the docker container so you have to enter the container to get the files for plotting.

### Install (without docker)

```
conda env create -f conda_env.yml
pip install -e .[docs,tests,extra]
cd custom_dmcontrol
pip install -e .
cd custom_dmc2gym
pip install -e .
pip install git+https://github.com/rlworkgroup/metaworld.git@master#egg=metaworld
pip install pybullet
pip install loralib
```

### Run code

To run the code without docker you can use the command:
```
./scripts/run_walker_flora_surf.sh 
./scripts/run_walker_surf.sh 
./scripts/run_walker_flora.sh 
./scripts/run_walker_finetune.sh 
```

If you're using docker you can run the scripts with:
```
.\scripts\run_docker_gpu.sh ./scripts/run_walker_flora_surf.sh 
.\scripts\run_docker_gpu.sh ./scripts/run_walker_surf.sh 
.\scripts\run_docker_gpu.sh ./scripts/run_walker_flora.sh 
.\scripts\run_docker_gpu.sh ./scripts/run_walker_finetune.sh 
```

### Troubleshooting
In run_docker_gpu.sh we had to use winpty in order to run it in the command line. In Linux it should not be needed.

