#!/bin/bash

../diamond blastx --max-target-seqs 1 -d ../refs/Uniref90_Viridiplantae/uniprot_viridiplantae.dmnd --id2 arg -q sum_assembly_plus/Uame-Purple/Uame-Purple-Trinity-Long-nonL-reads.fasta --more-sensitive -o trinity_Uame_Purple_2dez2016.xml -f xml -e 0.00001

mapBlastHit.py -v -d 60 -c 50 -i trinity_Uame_Purple_2dez2016.xml -o Uame-Purple_mapfile -s sum_assembly_plus/Uame-Purple/Uame-Purple-Trinity-Long-nonL-reads.fasta

grep -v -P '\t\-$' Uame-Purple_mapfile > Uame-Purple_plus_mapfile

getNonMatches.pl -i sum_assembly_plus/Uame-Purple/Uame-Purple-Trinity-Long-nonL-reads.fasta -m Uame-Purple_plus_mapfile > Uame-Purple_mapfile_orphans.fa

/usr/local/bioinfo/STM/map2contig.py -p fl0w3r -n 20 -j 20 -h localhost -i Uame-Purple_plus_mapfile -s sum_assembly_plus/Uame-Purple/Uame-Purple-Trinity-Long-nonL-reads.fasta -o scaffolds_stm_2dez2016_Uame-Purple.fa -r ../refs/Uniref90_Viridiplantae/uniprot_viridiplantae.fasta

sortOrphans.py -i Uame-Purple_mapfile_orphans.fa -p seq

sortOrphans.py -i scaffolds_stm_2dez2016_Uame-Purple_orphans.fa -p seq

cat scaffolds_stm_2dez2016_Uame-Purple.fa scaffolds_stm_2dez2016_Uame-Purple_rejected.fa Uame-Purple_mapfile_orphans_contigs.fa scaffolds_stm_2dez2016_Uame-Purple_orphans_contigs.fa > Uame-Purple-2dez2016-STM-FinalAssembly.fa



../diamond blastx --max-target-seqs 1 -d ../refs/Uniref90_Viridiplantae/uniprot_viridiplantae.dmnd --id2 arg -q sum_assembly_plus/Uame-White/Uame-White-Trinity-Long-nonL-reads.fasta --more-sensitive -o trinity_Uame_White_2dez2016.xml -f xml -e 0.00001

mapBlastHit.py -v -d 60 -c 50 -i trinity_Uame_White_2dez2016.xml -o Uame-White_mapfile -s sum_assembly_plus/Uame-White/Uame-White-Trinity-Long-nonL-reads.fasta

grep -v -P '\t\-$' Uame-White_mapfile > Uame-White_plus_mapfile

getNonMatches.pl -i sum_assembly_plus/Uame-White/Uame-White-Trinity-Long-nonL-reads.fasta -m Uame-White_plus_mapfile > Uame-White_mapfile_orphans.fa

/usr/local/bioinfo/STM/map2contig.py -p fl0w3r -n 20 -j 20 -h localhost -i Uame-White_plus_mapfile -s sum_assembly_plus/Uame-White/Uame-White-Trinity-Long-nonL-reads.fasta -o scaffolds_stm_2dez2016_Uame-White.fa -r ../refs/Uniref90_Viridiplantae/uniprot_viridiplantae.fasta

sortOrphans.py -i Uame-White_mapfile_orphans.fa -p seq

sortOrphans.py -i scaffolds_stm_2dez2016_Uame-White_orphans.fa -p seq

cat scaffolds_stm_2dez2016_Uame-White.fa scaffolds_stm_2dez2016_Uame-White_rejected.fa Uame-White_mapfile_orphans_contigs.fa scaffolds_stm_2dez2016_Uame-White_orphans_contigs.fa > Uame-White-2dez2016-STM-FinalAssembly.fa



../diamond blastx --max-target-seqs 1 -d ../refs/Uniref90_Viridiplantae/uniprot_viridiplantae.dmnd --id2 arg -q sum_assembly_plus/Uame-Yellow/Uame-Yellow-Trinity-Long-nonL-reads.fasta --more-sensitive -o trinity_Uame_Yellow_2dez2016.xml -f xml -e 0.00001

