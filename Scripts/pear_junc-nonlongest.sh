#!/bin/bash

#ln -s ../../LONGEST/bowtie_nonlongest/Uame-Purple_unmap_NonLongest_B1.list
#ln -s ../../LONGEST/bowtie_nonlongest/Uame-Purple_unmap_NonLongest_B2.list
#ln -s ../../LONGEST/bowtie_nonlongest/Uame-Purple_unmap_NonLongest_B3.list
#ln -s ../../LONGEST/bowtie_nonlongest/Uame-White_unmap_NonLongest_B1.list
#ln -s ../../LONGEST/bowtie_nonlongest/Uame-White_unmap_NonLongest_B2.list
#ln -s ../../LONGEST/bowtie_nonlongest/Uame-White_unmap_NonLongest_B3.list
#ln -s ../../LONGEST/bowtie_nonlongest/Uame-Yellow_unmap_NonLongest_B1.list
#ln -s ../../LONGEST/bowtie_nonlongest/Uame-Yellow_unmap_NonLongest_B2.list
#ln -s ../../LONGEST/bowtie_nonlongest/Utri-Yellow_unmap_NonLongest_B1.list


pullseq -n Uame-Purple_unmap_NonLongest_B1.list -i ../../assembled/renamed/Uame-Purple_B1.woc_1.fastq > Uame-Purple_map_NonLongest_B1.filtered_woc_1.fastq
pullseq -n Uame-Purple_unmap_NonLongest_B1.list -i ../../assembled/renamed/Uame-Purple_B1.woc_2.fastq > Uame-Purple_map_NonLongest_B1.filtered_woc_2.fastq

pullseq -n Uame-Purple_unmap_NonLongest_B2.list -i ../../assembled/renamed/Uame-Purple_B2.woc_1.fastq > Uame-Purple_map_NonLongest_B2.filtered_woc_1.fastq
pullseq -n Uame-Purple_unmap_NonLongest_B2.list -i ../../assembled/renamed/Uame-Purple_B2.woc_2.fastq > Uame-Purple_map_NonLongest_B2.filtered_woc_2.fastq

pullseq -n Uame-Purple_unmap_NonLongest_B3.list -i ../../assembled/renamed/Uame-Purple_B3.woc_1.fastq > Uame-Purple_map_NonLongest_B3.filtered_woc_1.fastq
pullseq -n Uame-Purple_unmap_NonLongest_B3.list -i ../../assembled/renamed/Uame-Purple_B3.woc_2.fastq > Uame-Purple_map_NonLongest_B3.filtered_woc_2.fastq


pullseq -n Uame-White_unmap_NonLongest_B1.list -i ../../assembled/renamed/Uame-White_B1.woc_1.fastq > Uame-White_map_NonLongest_B1.filtered_woc_1.fastq
pullseq -n Uame-White_unmap_NonLongest_B1.list -i ../../assembled/renamed/Uame-White_B1.woc_2.fastq > Uame-White_map_NonLongest_B1.filtered_woc_2.fastq

pullseq -n Uame-White_unmap_NonLongest_B2.list -i ../../assembled/renamed/Uame-White_B2.woc_1.fastq > Uame-White_map_NonLongest_B2.filtered_woc_1.fastq
pullseq -n Uame-White_unmap_NonLongest_B2.list -i ../../assembled/renamed/Uame-White_B2.woc_2.fastq > Uame-White_map_NonLongest_B2.filtered_woc_2.fastq

pullseq -n Uame-White_unmap_NonLongest_B3.list -i ../../assembled/renamed/Uame-White_B3.woc_1.fastq > Uame-White_map_NonLongest_B3.filtered_woc_1.fastq
pullseq -n Uame-White_unmap_NonLongest_B3.list -i ../../assembled/renamed/Uame-White_B3.woc_2.fastq > Uame-White_map_NonLongest_B3.filtered_woc_2.fastq

pullseq -n Uame-Yellow_unmap_NonLongest_B1.list -i ../../assembled/renamed/Uame-Yellow_B1.woc_1.fastq > Uame-Yellow_map_NonLongest_B1.filtered_woc_1.fastq
pullseq -n Uame-Yellow_unmap_NonLongest_B1.list -i ../../assembled/renamed/Uame-Yellow_B1.woc_2.fastq > Uame-Yellow_map_NonLongest_B1.filtered_woc_2.fastq

