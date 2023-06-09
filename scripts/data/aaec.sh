#!/bin/bash

SAVE_DIR=data/input/aaec

# Preprocess Argument Annotated Essay Corpus (AAEC)
mkdir -p data/orig/aaec
wget --no-check-certificate https://tudatalib.ulb.tu-darmstadt.de/bitstream/handle/tudatalib/2422/ArgumentAnnotatedEssays-2.0.zip
rm -rf __MACOSX
rm -rf ArgumentAnnotatedEssays-2.0/
mv ArgumentAnnotatedEssays-2.0.zip data/orig/aaec/
unzip data/orig/aaec/ArgumentAnnotatedEssays-2.0.zip
cd ArgumentAnnotatedEssays-2.0 || exit
unzip brat-project-final.zip
cd ..
rm -rf data/aaec/
mkdir -p data/aaec/
mv ArgumentAnnotatedEssays-2.0 data/aaec
rm -rf __MACOSX

# Essay-level
python -m aextract.process.aaec \
	--dir_aaec data/aaec/ArgumentAnnotatedEssays-2.0/brat-project-final \
	--prefix AAEC_ \
	--seed 42 \
	--dev_rate 0.1 \
	--level essay \
	--dir_output ${SAVE_DIR}

# # Paragraph-level
# python -m utils.converter.aaec2mrp \
# --dir_aaec data/aaec/ArgumentAnnotatedEssays-2.0/brat-project-final \
# --prefix AAECPARA_ \
# --seed 42 \
# --dev_rate 0.1 \
# --level para \
# --dir_output ${SAVE_DIR}
#
# cat ${SAVE_DIR}/aaec_essay_train.mrp ${SAVE_DIR}/aaec_essay_dev.mrp > ${SAVE_DIR}/aaec_essay_train_dev.mrp
# cat ${SAVE_DIR}/aaec_para_train.mrp ${SAVE_DIR}/aaec_para_dev.mrp > ${SAVE_DIR}/aaec_para_train_dev.mrp

rm -rf data/aaec/
