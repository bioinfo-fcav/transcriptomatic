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

my ($level, %annot, $auxfile);

Usage("Too few arguments") if $#ARGV < 0;
GetOptions( "h|?|help" => sub { &Usage(); },
            "l|level=s"=> \$level,
            "a|annot=s"=>\%annot,
            "i|infile=s"=>\$auxfile
    ) or &Usage();


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

my %anndesc;

foreach my $sp (keys %annot) {

    $LOGGER->logdie("Missing \"$sp\" map result") unless (exists $annot{$sp});
    $LOGGER->logdie("Wrong map file ($annot{$sp})") unless (-e $annot{$sp});

    open(ANNOT, "<", $annot{$sp}) or $LOGGER->logdie($!);
    while(<ANNOT>) {
        chomp;
        my ($cluster, $go, $description) = split(/\t/, $_);
        if ($description) {
            my ($desc) = $description =~ /(\S+.*\S+)/;
#            print $cluster,"\t",$desc,"\n";
            $anndesc{$sp}->{$cluster} = $desc;
        }
    }
    close(ANNOT);
}

open(AUX, "<", $auxfile) or $LOGGER->logdie($!);
my %clusterdesc;
while (<AUX>) {
    my ($sp, $cluster, $corsetID, $transcript_id, $spr, $corset_count) = split(/\t/, $_);
    if (exists $anndesc{$sp}->{$transcript_id}) {
        push(@{ $clusterdesc{$cluster}->{ $anndesc{$sp}->{$transcript_id} } }, $transcript_id);
    }
}
close(AUX);

foreach my $cluster (keys %clusterdesc) {
    print join("\t", $cluster, join(";", keys %{ $clusterdesc{$cluster} } )),"\n";
}


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
        -a      --annot         Define: Annotation file(s) - BLAST2GO .annot file
        -i      --infile        Input file

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
