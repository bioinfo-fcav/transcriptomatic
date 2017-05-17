#!/usr/bin/perl

use strict;
use warnings;

use Bio::SeqIO; 

my $seqin=Bio::SeqIO->new(-fh=>\*STDIN, -format=>"FASTA"); 
my $seqout=Bio::SeqIO->new(-fh=>\*STDOUT, -format=>"FASTA"); 
while(my $seq=$seqin->next_seq()) { 
    $seq->description("");
    $seqout->write_seq($seq); 
}
