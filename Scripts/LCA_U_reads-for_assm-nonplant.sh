#!/bin/bash

##Gerar arquivos LCA do MEGAN com os reads

#/usr/local/bioinfo/megan/tools/blast2lca -i Uame-Purple/nrxUame-Purple_B1_reads.results.sam -f SAM -o nrxUame-Purple_B1_reads.results -g2t gi2tax-July2016.bin

#/usr/local/bioinfo/megan/tools/blast2lca -i Uame-Purple/nrxUame-Purple_B2_reads.results.sam -f SAM -o nrxUame-Purple_B2_reads.results -g2t gi2tax-July2016.bin

#/usr/local/bioinfo/megan/tools/blast2lca -i Uame-Purple/nrxUame-Purple_B3_reads.results.sam -f SAM -o nrxUame-Purple_B3_reads.results -g2t gi2tax-July2016.bin


#/usr/local/bioinfo/megan/tools/blast2lca -i Uame-White/nrxUame-White_B1_reads_prinseq.all.sam -f SAM -o nrxUame-White_B1_reads.results -g2t gi2tax-July2016.bin

#/usr/local/bioinfo/megan/tools/blast2lca -i Uame-White/nrxUame-White_B2_reads_prinseq.all.sam -f SAM -o nrxUame-White_B2_reads.results -g2t gi2tax-July2016.bin

#/usr/local/bioinfo/megan/tools/blast2lca -i Uame-White/nrxUame-White_B3_reads_prinseq.all.sam -f SAM -o nrxUame-White_B3_reads.results -g2t gi2tax-July2016.bin

#/usr/local/bioinfo/megan/tools/blast2lca -i Uame-Yellow/nrxUame-Yellow_B1_reads_prinseq.all.sam -f SAM -o nrxUame-Yellow_B1_reads.results -g2t gi2tax-July2016.bin

#/usr/local/bioinfo/megan/tools/blast2lca -i Uame-Yellow/nrxUame-Yellow_B2_reads_prinseq.all.sam -f SAM -o nrxUame-Yellow_B2_reads.results -g2t gi2tax-July2016.bin

#/usr/local/bioinfo/megan/tools/blast2lca -i Utri-Yellow/nrxUtri-Yellow_B1_reads_prinseq.all.sam -f SAM -o nrxUtri-Yellow_B1_reads.results -g2t gi2tax-July2016.bin

##Gerar listas com os nomes dos reads diferentes da clssificação de "Viridiplantae" e "Not assigned" nos arquivos LCA do MEGAN

#cat nrxUame-Purple_B1_reads.lca | grep -v "Viridiplantae" | grep -v "Not assigned" | sed "s,;,\t,g" | cut -f 1 > nrxUame-Purple_B1_reads.lca.list

#cat nrxUame-Purple_B2_reads.lca | grep -v "Viridiplantae" | grep -v "Not assigned" | sed "s,;,\t,g" | cut -f 1 > nrxUame-Purple_B2_reads.lca.list

#cat nrxUame-Purple_B3_reads.lca | grep -v "Viridiplantae" | grep -v "Not assigned" | sed "s,;,\t,g" | cut -f 1 > nrxUame-Purple_B3_reads.lca.list

#cat nrxUame-White_B1_reads.lca | grep -v "Viridiplantae" | grep -v "Not assigned" | sed "s,;,\t,g" | cut -f 1 > nrxUame-White_B1_reads.lca.list

#cat nrxUame-White_B2_reads.lca | grep -v "Viridiplantae" | grep -v "Not assigned" | sed "s,;,\t,g" | cut -f 1 > nrxUame-White_B2_reads.lca.list

#cat nrxUame-White_B3_reads.lca | grep -v "Viridiplantae" | grep -v "Not assigned" | sed "s,;,\t,g" | cut -f 1 > nrxUame-White_B3_reads.lca.list

#cat nrxUame-Yellow_B1_reads.lca | grep -v "Viridiplantae" | grep -v "Not assigned" | sed "s,;,\t,g" | cut -f 1 > nrxUame-Yellow_B1_reads.lca.list

#cat nrxUame-Yellow_B2_reads.lca | grep -v "Viridiplantae" | grep -v "Not assigned" | sed "s,;,\t,g" | cut -f 1 > nrxUame-Yellow_B2_reads.lca.list

#cat nrxUtri-Yellow_B1_reads.lca | grep -v "Viridiplantae" | grep -v "Not assigned" | sed "s,;,\t,g" | cut -f 1 > nrxUtri-Yellow_B1_reads.lca.list

