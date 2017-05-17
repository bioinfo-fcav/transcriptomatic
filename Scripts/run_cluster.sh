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

./sortFA.pl -i Uame-Purple-2dez2016-STM-FinalAssembly.renamed.fa > Uame-Purple-ToCluster.fa
usearch -cluster_smallmem Uame-Purple-ToCluster.fa -id 0.9 -uc Uame-Purple-clusters.uc

./sortFA.pl -i Uame-White-2dez2016-STM-FinalAssembly.renamed.fa > Uame-White-ToCluster.fa
usearch -cluster_smallmem Uame-White-ToCluster.fa -id 0.9 -uc Uame-White-clusters.uc

./sortFA.pl -i Uame-Yellow-2dez2016-STM-FinalAssembly.renamed.fa > Uame-Yellow-ToCluster.fa
usearch -cluster_smallmem Uame-Yellow-ToCluster.fa -id 0.9 -uc Uame-Yellow-clusters.uc

./sortFA.pl -i Utri-Yellow-2dez2016-STM-FinalAssembly.renamed.fa > Utri-Yellow-ToCluster.fa
usearch -cluster_smallmem Utri-Yellow-ToCluster.fa -id 0.9 -uc Utri-Yellow-clusters.uc

cat Uame-Purple-clusters.uc | ./uclust_parser.pl -n 5 -m 100 -t 10 > Uame-Purple-clusters.uc.parsed
cat Uame-White-clusters.uc  | ./uclust_parser.pl -n 5 -m 100 -t 10 > Uame-White-clusters.uc.parsed
cat Uame-Yellow-clusters.uc | ./uclust_parser.pl -n 5 -m 100 -t 10 > Uame-Yellow-clusters.uc.parsed
cat Utri-Yellow-clusters.uc | ./uclust_parser.pl -n 5 -m 100 -t 10 > Utri-Yellow-clusters.uc.parsed

grep '^C' Uame-Purple-clusters.uc.parsed | cut -f 9 > Uame-Purple-clusters.uc.parsed.selected
grep '^C' Uame-White-clusters.uc.parsed  | cut -f 9  > Uame-White-clusters.uc.parsed.selected
grep '^C' Uame-Yellow-clusters.uc.parsed | cut -f 9 > Uame-Yellow-clusters.uc.parsed.selected
grep '^C' Utri-Yellow-clusters.uc.parsed | cut -f 9 > Utri-Yellow-clusters.uc.parsed.selected

