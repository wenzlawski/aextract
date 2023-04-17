#!/bin/bash

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
# python -m utils.converter.aaec2mrp \
# 	--dir_aaec data/aaec/ArgumentAnnotatedEssays-2.0/brat-project-final \
# 	--prefix AAEC_ \
# 	--seed 42 \
# 	--dev_rate 0.1 \
# 	--level essay \
# 	--dir_output ${SAVE_DIR}
#
# # Paragraph-level
# python -m utils.converter.aaec2mrp \
# 	--dir_aaec data/aaec/ArgumentAnnotatedEssays-2.0/brat-project-final \
# 	--prefix AAECPARA_ \
# 	--seed 42 \
# 	--dev_rate 0.1 \
# 	--level para \
# 	--dir_output ${SAVE_DIR}
#
# cat ${SAVE_DIR}/aaec_essay_train.mrp ${SAVE_DIR}/aaec_essay_dev.mrp >${SAVE_DIR}/aaec_essay_train_dev.mrp
# cat ${SAVE_DIR}/aaec_para_train.mrp ${SAVE_DIR}/aaec_para_dev.mrp >${SAVE_DIR}/aaec_para_train_dev.mrp
