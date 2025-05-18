
# FLoRA

Official codebase for [FLoRA: Sample-Efficient Preference-based RL via Low-Rank Style Adaptation of Reward Functions](https://arxiv.org/abs/2504.10002).  
This repository includes installation instructions and scripts to reproduce our experiments.

- 📹 For videos of our policies, visit the [project website](https://sites.google.com/view/preflora/).  
- 🧠 Our backbone RL policies are based on [stable-baselines3](https://github.com/Stable-Baselines-Team/stable-baselines3-contrib).

---

## 🛠 Install

We provide two installation options: one using Docker, and another using Anaconda.

### Option 1: Docker

```bash
./scripts/build_docker.sh
```

**Note:** All TensorBoard logs and graphs are stored inside the Docker container.  
To access them, you’ll need to enter the container and copy the files manually.

### Option 2: Anaconda (without Docker)

```bash
conda env create -f conda_env.yml
pip install -e .[docs,tests,extra]

cd custom_dmcontrol
pip install -e .

cd ../custom_dmc2gym
pip install -e .

pip install git+https://github.com/rlworkgroup/metaworld.git@master#egg=metaworld
pip install pybullet
pip install loralib
```

---

## 🚀 Running Experiments

### With Docker

Use the following commands:

```bash
./scripts/run_docker_gpu.sh ./scripts/run_walker_flora_surf.sh 
./scripts/run_docker_gpu.sh ./scripts/run_walker_surf.sh 
./scripts/run_docker_gpu.sh ./scripts/run_walker_flora.sh 
./scripts/run_docker_gpu.sh ./scripts/run_walker_finetune.sh 
```

### Without Docker

Directly run:

```bash
./scripts/run_walker_flora_surf.sh 
./scripts/run_walker_surf.sh 
./scripts/run_walker_flora.sh 
./scripts/run_walker_finetune.sh 
```

### Manual Execution

After installation, you can manually run training using the following command.  
We provide several checkpoints for the Walker reward model.

Example (default parameters):

```bash
python train_PEBBLE.py env=walker_walk seed=$seed use_lora=true rank=16 lora_alpha=16 using_surf=false pretrained_model=true model_name=walker_reward_model agent.params.actor_lr=0.0005 agent.params.critic_lr=0.0005 gradient_update=1 activation=tanh num_unsup_steps=9000 num_train_steps=1000000 num_interact=20000 max_feedback=50 reward_batch=5 reward_update=50 feed_type=$1 teacher_beta=-1 teacher_gamma=1 teacher_eps_mistake=0.1 teacher_eps_skip=0 teacher_eps_equal=0
```

Parameters can also be passed via the config file: `config/train.yaml`.

- 📖 For recommended hyperparameters for FLoRA, refer to our paper.  
- 🔗 For PEBBLE and Surf, see [BPref](https://github.com/rll-research/BPref/), a codebase for preference-based reinforcement learning.

---

## ❗ Troubleshooting

- On **Windows**, you may need to use `winpty` with `run_docker_gpu.sh` to execute it properly from the command line.
- On **Linux**, this is typically not required.
