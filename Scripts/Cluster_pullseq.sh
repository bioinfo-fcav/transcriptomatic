#!/bin/bash

cat Uame-Purple-clusters.txt | cut -f 1 > Uame-Purple-clusters.list
cat Uame-White-clusters.txt | cut -f 1 > Uame-White-clusters.list
cat Uame-Yellow-clusters.txt | cut -f 1 > Uame-Yellow-clusters.list
cat Utri-Yellow-clusters.txt | cut -f 1 > Utri-Yellow-clusters.list


pullseq -n Uame-Purple-clusters.list -i ../Uame-Purple-2dez2016-selected.renamed.fa > Uame-Purple-clusteredseqs.fa
pullseq -n Uame-White-clusters.list -i ../Uame-White-2dez2016-selected.renamed.fa > Uame-White-clusteredseqs.fa
pullseq -n Uame-Yellow-clusters.list -i ../Uame-Yellow-2dez2016-selected.renamed.fa > Uame-Yellow-clusteredseqs.fa
pullseq -n Utri-Yellow-clusters.list -i ../Utri-Yellow-2dez2016-selected.renamed.fa > Utri-Yellow-clusteredseqs.fa

#for i in [pasta/arquivo]; do 
#	[faça algo] ; 
#done



