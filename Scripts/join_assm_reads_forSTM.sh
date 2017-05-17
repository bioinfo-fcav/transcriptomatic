#!/bin/bash

cd Uame-Purple

cat ../../../LONGEST/Longest/Uame-Purple-Trinity-Longest.fa ../../../LONGEST/pullseqNonlongest_highexp/Uame-Purple_Nonlongest.transcripts.out  ../../union_pair_PEAR/Uame-Purple_B1_2_3.pear.assembled.fasta > Uame-Purple-Trinity-Long-nonL-reads.fasta

cd ..

cd Uame-White

cat ../../../LONGEST/Longest/Uame-White-Trinity-Longest.fa ../../../LONGEST/pullseqNonlongest_highexp/Uame-White_Nonlongest.transcripts.out  ../../union_pair_PEAR/Uame-White_B1_2_3.pear.assembled.fasta > Uame-White-Trinity-Long-nonL-reads.fasta

cd ..

cd Uame-Yellow

cat ../../../LONGEST/Longest/Uame-Yellow-Trinity-Longest.fa ../../../LONGEST/pullseqNonlongest_highexp/Uame-Yellow_Nonlongest.transcripts.out  ../../union_pair_PEAR/Uame-Yellow_B1_2.pear.assembled.fasta > Uame-Yellow-Trinity-Long-nonL-reads.fasta

cd ..

cd Utri-Yellow

cat ../../../LONGEST/Longest/Utri-Yellow-Trinity-Longest.fa ../../../LONGEST/pullseqNonlongest_highexp/Utri-Yellow_Nonlongest.transcripts.out  ../../union_pair_PEAR/Utri-Yellow_B1.unc-nonlongest_12.pear.assembled.fasta > Utri-Yellow-Trinity-Long-nonL-reads.fasta
