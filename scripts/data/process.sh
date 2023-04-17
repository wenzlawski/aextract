#!/bin/bash
# Script to pre-process all data.

DATA_DIR=./data/orig/
SAVE_DIR=./data/input/

mkdir -p ${SAVE_DIR}

# Pre-process dataset
python -m aextract.process \
  --fname ${DATA_DIR}/train/${CORPUS}_train.jsonl \
  --output ${SAVE_DIR}/${CORPUS}_train.jsonl \
  --lex_sent 25 \
  # --entries 1

echo "------ Finished pre-processing ${CORPUS} ------"

# Split into train and val
python -m aextract.process \
  --fname ${DATA_DIR}/val/${CORPUS}_val.jsonl \
  --output ${SAVE_DIR}/${CORPUS}_val.jsonl \
  --lex_sent 25 \
  # --entries 1

echo "------ Finished splitting of ${CORPUS} ------"