##Filtrar reads que são de outros organismos fora os de plantas usando o programa pullseq

cd Alignment_nrxsamples/Uame-Purple

#ln -s ../../../../processed/prinseq/Uame-Purple_B1.scythe.cutadapt.prinseq_1_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-Purple_B1.scythe.cutadapt.prinseq_2_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-Purple_B1.scythe.cutadapt.prinseq_1.fastq
#ln -s ../../../../processed/prinseq/Uame-Purple_B1.scythe.cutadapt.prinseq_2.fastq

#ln -s ../../../../processed/prinseq/Uame-Purple_B2.scythe.cutadapt.prinseq_1_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-Purple_B2.scythe.cutadapt.prinseq_2_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-Purple_B2.scythe.cutadapt.prinseq_1.fastq
#ln -s ../../../../processed/prinseq/Uame-Purple_B2.scythe.cutadapt.prinseq_2.fastq

#ln -s ../../../../processed/prinseq/Uame-Purple_B3.scythe.cutadapt.prinseq_1_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-Purple_B3.scythe.cutadapt.prinseq_2_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-Purple_B3.scythe.cutadapt.prinseq_1.fastq
#ln -s ../../../../processed/prinseq/Uame-Purple_B3.scythe.cutadapt.prinseq_2.fastq

pullseq -i Uame-Purple_B1.scythe.cutadapt.prinseq_1_singletons.fastq -n ../LCA/nrxUame-Purple_B1_reads.lca.list > /work/projects/flowers/nonplants/Uame-Purple_B1.nonplants_1_singletons.fastq
pullseq -i Uame-Purple_B1.scythe.cutadapt.prinseq_2_singletons.fastq  -n ../LCA/nrxUame-Purple_B1_reads.lca.list > /work/projects/flowers/nonplants/Uame-Purple_B1.nonplants_2_singletons.fastq

pullseq -i Uame-Purple_B1.scythe.cutadapt.prinseq_1.fastq  -n ../LCA/nrxUame-Purple_B1_reads.lca.list > /work/projects/flowers/nonplants/Uame-Purple_B1.nonplants_1.fastq
pullseq -i Uame-Purple_B1.scythe.cutadapt.prinseq_2.fastq  -n ../LCA/nrxUame-Purple_B1_reads.lca.list > /work/projects/flowers/nonplants/Uame-Purple_B1.nonplants_2.fastq

pullseq -i Uame-Purple_B2.scythe.cutadapt.prinseq_1_singletons.fastq  -n ../LCA/nrxUame-Purple_B2_reads.lca.list > /work/projects/flowers/nonplants/Uame-Purple_B2.nonplants_1_singletons.fastq
pullseq -i Uame-Purple_B2.scythe.cutadapt.prinseq_2_singletons.fastq  -n ../LCA/nrxUame-Purple_B2_reads.lca.list > /work/projects/flowers/nonplants/Uame-Purple_B2.nonplants_2_singletons.fastq
pullseq -i Uame-Purple_B2.scythe.cutadapt.prinseq_1.fastq  -n ../LCA/nrxUame-Purple_B2_reads.lca.list > /work/projects/flowers/nonplants/Uame-Purple_B2.nonplants_1.fastq
pullseq -i Uame-Purple_B2.scythe.cutadapt.prinseq_2.fastq  -n ../LCA/nrxUame-Purple_B2_reads.lca.list > /work/projects/flowers/nonplants/Uame-Purple_B2.nonplants_2.fastq

pullseq -i Uame-Purple_B3.scythe.cutadapt.prinseq_1_singletons.fastq  -n ../LCA/nrxUame-Purple_B3_reads.lca.list > /work/projects/flowers/nonplants/Uame-Purple_B3.nonplants_1_singletons.fastq
pullseq -i Uame-Purple_B3.scythe.cutadapt.prinseq_2_singletons.fastq  -n ../LCA/nrxUame-Purple_B3_reads.lca.list > /work/projects/flowers/nonplants/Uame-Purple_B3.nonplants_2_singletons.fastq
pullseq -i Uame-Purple_B3.scythe.cutadapt.prinseq_1.fastq  -n ../LCA/nrxUame-Purple_B3_reads.lca.list > /work/projects/flowers/nonplants/Uame-Purple_B3.nonplants_1.fastq
pullseq -i Uame-Purple_B3.scythe.cutadapt.prinseq_2.fastq  -n ../LCA/nrxUame-Purple_B3_reads.lca.list > /work/projects/flowers/nonplants/Uame-Purple_B3.nonplants_2.fastq

