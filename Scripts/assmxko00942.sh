#!/bin/bash


/data/project/flowers/./diamond blastx -p 10 -f 6 --more-sensitive --query-cover 60 --evalue 0.000001 --id 60 -q ../../readsxtranscriptomes/Uame-Purple-2dez2016-selected.renamed.fa  -d ko00942.dmnd -o ko00942xUame-Purple_assm_id60_moresensitive_cov60_evalue10-6

/data/project/flowers/./diamond blastx -p 10 -f 6 --more-sensitive --query-cover 60 --evalue 0.000001 --id 60 -q ../../readsxtranscriptomes/Uame-White-2dez2016-selected.renamed.fa -d ko00942.dmnd -o ko00942xUame-White_assm_id60_moresensitive_cov60_evalue10-6

/data/project/flowers/./diamond blastx -p 10 -f 6 --more-sensitive --query-cover 60 --evalue 0.000001 --id 60 -q ../../readsxtranscriptomes/Uame-Yellow-2dez2016-selected.renamed.fa -d ko00942.dmnd -o ko00942xUame-Yellow_assm_id60_moresensitive_cov60_evalue10-6

/data/project/flowers/./diamond blastx -p 10 -f 6 --more-sensitive --query-cover 60 --evalue 0.000001 --id 60 -q ../../readsxtranscriptomes/Utri-Yellow-2dez2016-selected.renamed.fa -d ko00942.dmnd -o ko00942xUtri-Yellow_assm_id60_moresensitive_cov60_evalue10-6