mapBlastHit.py -v -d 60 -c 50 -i trinity_Uame_Yellow_2dez2016.xml -o Uame-Yellow_mapfile -s sum_assembly_plus/Uame-Yellow/Uame-Yellow-Trinity-Long-nonL-reads.fasta

grep -v -P '\t\-$' Uame-Yellow_mapfile > Uame-Yellow_plus_mapfile

getNonMatches.pl -i sum_assembly_plus/Uame-Yellow/Uame-Yellow-Trinity-Long-nonL-reads.fasta -m Uame-Yellow_plus_mapfile > Uame-Yellow_mapfile_orphans.fa

/usr/local/bioinfo/STM/map2contig.py -p fl0w3r -n 20 -j 20 -h localhost -i Uame-Yellow_plus_mapfile -s sum_assembly_plus/Uame-Yellow/Uame-Yellow-Trinity-Long-nonL-reads.fasta -o scaffolds_stm_2dez2016_Uame-Yellow.fa -r ../refs/Uniref90_Viridiplantae/uniprot_viridiplantae.fasta

sortOrphans.py -i Uame-Yellow_mapfile_orphans.fa -p seq

sortOrphans.py -i scaffolds_stm_2dez2016_Uame-Yellow_orphans.fa -p seq

cat scaffolds_stm_2dez2016_Uame-Yellow.fa scaffolds_stm_2dez2016_Uame-Yellow_rejected.fa Uame-Yellow_mapfile_orphans_contigs.fa scaffolds_stm_2dez2016_Uame-Yellow_orphans_contigs.fa > Uame-Yellow-2dez2016-STM-FinalAssembly.fa


../diamond blastx --max-target-seqs 1 -d ../refs/Uniref90_Viridiplantae/uniprot_viridiplantae.dmnd --id2 arg -q sum_assembly_plus/Utri-Yellow/Utri-Yellow-Trinity-Long-nonL-reads.fasta --more-sensitive -o trinity_Utri_Yellow_2dez2016 -f xml -e 0.00001

mapBlastHit.py -v -d 60 -c 50 -i trinity_Utri_Yellow_2dez2016 -o Utri-Yellow_mapfile -s sum_assembly_plus/Utri-Yellow/Utri-Yellow-Trinity-Long-nonL-reads.fasta

grep -v -P '\t\-$' Utri-Yellow_mapfile > Utri-Yellow_plus_mapfile

getNonMatches.pl -i sum_assembly_plus/Utri-Yellow/Utri-Yellow-Trinity-Long-nonL-reads.fasta -m Utri-Yellow_plus_mapfile > Utri-Yellow_mapfile_orphans.fa

/usr/local/bioinfo/STM/map2contig.py -p fl0w3r -n 20 -j 20 -h localhost -i Utri-Yellow_plus_mapfile -s sum_assembly_plus/Utri-Yellow/Utri-Yellow-Trinity-Long-nonL-reads.fasta -o scaffolds_stm_2dez2016_Utri-Yellow.fa -r ../refs/Uniref90_Viridiplantae/uniprot_viridiplantae.fasta

sortOrphans.py -i Utri-Yellow_mapfile_orphans.fa -p seq

sortOrphans.py -i scaffolds_stm_2dez2016_Utri-Yellow_orphans.fa -p seq

cat scaffolds_stm_2dez2016_Utri-Yellow.fa scaffolds_stm_2dez2016_Utri-Yellow_rejected.fa Utri-Yellow_mapfile_orphans_contigs.fa scaffolds_stm_2dez2016_Utri-Yellow_orphans_contigs.fa > Utri-Yellow-2dez2016-STM-FinalAssembly.fa

assemblathon_stats.pl Uame-Purple-2dez2016-STM-FinalAssembly.fa

assemblathon_stats.pl Uame-White-2dez2016-STM-FinalAssembly.fa

assemblathon_stats.pl Uame-Yellow-2dez2016-STM-FinalAssembly.fa

assemblathon_stats.pl Utri-Yellow-2dez2016-STM-FinalAssembly.fa
