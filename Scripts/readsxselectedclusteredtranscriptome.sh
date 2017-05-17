#!/bin/bash

#cat ../stm_viridiplantae/Uame-Purple-2dez2016-STM-FinalAssembly.fa | renameSeqs.pl -l Uame-Purple-2dez2016-STM-FinalAssembly.list -p Uame-Purple. -if FASTA -of FASTA > Uame-Purple-2dez2016-STM-FinalAssembly.renamed.fa

#cat ../stm_viridiplantae/Uame-White-2dez2016-STM-FinalAssembly.fa  | renameSeqs.pl -l Uame-White-2dez2016-STM-FinalAssembly.list -p Uame-White. -if FASTA -of FASTA > Uame-White-2dez2016-STM-FinalAssembly.renamed.fa

#cat ../stm_viridiplantae/Uame-Yellow-2dez2016-STM-FinalAssembly.fa | renameSeqs.pl -l Uame-Yellow-2dez2016-STM-FinalAssembly.list -p Uame-Yellow. -if FASTA -of FASTA > Uame-Yellow-2dez2016-STM-FinalAssembly.renamed.fa

#cat ../stm_viridiplantae/Utri-Yellow-2dez2016-STM-FinalAssembly.fa | renameSeqs.pl -l Utri-Yellow-2dez2016-STM-FinalAssembly.list -p Utri-Yellow. -if FASTA -of FASTA > Utri-Yellow-2dez2016-STM-FinalAssembly.renamed.fa

#./run_cluster.sh

#pullseq -i Uame-Purple-2dez2016-STM-FinalAssembly.renamed.fa -n Uame-Purple-clusters.uc.parsed.selected > Uame-Purple-2dez2016-selected.renamed.fa
#pullseq -i Uame-White-2dez2016-STM-FinalAssembly.renamed.fa  -n Uame-White-clusters.uc.parsed.selected  > Uame-White-2dez2016-selected.renamed.fa
#pullseq -i Uame-Yellow-2dez2016-STM-FinalAssembly.renamed.fa -n Uame-Yellow-clusters.uc.parsed.selected > Uame-Yellow-2dez2016-selected.renamed.fa
#pullseq -i Utri-Yellow-2dez2016-STM-FinalAssembly.renamed.fa -n Utri-Yellow-clusters.uc.parsed.selected > Utri-Yellow-2dez2016-selected.renamed.fa

bowtie2-build -f Uame-Purple-2dez2016-selected.renamed.fa Uame-Purple-STM

bowtie2 -p 20 -X 1000 --nofw --end-to-end --fr --very-sensitive -x /data/projects/flowers/readsxtranscriptomes/Uame-Purple-STM -S Uame-Purple_map_B1.sam -1 /data/projects/flowers/woc/Uame-Purple_B1.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-Purple_B1.woc_2.fastq

bowtie2 -p 20 -X 1000 --nofw --end-to-end --fr --very-sensitive -x /data/projects/flowers/readsxtranscriptomes/Uame-Purple-STM -S Uame-Purple_map_B2.sam -1 /data/projects/flowers/woc/Uame-Purple_B2.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-Purple_B2.woc_2.fastq

bowtie2 -p 20 -X 1000 --nofw --end-to-end --fr --very-sensitive -x /data/projects/flowers/readsxtranscriptomes/Uame-Purple-STM -S Uame-Purple_map_B3.sam -1 /data/projects/flowers/woc/Uame-Purple_B3.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-Purple_B3.woc_2.fastq

bowtie2-build -f Uame-White-2dez2016-selected.renamed.fa Uame-White-STM

bowtie2 -p 20 -X 1000 --nofw --end-to-end --fr --very-sensitive -x /data/projects/flowers/readsxtranscriptomes/Uame-White-STM -S Uame-White_map_B1.sam -1 /data/projects/flowers/woc/Uame-White_B1.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-White_B1.woc_2.fastq

bowtie2 -p 20 -X 1000 --nofw --end-to-end --fr --very-sensitive -x /data/projects/flowers/readsxtranscriptomes/Uame-White-STM -S Uame-White_map_B2.sam -1 /data/projects/flowers/woc/Uame-White_B2.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-White_B2.woc_2.fastq

bowtie2 -p 20 -X 1000 --nofw --end-to-end --fr --very-sensitive -x /data/projects/flowers/readsxtranscriptomes/Uame-White-STM -S Uame-White_map_B3.sam -1 /data/projects/flowers/woc/Uame-White_B3.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-White_B3.woc_2.fastq

bowtie2-build -f Uame-Yellow-2dez2016-selected.renamed.fa Uame-Yellow-STM

bowtie2 -p 20 -X 1000 --nofw --end-to-end --fr --very-sensitive -x /data/projects/flowers/readsxtranscriptomes/Uame-Yellow-STM -S Uame-Yellow_map_B1.sam -1 /data/projects/flowers/woc/Uame-Yellow_B1.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-Yellow_B1.woc_2.fastq

bowtie2 -p 20 -X 1000 --nofw --end-to-end --fr --very-sensitive -x /data/projects/flowers/readsxtranscriptomes/Uame-Yellow-STM -S Uame-Yellow_map_B2.sam -1 /data/projects/flowers/woc/Uame-Yellow_B2.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-Yellow_B2.woc_2.fastq

bowtie2-build -f Utri-Yellow-2dez2016-selected.renamed.fa Utri-Yellow-STM

bowtie2 -p 20 -X 1000 --nofw --end-to-end --fr --very-sensitive -x /data/projects/flowers/readsxtranscriptomes/Utri-Yellow-STM -S Utri-Yellow_map_B1.sam -1 /data/projects/flowers/woc/Utri-Yellow_B1.woc_1.fastq  -2 /data/projects/flowers/woc/Utri-Yellow_B1.woc_2.fastq

