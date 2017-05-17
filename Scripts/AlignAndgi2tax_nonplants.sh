#!/bin/bash

#../.././diamond blastx -p 10 --query-cover 80 --evalue 0.001 --id 80 -q ../trinity_Uame-Purple/Trinity.fasta -d ../../ncbi_nr.dmnd -o Uame-Purplexnr_cov80_id80.daa -f 100
#../.././diamond blastx -p 10 --query-cover 80 --evalue 0.001 --id 80 -q ../trinity_Uame-White/Trinity.fasta -d ../../ncbi_nr.dmnd -o Uame-Whitexnr_cov80_id80.daa -f 100
#../.././diamond blastx -p 10 --query-cover 80 --evalue 0.001 --id 80 -q ../trinity_Uame-Yellow/Trinity.fasta -d ../../ncbi_nr.dmnd -o Uame-Yellowxnr_cov80_id80.daa -f 100
#../.././diamond blastx -p 10 --query-cover 80 --evalue 0.001 --id 80 -q ../trinity_Utri-Yellow/Trinity.fasta -d ../../ncbi_nr.dmnd -o Utri-Yellowxnr_cov80_id80.daa -f 100

diamond view -a Uame-Purplexnr_cov80_id80.daa -f sam -o Uame-Purplexnr.sam
diamond view -a Uame-Whitexnr_cov80_id80.daa -f sam -o Uame-Whitexnr.sam
diamond view -a Uame-Whitexnr_cov80_id80.daa -f sam -o Uame-Yellowxnr.sam
diamond view -a Utri-Yellowxnr_cov80_id80.daa -f sam -o Utri-Yellowxnr.sam


/usr/local/bioinfo/megan/tools/sam2rma -i Uame-Purplexnr.sam -g2t gi2tax-Feb2016X.bin -out Uame-Purplexnr.rma
/usr/local/bioinfo/megan/tools/sam2rma -i Uame-Purplexnr.sam -g2t gi2tax-Feb2016X.bin --out Uame-Purplexnr.rma
/usr/local/bioinfo/megan/tools/sam2rma -i Uame-Whitexnr.sam -g2t gi2tax-Feb2016X.bin --out Uame-Whitexnr.rma
/usr/local/bioinfo/megan/tools/sam2rma -i Uame-Yellowxnr.sam -g2t gi2tax-Feb2016X.bin --out Uame-Yellowxnr.rma
/usr/local/bioinfo/megan/tools/sam2rma -i Utri-Yellowxnr.sam -g2t gi2tax-Feb2016X.bin --out Utri-Yellowxnr.rma