cd ../../
cd Alignment_nrxsamples/Uame-White

#ln -s ../../../../processed/prinseq/Uame-White_B1.scythe.cutadapt.prinseq_1_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-White_B1.scythe.cutadapt.prinseq_2_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-White_B1.scythe.cutadapt.prinseq_1.fastq
#ln -s ../../../../processed/prinseq/Uame-White_B1.scythe.cutadapt.prinseq_2.fastq

#ln -s ../../../../processed/prinseq/Uame-White_B2.scythe.cutadapt.prinseq_1_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-White_B2.scythe.cutadapt.prinseq_2_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-White_B2.scythe.cutadapt.prinseq_1.fastq
#ln -s ../../../../processed/prinseq/Uame-White_B2.scythe.cutadapt.prinseq_2.fastq

#ln -s ../../../../processed/prinseq/Uame-White_B3.scythe.cutadapt.prinseq_1_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-White_B3.scythe.cutadapt.prinseq_2_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-White_B3.scythe.cutadapt.prinseq_1.fastq
#ln -s ../../../../processed/prinseq/Uame-White_B3.scythe.cutadapt.prinseq_2.fastq

pullseq -i Uame-White_B1.scythe.cutadapt.prinseq_1_singletons.fastq  -n ../LCA/nrxUame-White_B1_reads.lca.list > /work/projects/flowers/nonplants/Uame-White_B1.nonplants_1_singletons.fastq
pullseq -i Uame-White_B1.scythe.cutadapt.prinseq_2_singletons.fastq  -n ../LCA/nrxUame-White_B1_reads.lca.list > /work/projects/flowers/nonplants/Uame-White_B1.nonplants_2_singletons.fastq
pullseq -i Uame-White_B1.scythe.cutadapt.prinseq_1.fastq  -n ../LCA/nrxUame-White_B1_reads.lca.list > /work/projects/flowers/nonplants/Uame-White_B1.nonplants_1.fastq
pullseq -i Uame-White_B1.scythe.cutadapt.prinseq_2.fastq  -n ../LCA/nrxUame-White_B1_reads.lca.list > /work/projects/flowers/nonplants/Uame-White_B1.nonplants_2.fastq

pullseq -i Uame-White_B2.scythe.cutadapt.prinseq_1_singletons.fastq  -n ../LCA/nrxUame-White_B2_reads.lca.list > /work/projects/flowers/nonplants/Uame-White_B2.nonplants_1_singletons.fastq
pullseq -i Uame-White_B2.scythe.cutadapt.prinseq_2_singletons.fastq  -n ../LCA/nrxUame-White_B2_reads.lca.list > /work/projects/flowers/nonplants/Uame-White_B2.nonplants_2_singletons.fastq
pullseq -i Uame-White_B2.scythe.cutadapt.prinseq_1.fastq  -n ../LCA/nrxUame-White_B2_reads.lca.list > /work/projects/flowers/nonplants/Uame-White_B2.nonplants_1.fastq
pullseq -i Uame-White_B2.scythe.cutadapt.prinseq_2.fastq  -n ../LCA/nrxUame-White_B2_reads.lca.list > /work/projects/flowers/nonplants/Uame-White_B2.nonplants_2.fastq

pullseq -i Uame-White_B3.scythe.cutadapt.prinseq_1_singletons.fastq  -n ../LCA/nrxUame-White_B3_reads.lca.list > /work/projects/flowers/nonplants/Uame-White_B3.nonplants_1_singletons.fastq
pullseq -i Uame-White_B3.scythe.cutadapt.prinseq_2_singletons.fastq  -n ../LCA/nrxUame-White_B3_reads.lca.list > /work/projects/flowers/nonplants/Uame-White_B3.nonplants_2_singletons.fastq
pullseq -i Uame-White_B3.scythe.cutadapt.prinseq_1.fastq  -n ../LCA/nrxUame-White_B3_reads.lca.list > /work/projects/flowers/nonplants/Uame-White_B3.nonplants_1.fastq
pullseq -i Uame-White_B3.scythe.cutadapt.prinseq_2.fastq  -n ../LCA/nrxUame-White_B3_reads.lca.list > /work/projects/flowers/nonplants/Uame-White_B3.nonplants_2.fastq

cd ../../
cd Alignment_nrxsamples/Uame-Yellow

#ln -s ../../../../processed/prinseq/Uame-Yellow_B1.scythe.cutadapt.prinseq_1_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-Yellow_B1.scythe.cutadapt.prinseq_2_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-Yellow_B1.scythe.cutadapt.prinseq_1.fastq
#ln -s ../../../../processed/prinseq/Uame-Yellow_B1.scythe.cutadapt.prinseq_2.fastq

