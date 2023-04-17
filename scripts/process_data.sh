#!/bin/bash

mkdir -p data/input

chmod +x scripts/data/*.sh

./scripts/data/aaec.sh
./scripts/data/ibm1.sh
./scripts/data/ibm2.sh
./scripts/data/sciarg.sh
./scripts/data/ukp.sh
