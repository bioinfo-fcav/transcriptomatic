#!/bin/bash

for fastq in ../../processed/prinseq/U*_B*.scythe.cutadapt.prinseq_1.fastq

do

fastqc $fastq -f fastq -o /work/projects/flowers/FastQC/pos

done

for fastq2 in ../../processed/prinseq/U*_B*.scythe.cutadapt.prinseq_2.fastq

do

fastqc $fastq2 -f fastq -o /work/projects/flowers/FastQC/pos

done

