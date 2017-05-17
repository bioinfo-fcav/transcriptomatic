#!/bin/bash

#ln -s ../../readsxtranscriptomes/CORSET/Uame-Purple-clusters.txt 
#ln -s ../../readsxtranscriptomes/CORSET/Uame-White-clusters.txt 
#ln -s ../../readsxtranscriptomes/CORSET/Uame-Yellow-clusters.txt 
#ln -s ../../readsxtranscriptomes/CORSET/Utri-Yellow-clusters.txt 

#awk -F $'\t' ' { t = $1; $1 = $2; $2 = t; print; } ' OFS=$'\t' Uame-Purple-clusters.txt > Uame-Purple-clusters_swap.txt
#awk -F $'\t' ' { t = $1; $1 = $2; $2 = t; print; } ' OFS=$'\t' Uame-White-clusters.txt > Uame-White-clusters_swap.txt
#awk -F $'\t' ' { t = $1; $1 = $2; $2 = t; print; } ' OFS=$'\t' Uame-Yellow-clusters.txt > Uame-Yellow-clusters_swap.txt
#awk -F $'\t' ' { t = $1; $1 = $2; $2 = t; print; } ' OFS=$'\t' Utri-Yellow-clusters.txt > Utri-Yellow-clusters_swap.txt

#ln -s ../../readsxtranscriptomes/CORSET/Uame-Purple-clusteredseqs.fa
#ln -s ../../readsxtranscriptomes/CORSET/Uame-White-clusteredseqs.fa
#ln -s ../../readsxtranscriptomes/CORSET/Uame-Yellow-clusteredseqs.fa
#ln -s ../../readsxtranscriptomes/CORSET/Utri-Yellow-clusteredseqs.fa


#mkdir Uame-Purple
#cd Uame-Purple

#TransDecoder.LongOrfs -t ../Uame-Purple-clusteredseqs.fa --gene_trans_map ../Uame-Purple-clusters_swap.txt

#diamond blastp --query Uame-Purple-clusteredseqs.fa.transdecoder_dir/longest_orfs.pep  --db /data/databases/uniprot/uniref100  --max-target-seqs 1 --evalue 1e-5 --threads 20 --daa blastp_longest_orfs.pep-uniref100.daa --verbose
#diamond view --daa blastp_longest_orfs.pep-uniref100.daa --outfmt tab --out blastp_longest_orfs.pep-uniref100.tab

#hmmscan --cpu 20 --domtblout pfam.domtblout /data/databases/Pfam-A.hmm Uame-Purple-clusteredseqs.fa.transdecoder_dir/longest_orfs.pep > hmmscan.log

#TransDecoder.Predict -t ../Uame-Purple-clusteredseqs.fa --retain_pfam_hits pfam.domtblout --retain_blastp_hits blastp_longest_orfs.pep-uniref100.tab --train /data/databases/uniprot/uniref100-Viridiplantae.fasta


#cd ..

#mkdir Uame-White
#cd Uame-White

#TransDecoder.LongOrfs -t ../Uame-White-clusteredseqs.fa --gene_trans_map ../Uame-White-clusters_swap.txt

#diamond blastp --query Uame-White-clusteredseqs.fa.transdecoder_dir/longest_orfs.pep  --db /data/databases/uniprot/uniref100  --max-target-seqs 1 --evalue 1e-5 --threads 20 --daa blastp_longest_orfs.pep-uniref100.daa --verbose
#diamond view --daa blastp_longest_orfs.pep-uniref100.daa --outfmt tab --out blastp_longest_orfs.pep-uniref100.tab

#hmmscan --cpu 20 --domtblout pfam.domtblout /data/databases/Pfam-A.hmm Uame-White-clusteredseqs.fa.transdecoder_dir/longest_orfs.pep > hmmscan.log

#TransDecoder.Predict -t ../Uame-White-clusteredseqs.fa --retain_pfam_hits pfam.domtblout --retain_blastp_hits blastp_longest_orfs.pep-uniref100.tab --train /data/databases/uniprot/uniref100-Viridiplantae.fasta


#cd ..

#mkdir Uame-Yellow
#cd Uame-Yellow


#TransDecoder.LongOrfs -t ../Uame-Yellow-clusteredseqs.fa --gene_trans_map ../Uame-Yellow-clusters_swap.txt

#diamond blastp --query Uame-Yellow-clusteredseqs.fa.transdecoder_dir/longest_orfs.pep  --db /data/databases/uniprot/uniref100  --max-target-seqs 1 --evalue 1e-5 --threads 20 --daa blastp_longest_orfs.pep-uniref100.daa --verbose
#diamond view --daa blastp_longest_orfs.pep-uniref100.daa --outfmt tab --out blastp_longest_orfs.pep-uniref100.tab

#hmmscan --cpu 20 --domtblout pfam.domtblout /data/databases/Pfam-A.hmm Uame-Yellow-clusteredseqs.fa.transdecoder_dir/longest_orfs.pep > hmmscan.log

#TransDecoder.Predict -t ../Uame-Yellow-clusteredseqs.fa --retain_pfam_hits pfam.domtblout --retain_blastp_hits blastp_longest_orfs.pep-uniref100.tab --train /data/databases/uniprot/uniref100-Viridiplantae.fasta


#cd ..

#mkdir Utri-Yellow
#cd Utri-Yellow

#TransDecoder.LongOrfs -t ../Utri-Yellow-clusteredseqs.fa --gene_trans_map ../Utri-Yellow-clusters_swap.txt 

