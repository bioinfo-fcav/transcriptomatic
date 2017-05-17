#!/bin/bash

#bowtie2-build -f Longest/Uame-Purple-Trinity-Longest.fa bowtie_align/bowtie_indexes/Uame-Purple-Trinity-Longest.index

#bowtie2 -p 20 -t --nofw --no-discordant --no-mixed --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-Purple-Trinity-Longest.index -S /data/projects/flowers/LONGEST/bowtie_align/Uame-Purple_map_B1.sam -1 /data/projects/flowers/assembled/renamed/Uame-Purple_B1.woc_1.fastq -2 /data/projects/flowers/assembled/renamed/Uame-Purple_B1.woc_2.fastq

#bowtie2 -p 20 -t --nofw --no-discordant --no-mixed --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-Purple-Trinity-Longest.index -S /data/projects/flowers/LONGEST/bowtie_align/Uame-Purple_map_B2.sam -1 /data/projects/flowers/assembled/renamed/Uame-Purple_B2.woc_1.fastq -2 /data/projects/flowers/assembled/renamed/Uame-Purple_B2.woc_2.fastq

#bowtie2 -p 20 -t --nofw --no-discordant --no-mixed --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-Purple-Trinity-Longest.index -S /data/projects/flowers/LONGEST/bowtie_align/Uame-Purple_map_B3.sam -1 /data/projects/flowers/assembled/renamed/Uame-Purple_B3.woc_1.fastq -2 /data/projects/flowers/assembled/renamed/Uame-Purple_B3.woc_2.fastq


#bowtie2-build -f Longest/Uame-White-Trinity-Longest.fa bowtie_align/bowtie_indexes/Uame-White-Trinity-Longest.index

#bowtie2 -p 20 -t --nofw --no-discordant --no-mixed --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-White-Trinity-Longest.index -S /data/projects/flowers/LONGEST/bowtie_align/Uame-White_map_B1.sam -1 /data/projects/flowers/assembled/renamed/Uame-White_B1.woc_1.fastq  -2 /data/projects/flowers/assembled/renamed/Uame-White_B1.woc_2.fastq

#bowtie2 -p 20 -t --nofw --no-discordant --no-mixed --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-White-Trinity-Longest.index -S /data/projects/flowers/LONGEST/bowtie_align/Uame-White_map_B2.sam -1 /data/projects/flowers/assembled/renamed/Uame-White_B2.woc_1.fastq  -2 /data/projects/flowers/assembled/renamed/Uame-White_B2.woc_2.fastq

#bowtie2 -p 20 -t --nofw --no-discordant --no-mixed --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-White-Trinity-Longest.index -S /data/projects/flowers/LONGEST/bowtie_align/Uame-White_map_B3.sam -1 /data/projects/flowers/assembled/renamed/Uame-White_B3.woc_1.fastq  -2 /data/projects/flowers/assembled/renamed/Uame-White_B3.woc_2.fastq


#bowtie2-build -f Longest/Uame-Yellow-Trinity-Longest.fa bowtie_align/bowtie_indexes/Uame-Yellow-Trinity-Longest.index
#
#bowtie2 -p 20 -t --nofw --no-discordant --no-mixed --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-Yellow-Trinity-Longest.index -S /data/projects/flowers/LONGEST/bowtie_align/Uame-Yellow_map_B1.sam -1 /data/projects/flowers/assembled/renamed/Uame-Yellow_B1.woc_1.fastq -2 /data/projects/flowers/assembled/renamed/Uame-Yellow_B1.woc_2.fastq

#bowtie2 -p 20 -t --nofw --no-discordant --no-mixed --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-Yellow-Trinity-Longest.index -S /data/projects/flowers/LONGEST/bowtie_align/Uame-Yellow_map_B2.sam -1 /data/projects/flowers/assembled/renamed/Uame-Yellow_B2.woc_1.fastq -2 /data/projects/flowers/assembled/renamed/Uame-Yellow_B2.woc_2.fastq


#bowtie2-build -f Longest/Utri-Yellow-Trinity-Longest.fa bowtie_align/bowtie_indexes/Utri-Yellow-Trinity-Longest.index

#bowtie2 -p 20 -t --nofw --no-discordant --no-mixed --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Utri-Yellow-Trinity-Longest.index -S /data/projects/flowers/LONGEST/bowtie_align/Utri-Yellow_map_B1.sam -1 /data/projects/flowers/assembled/renamed/Utri-Yellow_B1.woc_1.fastq -2 /data/projects/flowers/assembled/renamed/Utri-Yellow_B1.woc_2.fastq

