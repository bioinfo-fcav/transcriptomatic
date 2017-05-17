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


#./mkCountMatrix.pl -p ../Transdecoder/new_corset/Multiparanoid/Uame_Purple-Uame_White-Uame_Yellow-Utri_Yellow.MP.sql -c Uame_Purple=../readsxtranscriptomes/CORSET/Uame-Purple-counts.txt -c Uame_White=../readsxtranscriptomes/CORSET/Uame-White-counts.txt -c Uame_Yellow=../readsxtranscriptomes/CORSET/Uame-Yellow-counts.txt -c Utri_Yellow=../readsxtranscriptomes/CORSET/Utri-Yellow-counts.txt -o Uame_Purple,Uame_White,Uame_Yellow,Utri_Yellow > Umatrix.tsv
#./mkCountMatrix.pl -p ../Transdecoder/new_corset/Multiparanoid/Uame_Purple-Uame_White-Uame_Yellow-Utri_Yellow.MP.sql -c Uame_Purple=../readsxtranscriptomes/CORSET/Uame-Purple-counts.txt -c Uame_White=../readsxtranscriptomes/CORSET/Uame-White-counts.txt -c Uame_Yellow=../readsxtranscriptomes/CORSET/Uame-Yellow-counts.txt -c Utri_Yellow=../readsxtranscriptomes/CORSET/Utri-Yellow-counts.txt -o Uame_Purple,Uame_White,Uame_Yellow,Utri_Yellow -a ./Uaux.txt -m Uame_Purple=../Transdecoder/new_corset/Uame-Purple-clusters_swap.txt -m Uame_White=../Transdecoder/new_corset/Uame-White-clusters_swap.txt -m Uame_Yellow=../Transdecoder/new_corset/Uame-Yellow-clusters_swap.txt -m Utri_Yellow=../Transdecoder/new_corset/Utri-Yellow-clusters_swap.txt > /tmp/Umatrix.tsv

#./mkCountMatrixNC.pl -m Uame_Purple=../Transdecoder/new_corset/Uame-Purple-clusters_swap.txt -m Uame_White=../Transdecoder/new_corset/Uame-White-clusters_swap.txt -m Uame_Yellow=../Transdecoder/new_corset/Uame-Yellow-clusters_swap.txt -m Utri_Yellow=../Transdecoder/new_corset/Utri-Yellow-clusters_swap.txt -s /data/project/flowers/BlastR/TEST/OUTPUT.clt -c Uame_Purple=../readsxtranscriptomes/CORSET/Uame-Purple-counts.txt -c Uame_White=../readsxtranscriptomes/CORSET/Uame-White-counts.txt -c Uame_Yellow=../readsxtranscriptomes/CORSET/Uame-Yellow-counts.txt -c Utri_Yellow=../readsxtranscriptomes/CORSET/Utri-Yellow-counts.txt -o Uame_Purple,Uame_White,Uame_Yellow,Utri_Yellow | grep -v '^OrthoID' >> Umatrix.tsv

./mkCountMatrixNC.pl -m Uame_Purple=../Transdecoder/new_corset/Uame-Purple-clusters_swap.txt -m Uame_White=../Transdecoder/new_corset/Uame-White-clusters_swap.txt -m Uame_Yellow=../Transdecoder/new_corset/Uame-Yellow-clusters_swap.txt -m Utri_Yellow=../Transdecoder/new_corset/Utri-Yellow-clusters_swap.txt -s /data/project/flowers/BlastR/TEST/OUTPUT.clt -c Uame_Purple=../readsxtranscriptomes/CORSET/Uame-Purple-counts.txt -c Uame_White=../readsxtranscriptomes/CORSET/Uame-White-counts.txt -c Uame_Yellow=../readsxtranscriptomes/CORSET/Uame-Yellow-counts.txt -c Utri_Yellow=../readsxtranscriptomes/CORSET/Utri-Yellow-counts.txt -o Uame_Purple,Uame_White,Uame_Yellow,Utri_Yellow -a ./UauxNC.txt | grep -v '^OrthoID' >> /tmp/Umatrix.tsv.2

./mkAnnMatrix.pl -i Uaux.txt -a Uame_White=/work/projects/flowers/Blast2GO/Uame-Purple.annot -a Uame_White=/work/projects/flowers/Blast2GO/Uame-White.annot -a Uame_Yellow=/work/projects/flowers/Blast2GO/Uame-Yellow.annot -a Utri_Yellow=/work/projects/flowers/Blast2GO/Utri-Yellow.annot > Uannot.tsv
