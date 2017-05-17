#!/bin/bash


#bowtie2-build -f ../Uame-Purple-2dez2016-selected.renamed.fa Uame-Purple-STM

#bowtie2 -p 15 -k 200 --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -t --nofw --end-to-end --fr --very-sensitive -S Uame-Purple_detonate_B1.sam -x /data/projects/flowers/readsxtranscriptomes/Uame-Purple-STM -1 /data/projects/flowers/woc/Uame-Purple_B1.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-Purple_B1.woc_2.fastq

#bowtie2 -p 15 -k 200 --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -t --nofw --end-to-end --fr --very-sensitive -S Uame-Purple_detonate_B2.sam -x /data/projects/flowers/readsxtranscriptomes/Uame-Purple-STM -1 /data/projects/flowers/woc/Uame-Purple_B2.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-Purple_B2.woc_2.fastq

#bowtie2 -p 15 -k 200 --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -t --nofw --end-to-end --fr --very-sensitive -S Uame-Purple_detonate_B3.sam -x /data/projects/flowers/readsxtranscriptomes/Uame-Purple-STM -1 /data/projects/flowers/woc/Uame-Purple_B3.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-Purple_B3.woc_2.fastq

#samtools view -Sb Uame-Purple_detonate_B1.sam > Uame-Purple_detonate_B1.bam
#rm Uame-Purple_detonate_B1.sam
#samtools view -Sb Uame-Purple_detonate_B2.sam > Uame-Purple_detonate_B2.bam
#rm Uame-Purple_detonate_B2.sam
#samtools view -Sb Uame-Purple_detonate_B3.sam > Uame-Purple_detonate_B3.bam
#rm Uame-Purple_detonate_B3.sam

#bowtie2-build -f ../Uame-White-2dez2016-selected.renamed.fa Uame-White-STM

#bowtie2 -p 15 -k 200 --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -t --nofw --end-to-end --fr --very-sensitive -S Uame-White_detonate_B1.sam -x /data/projects/flowers/readsxtranscriptomes/Uame-White-STM -1 /data/projects/flowers/woc/Uame-White_B1.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-White_B1.woc_2.fastq

#bowtie2 -p 15 -k 200 --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -t --nofw --end-to-end --fr --very-sensitive -S Uame-White_detonate_B2.sam -x /data/projects/flowers/readsxtranscriptomes/Uame-White-STM -1 /data/projects/flowers/woc/Uame-White_B2.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-White_B2.woc_2.fastq

#bowtie2 -p 15 -k 200 --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -t --nofw --end-to-end --fr --very-sensitive -S Uame-White_detonate_B3.sam -x /data/projects/flowers/readsxtranscriptomes/Uame-White-STM -1 /data/projects/flowers/woc/Uame-White_B3.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-White_B3.woc_2.fastq

#samtools view -Sb Uame-White_detonate_B1.sam > Uame-White_detonate_B1.bam
#rm Uame-White_detonate_B1.sam
#samtools view -Sb Uame-White_detonate_B2.sam > Uame-White_detonate_B2.bam
#rm Uame-White_detonate_B2.sam
#samtools view -Sb Uame-White_detonate_B3.sam > Uame-White_detonate_B3.bam
#rm Uame-White_detonate_B3.sam

#bowtie2-build -f ../Uame-Yellow-2dez2016-selected.renamed.fa Uame-Yellow-STM

#bowtie2 -p 15 -k 200 --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -t --nofw --end-to-end --fr --very-sensitive -S Uame-Yellow_detonate_B1.sam -x /data/projects/flowers/readsxtranscriptomes/Uame-Yellow-STM -1 /data/projects/flowers/woc/Uame-Yellow_B1.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-Yellow_B1.woc_2.fastq

#bowtie2 -p 15 -k 200 --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -t --nofw --end-to-end --fr --very-sensitive -S Uame-Yellow_detonate_B2.sam -x /data/projects/flowers/readsxtranscriptomes/Uame-Yellow-STM -1 /data/projects/flowers/woc/Uame-Yellow_B2.woc_1.fastq  -2 /data/projects/flowers/woc/Uame-Yellow_B2.woc_2.fastq

#samtools view -Sb Uame-Yellow_detonate_B1.sam > Uame-Yellow_detonate_B1.bam
#rm Uame-Yellow_detonate_B1.sam
#samtools view -Sb Uame-Yellow_detonate_B2.sam > Uame-Yellow_detonate_B2.bam
#rm Uame-Yellow_detonate_B2.sam

#bowtie2-build -f ../Utri-Yellow-2dez2016-selected.renamed.fa Utri-Yellow-STM

#bowtie2 -p 15 -k 200 --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -t --nofw --end-to-end --fr --very-sensitive -S Utri-Yellow_detonate_B1.sam -x /data/projects/flowers/readsxtranscriptomes/Utri-Yellow-STM -1 /data/projects/flowers/woc/Utri-Yellow_B1.woc_1.fastq  -2 /data/projects/flowers/woc/Utri-Yellow_B1.woc_2.fastq

#samtools view -Sb Utri-Yellow_detonate_B1.sam > Utri-Yellow_detonate_B1.bam
#rm Utri-Yellow_detonate_B1.sam