pullseq -n Uame-Yellow_unmap_NonLongest_B2.list -i ../../assembled/renamed/Uame-Yellow_B2.woc_1.fastq > Uame-Yellow_map_NonLongest_B2.filtered_woc_1.fastq
pullseq -n Uame-Yellow_unmap_NonLongest_B2.list -i ../../assembled/renamed/Uame-Yellow_B2.woc_2.fastq > Uame-Yellow_map_NonLongest_B2.filtered_woc_2.fastq

pullseq -n Utri-Yellow_unmap_NonLongest_B1.list -i ../../assembled/renamed/Utri-Yellow_B1.woc_1.fastq > Utri-Yellow_map_NonLongest_B1.filtered_woc_1.fastq
pullseq -n Utri-Yellow_unmap_NonLongest_B1.list -i ../../assembled/renamed/Utri-Yellow_B1.woc_2.fastq > Utri-Yellow_map_NonLongest_B1.filtered_woc_2.fastq

pear -v 20 -j 20 -f Uame-Purple_map_NonLongest_B1.filtered_woc_2.fastq -r Uame-Purple_map_NonLongest_B1.filtered_woc_1.fastq -o Uame-Purple_B1.unc-nonlongest_12.pear

pear -v 20 -j 20 -f Uame-Purple_map_NonLongest_B2.filtered_woc_2.fastq -r Uame-Purple_map_NonLongest_B2.filtered_woc_1.fastq -o Uame-Purple_B2.unc-nonlongest_12.pear

pear -v 20 -j 20 -f Uame-Purple_map_NonLongest_B3.filtered_woc_2.fastq -r Uame-Purple_map_NonLongest_B3.filtered_woc_1.fastq -o Uame-Purple_B3.unc-nonlongest_12.pear

pear -v 20 -j 20 -f Uame-White_map_NonLongest_B1.filtered_woc_2.fastq -r Uame-White_map_NonLongest_B1.filtered_woc_1.fastq -o Uame-White_B1.unc-nonlongest_12.pear

pear -v 20 -j 20 -f Uame-White_map_NonLongest_B2.filtered_woc_2.fastq -r Uame-White_map_NonLongest_B2.filtered_woc_1.fastq -o Uame-White_B2.unc-nonlongest_12.pear

pear -v 20 -j 20 -f Uame-White_map_NonLongest_B3.filtered_woc_2.fastq -r Uame-White_map_NonLongest_B3.filtered_woc_1.fastq -o Uame-White_B3.unc-nonlongest_12.pear

pear -v 20 -j 20 -f Uame-Yellow_map_NonLongest_B1.filtered_woc_2.fastq -r Uame-Yellow_map_NonLongest_B1.filtered_woc_1.fastq -o Uame-Yellow_B1.unc-nonlongest_12.pear

pear -v 20 -j 20 -f Uame-Yellow_map_NonLongest_B2.filtered_woc_2.fastq -r Uame-Yellow_map_NonLongest_B2.filtered_woc_1.fastq -o Uame-Yellow_B2.unc-nonlongest_12.pear

pear -v 20 -j 20 -f Utri-Yellow_map_NonLongest_B1.filtered_woc_2.fastq -r Utri-Yellow_map_NonLongest_B1.filtered_woc_1.fastq -o Utri-Yellow_B1.unc-nonlongest_12.pear


cat Uame-Purple_B1.unc-nonlongest_12.pear.assembled.fastq Uame-Purple_B2.unc-nonlongest_12.pear.assembled.fastq Uame-Purple_B3.unc-nonlongest_12.pear.assembled.fastq > Uame-Purple_B1_2_3.pear.assembled.fastq
cat Uame-White_B1.unc-nonlongest_12.pear.assembled.fastq Uame-White_B2.unc-nonlongest_12.pear.assembled.fastq Uame-White_B3.unc-nonlongest_12.pear.assembled.fastq > Uame-White_B1_2_3.pear.assembled.fastq
cat Uame-Yellow_B1.unc-nonlongest_12.pear.assembled.fastq Uame-Yellow_B2.unc-nonlongest_12.pear.assembled.fastq > Uame-Yellow_B1_2.pear.assembled.fastq

fastq2fasta.pl Uame-Purple_B1_2_3.pear.assembled.fastq > Uame-Purple_B1_2_3.pear.assembled.fasta
fastq2fasta.pl Uame-White_B1_2_3.pear.assembled.fastq > Uame-White_B1_2_3.pear.assembled.fasta
fastq2fasta.pl Uame-Yellow_B1_2.pear.assembled.fastq > Uame-Yellow_B1_2.pear.assembled.fasta
fastq2fasta.pl Utri-Yellow_B1.unc-nonlongest_12.pear.assembled.fastq > Utri-Yellow_B1.unc-nonlongest_12.pear.assembled.fasta

