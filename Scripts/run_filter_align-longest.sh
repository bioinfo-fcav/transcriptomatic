#!/bin/bash

#cat Uame-Purple_map_B1.sam | grep -v "^@" | cut -f 1,3 | grep "*" | cut -f 1 | nsort | uniq > Uame-Purple_map_B1.nonalign.list
#cat Uame-Purple_map_B2.sam | grep -v "^@" | cut -f 1,3 | grep "*" | cut -f 1 | nsort | uniq > Uame-Purple_map_B2.nonalign.list
#cat Uame-Purple_map_B3.sam | grep -v "^@" | cut -f 1,3 | grep "*" | cut -f 1 | nsort | uniq > Uame-Purple_map_B3.nonalign.list

#cat Uame-White_map_B1.sam | grep -v "^@" | cut -f 1,3 | grep "*" | cut -f 1 | nsort | uniq > Uame-White_map_B1.nonalign.list
#cat Uame-White_map_B2.sam | grep -v "^@" | cut -f 1,3 | grep "*" | cut -f 1 | nsort | uniq > Uame-White_map_B2.nonalign.list
#cat Uame-White_map_B3.sam | grep -v "^@" | cut -f 1,3 | grep "*" | cut -f 1 | nsort | uniq > Uame-White_map_B3.nonalign.list

#cat Uame-Yellow_map_B1.sam | grep -v "^@" | cut -f 1,3 | grep "*" | cut -f 1 | nsort | uniq > Uame-Yellow_map_B1.nonalign.list
#cat Uame-Yellow_map_B2.sam | grep -v "^@" | cut -f 1,3 | grep "*" | cut -f 1 | nsort | uniq > Uame-Yellow_map_B2.nonalign.list

#cat Utri-Yellow_map_B1.sam | grep -v "^@" | cut -f 1,3 | grep "*" | cut -f 1 | nsort | uniq > Utri-Yellow_map_B1.nonalign.list

#mkdir pullseq_nonalign

#cd pullseq_nonalign

#pullseq -i /data/projects/flowers/assembled/renamed/Uame-Purple_B1.woc_1.fastq -n ../Uame-Purple_map_B1.nonalign.list > Uame-Purple_B1.woc_1_nonalign.fastq
#pullseq -i /data/projects/flowers/assembled/renamed/Uame-Purple_B1.woc_2.fastq -n ../Uame-Purple_map_B1.nonalign.list > Uame-Purple_B1.woc_2_nonalign.fastq

#pullseq -i /data/projects/flowers/assembled/renamed/Uame-Purple_B2.woc_1.fastq -n ../Uame-Purple_map_B2.nonalign.list > Uame-Purple_B2.woc_1_nonalign.fastq
#pullseq -i /data/projects/flowers/assembled/renamed/Uame-Purple_B2.woc_2.fastq -n ../Uame-Purple_map_B2.nonalign.list > Uame-Purple_B2.woc_2_nonalign.fastq

#pullseq -i /data/projects/flowers/assembled/renamed/Uame-Purple_B3.woc_1.fastq -n ../Uame-Purple_map_B3.nonalign.list > Uame-Purple_B3.woc_1_nonalign.fastq
#pullseq -i /data/projects/flowers/assembled/renamed/Uame-Purple_B3.woc_2.fastq -n ../Uame-Purple_map_B3.nonalign.list > Uame-Purple_B3.woc_2_nonalign.fastq

###Uame-White

#pullseq -i /data/projects/flowers/assembled/renamed/Uame-White_B1.woc_1.fastq -n ../Uame-White_map_B1.nonalign.list > Uame-White_B1.woc_1_nonalign.fastq
#pullseq -i /data/projects/flowers/assembled/renamed/Uame-White_B1.woc_2.fastq -n ../Uame-White_map_B1.nonalign.list > Uame-White_B1.woc_2_nonalign.fastq

#pullseq -i /data/projects/flowers/assembled/renamed/Uame-White_B2.woc_1.fastq -n ../Uame-White_map_B2.nonalign.list > Uame-White_B2.woc_1_nonalign.fastq
#pullseq -i /data/projects/flowers/assembled/renamed/Uame-White_B2.woc_2.fastq -n ../Uame-White_map_B2.nonalign.list > Uame-White_B2.woc_2_nonalign.fastq

#pullseq -i /data/projects/flowers/assembled/renamed/Uame-White_B3.woc_1.fastq -n ../Uame-White_map_B3.nonalign.list > Uame-White_B3.woc_1_nonalign.fastq
#pullseq -i /data/projects/flowers/assembled/renamed/Uame-White_B3.woc_2.fastq -n ../Uame-White_map_B3.nonalign.list > Uame-White_B3.woc_2_nonalign.fastq

###Uame-Yellow

#pullseq -i /data/projects/flowers/assembled/renamed/Uame-Yellow_B1.woc_1.fastq -n ../Uame-Yellow_map_B1.nonalign.list > Uame-Yellow_B1.woc_1_nonalign.fastq
#pullseq -i /data/projects/flowers/assembled/renamed/Uame-Yellow_B1.woc_2.fastq -n ../Uame-Yellow_map_B1.nonalign.list > Uame-Yellow_B1.woc_2_nonalign.fastq

#pullseq -i /data/projects/flowers/assembled/renamed/Uame-Yellow_B2.woc_1.fastq -n ../Uame-Yellow_map_B2.nonalign.list > Uame-Yellow_B2.woc_1_nonalign.fastq
#pullseq -i /data/projects/flowers/assembled/renamed/Uame-Yellow_B2.woc_2.fastq -n ../Uame-Yellow_map_B2.nonalign.list > Uame-Yellow_B2.woc_2_nonalign.fastq


###Utri-Yellow

#pullseq -i /data/projects/flowers/assembled/renamed/Utri-Yellow_B1.woc_1.fastq -n ../Utri-Yellow_map_B1.nonalign.list > Utri-Yellow_B1.woc_1_nonalign.fastq
#pullseq -i /data/projects/flowers/assembled/renamed/Utri-Yellow_B1.woc_2.fastq -n ../Utri-Yellow_map_B1.nonalign.list > Utri-Yellow_B1.woc_2_nonalign.fastq

#cd ..

#samtools view -h -Sb Uame-Purple_map_B1.sam > Uame-Purple_map_B1.bam
#samtools view -h -Sb Uame-Purple_map_B2.sam > Uame-Purple_map_B2.bam
samtools view -h -Sb Uame-Purple_map_B3.sam > Uame-Purple_map_B3.bam

rm Uame-Purple_map_B1.sam
rm Uame-Purple_map_B2.sam
rm Uame-Purple_map_B3.sam

samtools view -h -Sb Uame-White_map_B1.sam > Uame-White_map_B1.bam
samtools view -h -Sb Uame-White_map_B2.sam > Uame-White_map_B2.bam
samtools view -h -Sb Uame-White_map_B3.sam > Uame-White_map_B3.bam

rm Uame-White_map_B1.sam
rm Uame-White_map_B2.sam
rm Uame-White_map_B3.sam


samtools view -h -Sb Uame-Yellow_map_B1.sam > Uame-Yellow_map_B1.bam
samtools view -h -Sb Uame-Yellow_map_B2.sam > Uame-Yellow_map_B2.bam

rm Uame-Yellow_map_B1.sam
rm Uame-Yellow_map_B2.sam

samtools view -h -Sb Utri-Yellow_map_B1.sam > Utri-Yellow_map_B1.bam

rm Utri-Yellow_map_B1.sam

