#!/bin/bash

SAVE_DIR=data/input/ibm2

# Preprocess Argument Annotated Essay Corpus (AAEC)
mkdir -p data/orig/ibm2
rm "IBM_Debater_(R)_CE-EMNLP-2015.v3.zip"
wget 'https://research.ibm.com/haifa/dept/vst/files/IBM_Debater_(R)_CE-EMNLP-2015.v3.zip'
mv "IBM_Debater_(R)_CE-EMNLP-2015.v3.zip" data/orig/ibm2/
unzip "data/orig/ibm2/IBM_Debater_(R)_CE-EMNLP-2015.v3.zip"
unzip "IBM_Debater_(R)_CE-EMNLP-2015.v3/articles.zip" -d "IBM_Debater_(R)_CE-EMNLP-2015.v3/"
rm -rf data/ibm2/
mkdir -p data/ibm2/
mv IBM_Debater_\(R\)_CE-EMNLP-2015.v3/* data/ibm2
rm -rf IBM_Debater_\(R\)_CE-EMNLP-2015.v3

# Essay-level
python -m aextract.process.ibm2 \
	--dir_aaec data/aaec/ArgumentAnnotatedEssays-2.0/brat-project-final \
	--prefix AAEC_ \
	--seed 42 \
	--dev_rate 0.1 \
	--level essay \
	--dir_output ${SAVE_DIR}

rm -rf data/ibm2