#bowtie_align/run_filter_align-longest.sh

bowtie2-build -f /data/projects/flowers/LONGEST/NonLongest/Uame-Purple-Trinity-NonLongest.fa bowtie_align/bowtie_indexes/Uame-Purple-Trinity-NonLongest.index

bowtie2 -p 20 -t --nofw --no-discordant --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-Purple-Trinity-NonLongest.index -S /data/projects/flowers/LONGEST/bowtie_nonlongest/Uame-Purple_map_NonLongest_B1.sam -1 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-Purple_B1.woc_1_nonalign.fastq  -2 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-Purple_B1.woc_2_nonalign.fastq

bowtie2 -p 20 -t --nofw --no-discordant --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-Purple-Trinity-NonLongest.index -S /data/projects/flowers/LONGEST/bowtie_nonlongest/Uame-Purple_map_NonLongest_B2.sam -1 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-Purple_B2.woc_1_nonalign.fastq -2 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-Purple_B2.woc_2_nonalign.fastq

bowtie2 -p 20 -t --nofw --no-discordant --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-Purple-Trinity-NonLongest.index -S /data/projects/flowers/LONGEST/bowtie_nonlongest/Uame-Purple_map_NonLongest_B3.sam -1 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-Purple_B3.woc_1_nonalign.fastq -2 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-Purple_B3.woc_2_nonalign.fastq

bowtie2-build -f /data/projects/flowers/LONGEST/NonLongest/Uame-White-Trinity-NonLongest.fa bowtie_align/bowtie_indexes/Uame-White-Trinity-NonLongest.index

bowtie2 -p 20 -t --nofw --no-discordant --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-White-Trinity-NonLongest.index -S /data/projects/flowers/LONGEST/bowtie_nonlongest/Uame-White_map_NonLongest_B1.sam -1 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-White_B1.woc_1_nonalign.fastq -2 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-White_B1.woc_2_nonalign.fastq

bowtie2 -p 20 -t --nofw --no-discordant --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-White-Trinity-NonLongest.index -S /data/projects/flowers/LONGEST/bowtie_nonlongest/Uame-White_map_NonLongest_B2.sam -1 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-White_B2.woc_1_nonalign.fastq -2 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-White_B2.woc_2_nonalign.fastq

bowtie2 -p 20 -t --nofw --no-discordant --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-White-Trinity-NonLongest.index -S /data/projects/flowers/LONGEST/bowtie_nonlongest/Uame-White_map_NonLongest_B3.sam -1 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-White_B3.woc_1_nonalign.fastq  -2 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-White_B3.woc_2_nonalign.fastq


bowtie2-build -f /data/projects/flowers/LONGEST/NonLongest/Uame-Yellow-Trinity-NonLongest.fa bowtie_align/bowtie_indexes/Uame-Yellow-Trinity-NonLongest.index

bowtie2 -p 20 -t --nofw --no-discordant --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-Yellow-Trinity-NonLongest.index -S /data/projects/flowers/LONGEST/bowtie_nonlongest/Uame-Yellow_map_NonLongest_B1.sam -1 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-Yellow_B1.woc_1_nonalign.fastq  -2 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-Yellow_B1.woc_2_nonalign.fastq

bowtie2 -p 20 -t --nofw --no-discordant --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Uame-Yellow-Trinity-NonLongest.index -S /data/projects/flowers/LONGEST/bowtie_nonlongest/Uame-Yellow_map_NonLongest_B2.sam -1 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-Yellow_B2.woc_1_nonalign.fastq -2 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Uame-Yellow_B2.woc_2_nonalign.fastq


bowtie2-build -f /data/projects/flowers/LONGEST/NonLongest/Utri-Yellow-Trinity-NonLongest.fa bowtie_align/bowtie_indexes/Utri-Yellow-Trinity-NonLongest.index

bowtie2 -p 20 -t --nofw --no-discordant --dovetail -X 1000 --end-to-end --fr -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 -x /data/projects/flowers/LONGEST/bowtie_align/bowtie_indexes/Utri-Yellow-Trinity-NonLongest.index -S /data/projects/flowers/LONGEST/bowtie_nonlongest/Utri-Yellow_map_NonLongest_B1.sam -1 /data/projects/flowers/LONGEST/bowtie_align/pullseq_nonalign/Utri-Yellow_B1.woc_1_nonalign.fastq  -2 /data/project/flowers/LONGEST/bowtie_align/pullseq_nonalign/Utri-Yellow_B1.woc_2_nonalign.fastq

