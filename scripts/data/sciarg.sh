#!/bin/bash

SAVE_DIR=data/input/sciarg

# Preprocess Sciarg Corpus
mkdir -p data/orig/sciarg
rm "compiled_corpus.zip"
wget 'https://data.dws.informatik.uni-mannheim.de/sci-arg/compiled_corpus.zip'
mv "compiled_corpus.zip" data/orig/sciarg/
unzip "data/orig/sciarg/compiled_corpus.zip"
rm -rf data/sciarg/
mkdir -p data/sciarg/
mv compiled_corpus/* data/sciarg/
rm -rf compiled_corpus/

# Essay-level
python -m aextract.process.sciarg \
	--dir_aaec data/aaec/ArgumentAnnotatedEssays-2.0/brat-project-final \
	--prefix AAEC_ \
	--seed 42 \
	--dev_rate 0.1 \
	--level essay \
	--dir_output ${SAVE_DIR}

rm -rf data/sciarg
