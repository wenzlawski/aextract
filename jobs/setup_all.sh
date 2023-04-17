#!/bin/bash --login
#$ -cwd

# load modules
module load apps/binapps/pytorch/1.11.0-39-gpu-cu113
module load tools/env/proxy2

source activate typ

# initialise the environment
./scripts/setup_all.sh