#diamond blastp --query Utri-Yellow-clusteredseqs.fa.transdecoder_dir/longest_orfs.pep  --db /data/databases/uniprot/uniref100  --max-target-seqs 1 --evalue 1e-5 --threads 20 --daa blastp_longest_orfs.pep-uniref100.daa --verbose
#diamond view --daa blastp_longest_orfs.pep-uniref100.daa --outfmt tab --out blastp_longest_orfs.pep-uniref100.tab

#hmmscan --cpu 20 --domtblout pfam.domtblout /data/databases/Pfam-A.hmm Utri-Yellow-clusteredseqs.fa.transdecoder_dir/longest_orfs.pep > hmmscan.log

#TransDecoder.Predict -t ../Utri-Yellow-clusteredseqs.fa --retain_pfam_hits pfam.domtblout --retain_blastp_hits blastp_longest_orfs.pep-uniref100.tab --train /data/databases/uniprot/uniref100-Viridiplantae.fasta

#./getLongestClusterProtein.pl -i Uame-Purple/Uame-Purple-clusteredseqs.fa.transdecoder.pep > Uame-Purple/Uame-Purple-clusteredseqs.transdecoder.longestprot.pep
#./getLongestClusterProtein.pl -i Uame-White/Uame-White-clusteredseqs.fa.transdecoder.pep > Uame-White/Uame-White-clusteredseqs.transdecoder.longestprot.pep
#./getLongestClusterProtein.pl -i Uame-Yellow/Uame-Yellow-clusteredseqs.fa.transdecoder.pep > Uame-Yellow/Uame-Yellow-clusteredseqs.transdecoder.longestprot.pep
#./getLongestClusterProtein.pl -i Utri-Yellow/Utri-Yellow-clusteredseqs.fa.transdecoder.pep > Utri-Yellow/Utri-Yellow-clusteredseqs.transdecoder.longestprot.pep
#
#mkdir -p Inparanoid
#cd Inparanoid
#
#ln -s ../Uame-Purple/Uame-Purple-clusteredseqs.transdecoder.longestprot.pep
#ln -s ../Uame-White/Uame-White-clusteredseqs.transdecoder.longestprot.pep
#ln -s ../Uame-Yellow/Uame-Yellow-clusteredseqs.transdecoder.longestprot.pep
#ln -s ../Utri-Yellow/Utri-Yellow-clusteredseqs.transdecoder.longestprot.pep
#
#inparanoid+.pl Uame-Purple-clusteredseqs.transdecoder.longestprot.pep Uame-White-clusteredseqs.transdecoder.longestprot.pep &> inparanoid_UamePxUameW.log
#inparanoid+.pl Uame-Purple-clusteredseqs.transdecoder.longestprot.pep Uame-Yellow-clusteredseqs.transdecoder.longestprot.pep &> inparanoid_UamePxUameY.log
#inparanoid+.pl Uame-Purple-clusteredseqs.transdecoder.longestprot.pep Utri-Yellow-clusteredseqs.transdecoder.longestprot.pep &> inparanoid_UamePxUtriY.log
#inparanoid+.pl Uame-White-clusteredseqs.transdecoder.longestprot.pep Uame-Yellow-clusteredseqs.transdecoder.longestprot.pep &> inparanoid_UameWxUameY.log
#inparanoid+.pl Uame-White-clusteredseqs.transdecoder.longestprot.pep Utri-Yellow-clusteredseqs.transdecoder.longestprot.pep &> inparanoid_UameWxUtriY.log
#inparanoid+.pl Uame-Yellow-clusteredseqs.transdecoder.longestprot.pep Utri-Yellow-clusteredseqs.transdecoder.longestprot.pep  &> inparanoid_UameYxUtriY.log
#cd ..
#mkdir -p Multiparanoid
cd Multiparanoid

#cp ../Inparanoid/sqltable.* .
#
#mv sqltable.Uame-Purple-clusteredseqs.transdecoder.longestprot.pep-Uame-White-clusteredseqs.transdecoder.longestprot.pep sqltable.Uame_Purple-Uame_White
#mv sqltable.Uame-Purple-clusteredseqs.transdecoder.longestprot.pep-Uame-Yellow-clusteredseqs.transdecoder.longestprot.pep sqltable.Uame_Purple-Uame_Yellow
#mv sqltable.Uame-Purple-clusteredseqs.transdecoder.longestprot.pep-Utri-Yellow-clusteredseqs.transdecoder.longestprot.pep sqltable.Uame_Purple-Utri_Yellow
#mv sqltable.Uame-White-clusteredseqs.transdecoder.longestprot.pep-Uame-Yellow-clusteredseqs.transdecoder.longestprot.pep sqltable.Uame_White-Uame_Yellow
#mv sqltable.Uame-White-clusteredseqs.transdecoder.longestprot.pep-Utri-Yellow-clusteredseqs.transdecoder.longestprot.pep sqltable.Uame_White-Utri_Yellow
#mv sqltable.Uame-Yellow-clusteredseqs.transdecoder.longestprot.pep-Utri-Yellow-clusteredseqs.transdecoder.longestprot.pep sqltable.Uame_Yellow-Utri_Yellow

#for i in ../Inparanoid/sqltable.Uame-*; do
#        bn=`basename ${i} | sed 's/-clusteredseqs.transdecoder.longestprot.pep//g' | sed 's/\-/_/g' | sed 's/_U/-U/'`;
#        echo ${bn}
#        cat ${i} | sed 's/-clusteredseqs.transdecoder.longestprot.pep//' | perl -F"\t" -lane ' $F[2]=~s/-/_/; print join("\t",@F); ' > ${bn}
#done


multiparanoid.pl -species Uame_Purple+Uame_White+Uame_Yellow+Utri_Yellow


