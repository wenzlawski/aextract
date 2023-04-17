#!/bin/bash

SAVE_DIR=data/input/ukp

# Preprocess Argument Annotated Essay Corpus (AAEC)
mkdir -p data/orig/ukp
rm "UKP-InsufficientArguments_v1.0.zip"
wget 'https://tudatalib.ulb.tu-darmstadt.de/bitstream/handle/tudatalib/2430/UKP-InsufficientArguments_v1.0.zip'
mv "UKP-InsufficientArguments_v1.0.zip" data/orig/ukp/
unzip "data/orig/ukp/UKP-InsufficientArguments_v1.0.zip"
rm -rf data/ukp/
mkdir -p data/ukp/
mv UKP-InsufficientArguments_v1.0/* data/ukp
rm -rf UKP-InsufficientArguments_v1.0
rm -rf __MACOSX

# Essay-level
python -m aextract.process.ukp \
	--dir_aaec data/aaec/ArgumentAnnotatedEssays-2.0/brat-project-final \
	--prefix AAEC_ \
	--seed 42 \
	--dev_rate 0.1 \
	--level essay \
	--dir_output ${SAVE_DIR}

rm -rf data/ukp
