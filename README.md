# FLoRA

Official codebase for [FLoRA: Sample-Efficient Preference-based RL via Low-Rank
Style Adaptation of Reward Functions](https://arxiv.org/). Contains installation instructions and scripts to reproduce experiments. For videos of our policies check the [project's website](https://sites.google.com/view/preflora/). Our backbone RL policies are derived from [stable-baselines3](https://github.com/Stable-Baselines-Team/stable-baselines3-contrib).

## Install

We provide two installation options: one using Docker and another using Anaconda.

### Install (docker)
```
.\scripts\build_docker.sh
```
Note: All TensorBoard logs and graphs will be stored inside the Docker container. To access them for plotting or analysis, you’ll need to enter the container and copy the files out manually.

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

## Running experiments

### Running scripts on docker

If you're using docker you can run the scripts with:
```
.\scripts\run_docker_gpu.sh ./scripts/run_walker_flora_surf.sh 
.\scripts\run_docker_gpu.sh ./scripts/run_walker_surf.sh 
.\scripts\run_docker_gpu.sh ./scripts/run_walker_flora.sh 
.\scripts\run_docker_gpu.sh ./scripts/run_walker_finetune.sh 
```

### Running scripts without docker

To run the code without docker you can use the command:
```
./scripts/run_walker_flora_surf.sh 
./scripts/run_walker_surf.sh 
./scripts/run_walker_flora.sh 
./scripts/run_walker_finetune.sh 
```

### Running without scripts

After installation, you can run the scripts manually. We provide several checkpoints for a reward model for the Walker environment. To run manually on defaul parameters:

```
python train_PEBBLE.py env=walker_walk seed=$seed use_lora=true rank=16 lora_alpha=16 using_surf=false pretrained_model=true model_name=walker_reward_model agent.params.actor_lr=0.0005 agent.params.critic_lr=0.0005 gradient_update=1 activation=tanh num_unsup_steps=9000 num_train_steps=1000000 num_interact=20000 max_feedback=50 reward_batch=5 reward_update=50 feed_type=$1 teacher_beta=-1 teacher_gamma=1 teacher_eps_mistake=0.1 teacher_eps_skip=0 teacher_eps_equal=0

```

The parameters can be passed as arguments to `train.PEBBLE.py` via `config/train.yaml`.  
For recommended hyperparameters for FLoRA, please refer to our paper.  
For recommended hyperparameters for PEBBLE and Surf, see [BPref](https://github.com/rll-research/BPref/), a codebase for preference-based reinforcement learning.


### Troubleshooting
In run_docker_gpu.sh we had to use winpty in order to run it in the command line. In Linux it should not be needed.