#./run_htseq.sh


### CONTAGEM DOS READS POR SAM_SAM_nameSorted_to_uniq_count_stats.pl

samtools view -Sb Uame-Purple_map_B1.sam > Uame-Purple_map_B1.bam
samtools sort -n Uame-Purple_map_B1.bam Uame-Purple_map_B1.bam.sorted
SAM_nameSorted_to_uniq_count_stats.pl Uame-Purple_map_B1.bam.sorted.bam

samtools view -Sb Uame-Purple_map_B2.sam > Uame-Purple_map_B2.bam
samtools sort -n Uame-Purple_map_B2.bam Uame-Purple_map_B2.bam.sorted
SAM_nameSorted_to_uniq_count_stats.pl Uame-Purple_map_B2.bam.sorted.bam

samtools view -Sb Uame-Purple_map_B3.sam > Uame-Purple_map_B3.bam
samtools sort -n Uame-Purple_map_B3.bam Uame-Purple_map_B3.bam.sorted
SAM_nameSorted_to_uniq_count_stats.pl Uame-Purple_map_B3.bam.sorted.bam

samtools view -Sb Uame-White_map_B1.sam > Uame-White_map_B1.bam
samtools sort -n Uame-White_map_B1.bam Uame-White_map_B1.bam.sorted
SAM_nameSorted_to_uniq_count_stats.pl Uame-White_map_B1.bam.sorted.bam

samtools view -Sb Uame-White_map_B2.sam > Uame-White_map_B2.bam
samtools sort -n Uame-White_map_B2.bam Uame-White_map_B2.bam.sorted
SAM_nameSorted_to_uniq_count_stats.pl Uame-White_map_B2.bam.sorted.bam

samtools view -Sb Uame-White_map_B3.sam > Uame-White_map_B3.bam
samtools sort -n Uame-White_map_B3.bam Uame-White_map_B3.bam.sorted
SAM_nameSorted_to_uniq_count_stats.pl Uame-White_map_B3.bam.sorted.bam

samtools view -Sb Uame-Yellow_map_B1.sam > Uame-Yellow_map_B1.bam
samtools sort -n Uame-Yellow_map_B1.bam Uame-Yellow_map_B1.bam.sorted
SAM_nameSorted_to_uniq_count_stats.pl Uame-Yellow_map_B1.bam.sorted.bam

samtools view -Sb Uame-Yellow_map_B2.sam > Uame-Yellow_map_B2.bam
samtools sort -n Uame-Yellow_map_B2.bam Uame-Yellow_map_B2.bam.sorted
SAM_nameSorted_to_uniq_count_stats.pl Uame-Yellow_map_B2.bam.sorted.bam

samtools view -Sb Utri-Yellow_map_B1.sam > Utri-Yellow_map_B1.bam
samtools sort -n Utri-Yellow_map_B1.bam Utri-Yellow_map_B1.bam.sorted
SAM_nameSorted_to_uniq_count_stats.pl Utri-Yellow_map_B1.bam.sorted.bam

### CONTAGEM DOS READS POR SAM De qualidade Q10 _SAM_nameSorted_to_uniq_count_stats.pl


samtools view -b -q 10 Uame-Purple_map_B1.bam.sorted.bam > Uame-Purple_map_B1.bam_Q10.sorted.bam
SAM_nameSorted_to_uniq_count_stats.pl Uame-Purple_map_B1.bam_Q10.sorted.bam

samtools view -b -q 10 Uame-Purple_map_B2.bam.sorted.bam > Uame-Purple_map_B2.bam_Q10.sorted.bam
SAM_nameSorted_to_uniq_count_stats.pl Uame-Purple_map_B2.bam_Q10.sorted.bam

samtools view -b -q 10 Uame-Purple_map_B3.bam.sorted.bam > Uame-Purple_map_B3.bam_Q10.sorted.bam
SAM_nameSorted_to_uniq_count_stats.pl Uame-Purple_map_B3.bam_Q10.sorted.bam

samtools view -b -q 10 Uame-White_map_B1.bam.sorted.bam > Uame-White_map_B1.bam_Q10.sorted.bam
SAM_nameSorted_to_uniq_count_stats.pl Uame-White_map_B1.bam_Q10.sorted.bam

samtools view -b -q 10 Uame-White_map_B2.bam.sorted.bam > Uame-White_map_B2.bam_Q10.sorted.bam
SAM_nameSorted_to_uniq_count_stats.pl Uame-White_map_B2.bam_Q10.sorted.bam

samtools view -b -q 10 Uame-White_map_B3.bam.sorted.bam > Uame-White_map_B3.bam_Q10.sorted.bam
SAM_nameSorted_to_uniq_count_stats.pl Uame-White_map_B3.bam_Q10.sorted.bam

samtools view -b -q 10 Uame-Yellow_map_B1.bam.sorted.bam > Uame-Yellow_map_B1.bam_Q10.sorted.bam
SAM_nameSorted_to_uniq_count_stats.pl Uame-Yellow_map_B1.bam_Q10.sorted.bam

samtools view -b -q 10 Uame-Yellow_map_B2.bam.sorted.bam > Uame-Yellow_map_B2.bam_Q10.sorted.bam
SAM_nameSorted_to_uniq_count_stats.pl Uame-Yellow_map_B2.bam_Q10.sorted.bam

samtools view -b -q 10 Utri-Yellow_map_B1.bam.sorted.bam > Utri-Yellow_map_B1.bam_Q10.sorted.bam
SAM_nameSorted_to_uniq_count_stats.pl Utri-Yellow_map_B1.bam_Q10.sorted.bam



