#!/bin/bash
#$ -cwd

module load apps/binapps/pytorch/1.11.0-39-gpu-cu113
module load tools/env/proxy2

# create venv
conda create -n typ python=3.8
source activate typ

# install requirements
./scripts/install.sh


