#!/bin/bash
#
#              INGLÊS/ENGLISH
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  http://www.gnu.org/copyleft/gpl.html
#
#
#             PORTUGUÊS/PORTUGUESE
#  Este programa é distribuído na expectativa de ser útil aos seus
#  usuários, porém NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
#  COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.  Consulte
#  a Licença Pública Geral GNU para maiores detalhes.
#  http://www.gnu.org/copyleft/gpl.html
#
#  Copyright (C) 2012  Universidade de São Paulo
#
#  Universidade de São Paulo
#  Laboratório de Biologia do Desenvolvimento de Abelhas
#  Núcleo de Bioinformática (LBDA-BioInfo)
#
#  Daniel Guariz Pinheiro
#  dgpinheiro@gmail.com
#  http://zulu.fmrp.usp.br/bioinfo 
#

mkdir -p GFF
#Uame-Purple-2dez2016-selected.renamed.fa
for i in `ls *-selected.renamed.fa`; do bn=`basename ${i} .renamed.fa`; echo ${bn}; fasta2gff.pl -i ${i} > GFF/${bn}.gff; done

mkdir -p COUNTS

samtools view ./Uame-Purple_map_B1.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-Purple-2dez2016-selected.gff > COUNTS/Uame-Purple_counts_B1.txt  2> /dev/null
samtools view ./Uame-Purple_map_B2.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-Purple-2dez2016-selected.gff > COUNTS/Uame-Purple_counts_B2.txt  2> /dev/null
samtools view ./Uame-Purple_map_B3.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-Purple-2dez2016-selected.gff > COUNTS/Uame-Purple_counts_B3.txt  2> /dev/null
                                     
samtools view ./Uame-White_map_B1.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-White-2dez2016-selected.gff > COUNTS/Uame-White_counts_B1.txt  2> /dev/null
samtools view ./Uame-White_map_B2.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-White-2dez2016-selected.gff > COUNTS/Uame-White_counts_B2.txt  2> /dev/null
samtools view ./Uame-White_map_B3.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-White-2dez2016-selected.gff > COUNTS/Uame-White_counts_B3.txt  2> /dev/null
                                     
samtools view ./Uame-Yellow_map_B1.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-Yellow-2dez2016-selected.gff > COUNTS/Uame-Yellow_counts_B1.txt  2> /dev/null
samtools view ./Uame-Yellow_map_B2.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-Yellow-2dez2016-selected.gff > COUNTS/Uame-Yellow_counts_B2.txt  2> /dev/null
#
samtools view ./Utri-Yellow_map_B1.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Utri-Yellow-2dez2016-selected.gff > COUNTS/Utri-Yellow_counts_B1.txt  2> /dev/null


./filterMatches.pl 	-i White1=./COUNTS/Uame-White_counts_B1.txt \
			-i White2=./COUNTS/Uame-White_counts_B2.txt \
			-i White3=./COUNTS/Uame-White_counts_B3.txt > COUNTS/Uame-White-list.txt

./filterMatches.pl 	-i Purple1=./COUNTS/Uame-Purple_counts_B1.txt \
			-i Purple2=./COUNTS/Uame-Purple_counts_B2.txt \
			-i Purple3=./COUNTS/Uame-Purple_counts_B3.txt > COUNTS/Uame-Purple-list.txt

./filterMatches.pl 	-i Yellow1=./COUNTS/Uame-Yellow_counts_B1.txt \
			-i Yellow2=./COUNTS/Uame-Yellow_counts_B2.txt > COUNTS/Uame-Yellow-list.txt


samtools view -q 10 ./Uame-Purple_map_B1.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-Purple-2dez2016-selected.gff > COUNTS/Uame-Purple_counts_Q10_B1.txt  2> /dev/null
samtools view -q 10 ./Uame-Purple_map_B2.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-Purple-2dez2016-selected.gff > COUNTS/Uame-Purple_counts_Q10_B2.txt  2> /dev/null
samtools view -q 10 ./Uame-Purple_map_B3.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-Purple-2dez2016-selected.gff > COUNTS/Uame-Purple_counts_Q10_B3.txt  2> /dev/null

samtools view -q 10 ./Uame-White_map_B1.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-White-2dez2016-selected.gff > COUNTS/Uame-White_counts_Q10_B1.txt  2> /dev/null
samtools view -q 10 ./Uame-White_map_B2.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-White-2dez2016-selected.gff > COUNTS/Uame-White_counts_Q10_B2.txt  2> /dev/null
samtools view -q 10 ./Uame-White_map_B3.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-White-2dez2016-selected.gff > COUNTS/Uame-White_counts_Q10_B3.txt  2> /dev/null
                                      
samtools view -q 10 ./Uame-Yellow_map_B1.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-Yellow-2dez2016-selected.gff > COUNTS/Uame-Yellow_counts_Q10_B1.txt  2> /dev/null
samtools view -q 10 ./Uame-Yellow_map_B2.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Uame-Yellow-2dez2016-selected.gff > COUNTS/Uame-Yellow_counts_Q10_B2.txt  2> /dev/null

samtools view -q 10 ./Utri-Yellow_map_B1.bam | htseq-count --stranded=reverse --type=exon --idattr=Parent - GFF/Utri-Yellow-2dez2016-selected.gff > COUNTS/Utri-Yellow_counts_Q10_B1.txt  2> /dev/null

./filterMatches.pl 	-i White1=./COUNTS/Uame-White_counts_Q10_B1.txt \
			-i White2=./COUNTS/Uame-White_counts_Q10_B2.txt \
			-i White3=./COUNTS/Uame-White_counts_Q10_B3.txt > COUNTS/Uame-White-Q10-list.txt

./filterMatches.pl 	-i Purple1=./COUNTS/Uame-Purple_counts_Q10_B1.txt \
			-i Purple2=./COUNTS/Uame-Purple_counts_Q10_B2.txt \
			-i Purple3=./COUNTS/Uame-Purple_counts_Q10_B3.txt > COUNTS/Uame-Purple-Q10-list.txt

./filterMatches.pl 	-i Yellow1=./COUNTS/Uame-Yellow_counts_Q10_B1.txt \
			-i Yellow2=./COUNTS/Uame-Yellow_counts_Q10_B2.txt > COUNTS/Uame-Yellow-Q10-list.txt

