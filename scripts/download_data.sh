#!/bin/bash

mkdir -p data/orig

wget -P data/orig 'https://tudatalib.ulb.tu-darmstadt.de/bitstream/handle/tudatalib/2430/UKP-InsufficientArguments_v1.0.zip'
wget -P data/orig 'https://tudatalib.ulb.tu-darmstadt.de/bitstream/handle/tudatalib/2422/ArgumentAnnotatedEssays-2.0.zip'
wget -P data/orig 'https://research.ibm.com/haifa/dept/vst/files/IBM_Debater_(R)_CE-EMNLP-2015.v3.zip'
wget -P data/orig 'https://research.ibm.com/haifa/dept/vst/files/IBM_Debater_(R)_CE-ACL-2014.v0.zip'
wget -P data/orig 'https://data.dws.informatik.uni-mannheim.de/sci-arg/compiled_corpus.zip'