#ln -s ../../../../processed/prinseq/Uame-Yellow_B2.scythe.cutadapt.prinseq_1_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-Yellow_B2.scythe.cutadapt.prinseq_2_singletons.fastq
#ln -s ../../../../processed/prinseq/Uame-Yellow_B2.scythe.cutadapt.prinseq_1.fastq
#ln -s ../../../../processed/prinseq/Uame-Yellow_B2.scythe.cutadapt.prinseq_2.fastq

pullseq -i Uame-Yellow_B1.scythe.cutadapt.prinseq_1_singletons.fastq  -n ../LCA/nrxUame-Yellow_B1_reads.lca.list > /work/projects/flowers/nonplants/Uame-Yellow_B1.nonplants_1_singletons.fastq
pullseq -i Uame-Yellow_B1.scythe.cutadapt.prinseq_2_singletons.fastq  -n ../LCA/nrxUame-Yellow_B1_reads.lca.list > /work/projects/flowers/nonplants/Uame-Yellow_B1.nonplants_2_singletons.fastq
pullseq -i Uame-Yellow_B1.scythe.cutadapt.prinseq_1.fastq  -n ../LCA/nrxUame-Yellow_B1_reads.lca.list > /work/projects/flowers/nonplants/Uame-Yellow_B1.nonplants_1.fastq
pullseq -i Uame-Yellow_B1.scythe.cutadapt.prinseq_2.fastq  -n ../LCA/nrxUame-Yellow_B1_reads.lca.list > /work/projects/flowers/nonplants/Uame-Yellow_B1.nonplants_2.fastq

pullseq -i Uame-Yellow_B2.scythe.cutadapt.prinseq_1_singletons.fastq  -n ../LCA/nrxUame-Yellow_B2_reads.lca.list > /work/projects/flowers/nonplants/Uame-Yellow_B2.nonplants_1_singletons.fastq
pullseq -i Uame-Yellow_B2.scythe.cutadapt.prinseq_2_singletons.fastq  -n ../LCA/nrxUame-Yellow_B2_reads.lca.list > /work/projects/flowers/nonplants/Uame-Yellow_B2.nonplants_2_singletons.fastq
pullseq -i Uame-Yellow_B2.scythe.cutadapt.prinseq_1.fastq  -n ../LCA/nrxUame-Yellow_B2_reads.lca.list > /work/projects/flowers/nonplants/Uame-Yellow_B2.nonplants_1.fastq
pullseq -i Uame-Yellow_B2.scythe.cutadapt.prinseq_2.fastq  -n ../LCA/nrxUame-Yellow_B2_reads.lca.list > /work/projects/flowers/nonplants/Uame-Yellow_B2.nonplants_2.fastq

cd ../../
cd Alignment_nrxsamples/Utri-Yellow

#ln -s ../../../../processed/prinseq/Utri-Yellow_B1.scythe.cutadapt.prinseq_1_singletons.fastq
#ln -s ../../../../processed/prinseq/Utri-Yellow_B1.scythe.cutadapt.prinseq_2_singletons.fastq
#ln -s ../../../../processed/prinseq/Utri-Yellow_B1.scythe.cutadapt.prinseq_1.fastq
#ln -s ../../../../processed/prinseq/Utri-Yellow_B1.scythe.cutadapt.prinseq_2.fastq

pullseq -i Utri-Yellow_B1.scythe.cutadapt.prinseq_1_singletons.fastq  -n ../LCA/nrxUtri-Yellow_B1_reads.lca.list > /work/projects/flowers/nonplants/Utri-Yellow_B1.nonplants_1_singletons.fastq
pullseq -i Utri-Yellow_B1.scythe.cutadapt.prinseq_2_singletons.fastq  -n ../LCA/nrxUtri-Yellow_B1_reads.lca.list > /work/projects/flowers/nonplants/Utri-Yellow_B1.nonplants_2_singletons.fastq
pullseq -i Utri-Yellow_B1.scythe.cutadapt.prinseq_1.fastq  -n ../LCA/nrxUtri-Yellow_B1_reads.lca.list > /work/projects/flowers/nonplants/Utri-Yellow_B1.nonplants_1.fastq
pullseq -i Utri-Yellow_B1.scythe.cutadapt.prinseq_2.fastq  -n ../LCA/nrxUtri-Yellow_B1_reads.lca.list > /work/projects/flowers/nonplants/Utri-Yellow_B1.nonplants_2.fastq





