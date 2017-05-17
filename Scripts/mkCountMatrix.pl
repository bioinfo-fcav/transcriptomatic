#!/usr/bin/perl
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
# $Id$

=head1 NAME

=head1 SYNOPSIS

=head1 ABSTRACT

=head1 DESCRIPTION
    
    Arguments:

        -h/--help   Help
        -l/--level  Log level [Default: FATAL] 
            OFF
            FATAL
            ERROR
            WARN
            INFO
            DEBUG
            TRACE
            ALL

=head1 AUTHOR

Daniel Guariz Pinheiro E<lt>dgpinheiro@gmail.comE<gt>

Copyright (c) 2012 Universidade de São Paulo

=head1 LICENSE

GNU General Public License

http://www.gnu.org/copyleft/gpl.html


=cut

use strict;
use warnings;
use Readonly;
use Getopt::Long;

use vars qw/$LOGGER/;

INIT {
    use Log::Log4perl qw/:easy/;
    Log::Log4perl->easy_init($FATAL);
    $LOGGER = Log::Log4perl->get_logger($0);
}

my ($level, $multiparanoid_file, %corset, @order, $auxfile, %map);

Usage("Too few arguments") if $#ARGV < 0;
GetOptions( "h|?|help" => sub { &Usage(); },
            "l|level=s"=> \$level,
            "p|multiparanoid=s"=>\$multiparanoid_file,
            "c|corset=s"=>\%corset,
            "o|order=s"=>\@order,
            "a|auxfile=s"=>\$auxfile,
            "m|map=s"=>\%map
    ) or &Usage();

$auxfile||='./mkCountMatrix.aux';

if ($level) {
    my %LEVEL = (   
    'OFF'   =>$OFF,
    'FATAL' =>$FATAL,
    'ERROR' =>$ERROR,
    'WARN'  =>$WARN,
    'INFO'  =>$INFO,
    'DEBUG' =>$DEBUG,
    'TRACE' =>$TRACE,
    'ALL'   =>$ALL);
    $LOGGER->logdie("Wrong log level ($level). Choose one of: ".join(', ', keys %LEVEL)) unless (exists $LEVEL{$level});
    Log::Log4perl->easy_init($LEVEL{$level});
}

if ($order[0]) {
    @order = split(/,/, $order[0]);
}

my %ortholog;

$LOGGER->logdie("Missing multiparanoid file") unless ($multiparanoid_file);
$LOGGER->logdie("Wrong multiparanoid file ($multiparanoid_file)") unless ($multiparanoid_file);

my %spp;
open(MP, "<", $multiparanoid_file) or $LOGGER->logdie($!);
my $mpheader_str=<MP>;
#clusterID       species gene    is_seed_ortholog        confidence_score        species_in_cluster      tree_conflict
chomp($mpheader_str);
my @mpheader=split(/\t/, $mpheader_str);
while(<MP>) {
    chomp;
    my %mpdata;
    @mpdata{@mpheader} = split(/\t/, $_);
    my ($g) = $mpdata{'gene'} =~/([^:]+)/;
    $ortholog{$mpdata{'clusterID'}}->{$mpdata{'species'}}->{$g} = $mpdata{'confidence_score'};
    $spp{ $mpdata{'species'} } = undef;
}
close(MP);

foreach my $sp (keys %spp) {
    $LOGGER->logdie("Missing \"$sp\" CORSET result") unless (exists $corset{$sp});
}

my %corsetmap;
foreach my $sp (keys %map) {

    $LOGGER->logdie("Missing \"$sp\" map result") unless (exists $map{$sp});
    $LOGGER->logdie("Wrong map file ($map{$sp})") unless (-e $map{$sp});

    open(MAP, "<", $map{$sp}) or $LOGGER->logdie($!);
    while(<MAP>) {
        chomp;
        my ($c, $s) = split(/\t/, $_);
        push(@{ $corsetmap{$sp}->{$c} }, $s);
    }
    close(MAP);
}


my %corset_counts;
my %spprep;
foreach my $c (keys %corset) {
    $LOGGER->logdie("Not found \"$c\" into Multiparanoid result") unless (exists $spp{ $c });
    $LOGGER->info("Loading $c ...");
    open(CORSET, "<", $corset{$c}) or $LOGGER->logdie($!);
    my $csheader_str=<CORSET>;
    #        UameP1  UameP2  UameP3
    chomp($csheader_str);
    my @csheader=split(/\t/, $csheader_str);
    $csheader[0] = 'corsetID';
    while(<CORSET>) {
        chomp;
        my %csdata;
        @csdata{@csheader} = split(/\t/, $_);
        $corset_counts{$c}->{$csdata{$csheader[0]}} = undef;
        @{ $corset_counts{$c}->{$csdata{$csheader[0]}} }{@csheader[1..$#csheader]} = @csdata{ @csheader[1..$#csheader] };
        $spprep{ $c } = [ @csheader[1..$#csheader] ];
    }
    close(CORSET);
}

my @spp_order;

if (scalar(@order)) {
    @spp_order = @order;
} else {
    @spp_order = keys %spp;
}    

print join("\t", 'OrthoID', (map { join("\t", @{$spprep{$_}}) } @spp_order)),"\n";


open(AUX, ">", $auxfile) or $LOGGER->logdie($!);

foreach my $clusterID (keys %ortholog) {
    my @v;
    foreach my $sp (@spp_order) {
        foreach my $spr (@{ $spprep{$sp} }) {
            if (exists $ortholog{$clusterID}->{$sp}) {
                my @avg = ();
                foreach my $corsetID ( keys %{ $ortholog{$clusterID}->{$sp} }) {
                    $LOGGER->logdie("Not found \"$sp\" CORSET data with ID $corsetID") unless (exists $corset_counts{ $sp }->{ $corsetID });
                    push(@avg, $corset_counts{ $sp }->{ $corsetID }->{ $spr });
                    foreach my $transcript_id (@{ $corsetmap{$sp}->{$corsetID} }) {
                        print AUX join("\t", $sp, "PC.$clusterID", $corsetID, $transcript_id, $spr, $corset_counts{ $sp }->{ $corsetID }->{ $spr }),"\n";
                    } 
                }
                push(@v, &average(@avg));
            } else {
                push(@v, 0);
            }
        }
    }
    print join("\t", "PC.$clusterID", @v),"\n";
}

close(AUX);

# Subroutines

sub Usage {
    my ($msg) = @_;
	Readonly my $USAGE => <<"END_USAGE";
Daniel Guariz Pinheiro (dgpinheiro\@gmail.com)
(c)2012 Universidade de São Paulo

Usage

        $0	[-h/--help] [-l/--level <LEVEL>]

Argument(s)

        -h      --help          Help
        -l      --level         Log level [Default: FATAL]
        -c      --corset        Define: CORSET result file(s)
        -p      --multiparanoid Multiparanoid result
        -o      --order         Order
        -a      --auxfile       Auxiliary file
        -m      --map           Define: Transcript-Gene map file(s)

END_USAGE
    print STDERR "\nERR: $msg\n\n" if $msg;
    print STDERR qq[$0  ] . q[$Revision$] . qq[\n];
	print STDERR $USAGE;
    exit(1);
}


sub average {
    my @x = @_;
    my $xsum = 0;
    foreach my $xi (@x) {
        $xsum+=$xi;
    }
    return(sprintf("%.0f",$xsum/scalar(@x)));
}
