#!/bin/bash
#git clone https://github.com/UKPLab/acl2017-neural_end2end_am.git
#mv acl2017-neural_end2end_am data/

# Preprocess Argument Annotated Essay Corpus (AAEC)
mkdir -p data/orig/ibm1
rm "IBM_Debater_(R)_CE-ACL-2014.v0.zip"
wget --no-check-certificate 'https://research.ibm.com/haifa/dept/vst/files/IBM_Debater_(R)_CE-ACL-2014.v0.zip'
mv "IBM_Debater_(R)_CE-ACL-2014.v0.zip" data/orig/ibm1/
unzip "data/orig/ibm1/IBM_Debater_(R)_CE-ACL-2014.v0.zip"
mkdir -p "IBM_Debater_(R)_CE-ACL-2014.v0/articles"
tar -xf "IBM_Debater_(R)_CE-ACL-2014.v0/wiki12_articles.tar" -C "IBM_Debater_(R)_CE-ACL-2014.v0/articles"
rm -rf data/ibm1/
mkdir -p data/ibm1/
mv IBM_Debater_\(R\)_CE-ACL-2014.v0/* data/ibm1
rm -rf IBM_Debater_\(R\)_CE-ACL-2014.v0

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

# rm -rf data/aaec/
