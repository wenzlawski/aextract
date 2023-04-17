#!/bin/bash
# Download all datasets

rm -rf data/*

./scripts/download_data.sh

find data/orig -iname "*.zip" -execdir unzip "{}" \;

rm -rf data/orig/__MACOSX

mv 'data/orig/compiled_corpus' data/orig/sciarg
mv 'data/orig/IBM_Debater_(R)_CE-EMNLP-2015.v3' data/orig/ibm2
mv 'data/orig/IBM_Debater_(R)_CE-ACL-2014.v0' data/orig/ibm1
mv 'data/orig/ArgumentAnnotatedEssays-2.0' data/orig/aaec
mv 'data/orig/UKP-InsufficientArguments_v1.0' data/orig/ukp

unzip data/orig/aaec/brat-project-final.zip -d data/orig/aaec