##Avaliação do transcritoma por rsem-eval

#samtools view -H Uame-Purple_detonate_B1.bam > Uame-Purple_STMCluster_header.sam

#samtools merge -h Uame-Purple_STMCluster_header.sam Uame-Purple_detonate_B1_2_3.bam Uame-Purple_detonate_B1.bam Uame-Purple_detonate_B2.bam Uame-Purple_detonate_B3.bam

#samtools view -H Uame-White_detonate_B1.bam > Uame-White_STMCluster_header.sam

#samtools merge -h Uame-White_STMCluster_header.sam Uame-White_detonate_B1_2_3.bam Uame-White_detonate_B1.bam Uame-White_detonate_B2.bam Uame-White_detonate_B3.bam

#samtools view -H Uame-Yellow_detonate_B1.bam > Uame-Yellow_STMCluster_header.sam

#samtools merge -h Uame-Yellow_STMCluster_header.sam Uame-Yellow_detonate_B1_2.bam Uame-Yellow_detonate_B1.bam Uame-Yellow_detonate_B2.bam

/usr/local/bioinfo/detonate-1.11/rsem-eval/rsem-eval-calculate-score --tag "" -p 15 --transcript-length-parameters /work/projects/flowers/Ugibba/Utricularia_gibba_parameters.txt --paired-end --bam Uame-Purple_detonate_B1_2_3.bam ../Uame-Purple-2dez2016-selected.renamed.fa Uame-Purple-STM-detonate-150 150

/usr/local/bioinfo/detonate-1.11/rsem-eval/rsem-eval-calculate-score --tag "" -p 15 --transcript-length-parameters /work/projects/flowers/Ugibba/Utricularia_gibba_parameters.txt --paired-end --bam Uame-White_detonate_B1_2_3.bam ../Uame-White-2dez2016-selected.renamed.fa Uame-White-STM-detonate-150 150

/usr/local/bioinfo/detonate-1.11/rsem-eval/rsem-eval-calculate-score --tag "" -p 15 --transcript-length-parameters /work/projects/flowers/Ugibba/Utricularia_gibba_parameters.txt --paired-end --bam Uame-Yellow_detonate_B1_2.bam ../Uame-Yellow-2dez2016-selected.renamed.fa Uame-Yellow-STM-detonate-150 150

/usr/local/bioinfo/detonate-1.11/rsem-eval/rsem-eval-calculate-score --tag "" -p 15 --transcript-length-parameters /work/projects/flowers/Ugibba/Utricularia_gibba_parameters.txt --paired-end --bam Utri-Yellow_detonate_B1.bam ../Utri-Yellow-2dez2016-selected.renamed.fa Utri-Yellow-STM-detonate-150 150

##Selecionando os Q10 das sequencias alinhadas e rsem-eval das sequecias Q10


#samtools view -b -q 10 Uame-Purple_detonate_B1_2_3.bam > Uame-Purple_Q10_detonate_B1_2_3.bam

#/usr/local/bioinfo/detonate-1.11/rsem-eval/rsem-eval-calculate-score --tag "" -p 15 --transcript-length-parameters /work/projects/flowers/Ugibba/Utricularia_gibba_parameters.txt --paired-end --bam Uame-Purple_Q10_detonate_B1_2_3.bam ../Uame-Purple-2dez2016-selected.renamed.fa Uame-Purple_Q10_STMCluster_detonate 150

#samtools view -b -q 10 Uame-White_detonate_B1_2_3.bam > Uame-White_Q10_detonate_B1_2_3.bam

#/usr/local/bioinfo/detonate-1.11/rsem-eval/rsem-eval-calculate-score --tag "" -p 15 --transcript-length-parameters /work/projects/flowers/Ugibba/Utricularia_gibba_parameters.txt --paired-end --bam Uame-White_Q10_detonate_B1_2_3.bam ../Uame-White-2dez2016-selected.renamed.fa Uame-White_Q10_STMCluster_detonate 150

#samtools view -b -q 10 Uame-Yellow_detonate_B1_2.bam > Uame-Yellow_Q10_detonate_B1_2.bam

#/usr/local/bioinfo/detonate-1.11/rsem-eval/rsem-eval-calculate-score --tag "" -p 15 --transcript-length-parameters /work/projects/flowers/Ugibba/Utricularia_gibba_parameters.txt --paired-end --bam Uame-Yellow_Q10_detonate_B1_2.bam ../Uame-Yellow-2dez2016-selected.renamed.fa Uame-Yellow_Q10_STMCluster_detonate 150

#samtools view -b -q 10 Utri-Yellow_detonate_B1.bam > Utri-Yellow_Q10_detonate_B1.bam

#/usr/local/bioinfo/detonate-1.11/rsem-eval/rsem-eval-calculate-score --tag "" -p 15 --transcript-length-parameters /work/projects/flowers/Ugibba/Utricularia_gibba_parameters.txt --paired-end --bam Utri-Yellow_Q10_detonate_B1.bam ../Utri-Yellow-2dez2016-selected.renamed.fa Utri-Yellow_Q10_STMCluster_detonate 150







