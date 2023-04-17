#!/bin/bash

export CORPUS=ibm2
./scripts/data/process.sh

#!/bin/bash
#git clone https://github.com/UKPLab/acl2017-neural_end2end_am.git
#mv acl2017-neural_end2end_am data/

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
