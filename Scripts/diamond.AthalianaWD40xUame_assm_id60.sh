#!/bin/bash

#/data/project/flowers/./diamond makedb --in WD-40_Ath_pep-filtered.fasta -d WD40_Athaliana.dmnd

/data/project/flowers/./diamond blastx -p 10 -f 6 --more-sensitive --query-cover 60 --evalue 0.000001 --id 60 -q ../../readsxtranscriptomes/Uame-Purple-2dez2016-selected.renamed.fa -d WD40_Athaliana.dmnd -o WD40_AthalianaxUame-Purple_assm_id60_moresensitive_cov60

/data/project/flowers/./diamond blastx -p 10 -f 6 --more-sensitive --query-cover 60 --evalue 0.000001 --id 60 -q ../../readsxtranscriptomes/Uame-White-2dez2016-selected.renamed.fa -d WD40_Athaliana.dmnd -o WD40_AthalianaxUame-White_assm_id60_moresensitive_cov60

/data/project/flowers/./diamond blastx -p 10 -f 6 --more-sensitive --query-cover 60 --evalue 0.000001 --id 60 -q ../../readsxtranscriptomes/Uame-Yellow-2dez2016-selected.renamed.fa -d WD40_Athaliana.dmnd -o WD40_AthalianaxUame-Yellow_assm_id60_moresensitive_cov60

/data/project/flowers/./diamond blastx -p 10 -f 6 --more-sensitive --query-cover 60 --evalue 0.000001 --id 60 -q ../../readsxtranscriptomes/Uame-Purple-2dez2016-selected.renamed.fa -d WD40_Athaliana.dmnd -o WD40_AthalianaxUtri-Yellow_assm_id60_moresensitive_cov60


