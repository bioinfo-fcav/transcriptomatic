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

#ln -s ../Uame-Purple_map_B1.bam.sorted.bam UameP1.bam
#ln -s ../Uame-Purple_map_B2.bam.sorted.bam UameP2.bam
#ln -s ../Uame-Purple_map_B3.bam.sorted.bam UameP3.bam

corset -g 1,1,1 -m 1 -p Uame-Purple -n UameP1,UameP2,UameP3 Uame-Purple_map_B1.bam Uame-Purple_map_B2.bam Uame-Purple_map_B3.bam

#ln -s ../Utri-Yellow_map_B1.bam.sorted.bam UtriY1.bam

corset -g 1 -m 1 -p Utri-Yellow -n UtriY1 Utri-Yellow_map_B1.bam

#ln -s ../Uame-Yellow_map_B1.bam.sorted.bam UameY1.bam
#ln -s ../Uame-Yellow_map_B2.bam.sorted.bam UameY2.bam

corset -g 1,1 -m 1 -p Uame-Yellow -n UameY1,UameY2 Uame-Yellow_map_B1.bam Uame-Yellow_map_B2.bam

#ln -s ../Uame-White_map_B1.bam.sorted.bam UameW1.bam
#ln -s ../Uame-White_map_B2.bam.sorted.bam UameW2.bam
#ln -s ../Uame-White_map_B3.bam.sorted.bam UameW3.bam

corset -g 1,1,1 -m 1 -p Uame-White -n UameW1,UameW2,UameW3 Uame-White_map_B1.bam Uame-White_map_B2.bam Uame-White_map_B3.bam

