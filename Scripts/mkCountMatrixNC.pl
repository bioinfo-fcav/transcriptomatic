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

my ($level, %map, %corset, $silix_file, @order, $auxfile);

Usage("Too few arguments") if $#ARGV < 0;
GetOptions( "h|?|help" => sub { &Usage(); },
            "l|level=s"=> \$level,
            "m|map=s"=>\%map,
            "c|corset=s"=>\%corset,
            "s|silix=s"=>\$silix_file,
            "o|order=s"=>\@order,
            "a|auxfile=s"=>\$auxfile
    ) or &Usage();

$auxfile||='./mkCountMatrixNC.aux';

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
    
$LOGGER->logdie("Missing silix file") unless ($silix_file);
$LOGGER->logdie("Wrong silix file ($silix_file)") unless (-e $silix_file);

my %species_seq;
my %corsetmap;
my %mapcorset;
foreach my $sp (keys %corset) {

    $LOGGER->logdie("Missing \"$sp\" map result") unless (exists $map{$sp});
    $LOGGER->logdie("Wrong map file ($map{$sp})") unless (-e $map{$sp});

    open(MAP, "<", $map{$sp}) or $LOGGER->logdie($!);
    while(<MAP>) {
        chomp;
        my ($c, $s) = split(/\t/, $_);
        $corsetmap{$sp}->{$s} = $c;
        push(@{$mapcorset{$sp}->{$c}}, $s);
        $species_seq{$s} = $sp;
    }
    close(MAP);
}

my %ortholog;


my %corset_counts;
my %spprep;
foreach my $sp (keys %map) {

    $LOGGER->logdie("Missing \"$sp\" CORSET result") unless (exists $corset{$sp});
    $LOGGER->logdie("Wrong \"$sp\" CORSET result") unless (-e $corset{$sp});
    
    $LOGGER->info("Loading $sp ...");

    open(CORSET, "<", $corset{$sp}) or $LOGGER->logdie($!);
    my $csheader_str=<CORSET>;
    #        UameP1  UameP2  UameP3
    chomp($csheader_str);
    my @csheader=split(/\t/, $csheader_str);
    $csheader[0] = 'corsetID';
    while(<CORSET>) {
        chomp;
        my %csdata;
        @csdata{@csheader} = split(/\t/, $_);
        $corset_counts{$sp}->{$csdata{$csheader[0]}} = undef;
        @{ $corset_counts{$sp}->{$csdata{$csheader[0]}} }{@csheader[1..$#csheader]} = @csdata{ @csheader[1..$#csheader] };
        $spprep{ $sp } = [ @csheader[1..$#csheader] ];
    }
    close(CORSET);
}

open(SILIX, "<", $silix_file) or $LOGGER->logdie($!);
while(<SILIX>) {
    chomp;
    my ($oid, $s) = split(/\t/, $_);
    next unless (exists$species_seq{$s});
    $ortholog{$oid}->{ $species_seq{$s} }->{ $corsetmap{ $species_seq{$s} }->{$s} } = undef;
}
close(SILIX);

my @spp_order;

if (scalar(@order)) {
    @spp_order = @order;
} else {
    @spp_order = keys %map;
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
                    foreach my $transcript_id (@{ $mapcorset{$sp}->{$corsetID} }) {
                        print AUX join("\t", $sp, "NC.$clusterID", $corsetID, $transcript_id, $spr, $corset_counts{ $sp }->{ $corsetID }->{ $spr }),"\n";
                    } 
                }
                push(@v, &average(@avg));
            } else {
                push(@v, 0);
            }
        }
    }
    print join("\t", "NC.$clusterID", @v),"\n";
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
        -m      --map           Define: Transcript-Gene map file(s)
        -s      --silix         SILIX file result
        -o      --order         Order
        -a      --auxfile       Auxiliary file

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
