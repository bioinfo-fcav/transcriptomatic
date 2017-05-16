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
use FileHandle;
use POSIX 'isatty';

INIT {
    use Log::Log4perl qw/:easy/;
    Log::Log4perl->easy_init($FATAL);
    $LOGGER = Log::Log4perl->get_logger($0);
}

my ($level, $infile, $ignoresize, $minsize, $ignoretips);

#Usage("Too few arguments") if $#ARGV < 0;
GetOptions( "h|?|help" => sub { &Usage(); },
            "l|level=s"=> \$level,
            "i|infile=s"=>\$infile,
            "n|ignore=i"=>\$ignoresize,
            "m|minsize=i"=>\$minsize,
            "t|ignoretips=i"=>\$ignoretips
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

$ignoresize||=1;
$minsize||=1;
$ignoretips||=$ignoresize;

my $fhin;

if ($infile) {

    $LOGGER->logdie("Wrong input file ($infile)") unless (-e $infile);

    $fhin = FileHandle->new;
    $fhin->open("<$infile");

} else {
    unless (isatty(*STDIN)) {
        $fhin = \*STDIN;
    } else {
        $LOGGER->logdie("Missing input file (-i/--infile) or STDIN data");
    }
}

my %C;
my %line;
my $maxcluster=0;
while(<$fhin>) {
    chomp;
    my ($type, $cluster, $size, $percent, $strand, $unk1, $unk2, $cigar_str, $seq1, $seq2) = split(/\t/, $_);
    push( @{ $line{$type} }, [$type, $cluster, $size, $percent, $strand, $unk1, $unk2, $cigar_str, $seq1, $seq2] );
    $maxcluster=$cluster if ($maxcluster < $cluster);
}
$fhin->close();

my $nc=1;
foreach my $ar_l (@{$line{'C'}}, @{$line{'H'}}, @{ $line{'S'}}) {
    #S       0       5471    *       *       *       *       *       Uame-Purple.000001A3E0  *
    #H       0       2629    100.0   +       0       0       5392I79M2550D   Uame-Purple.00000128A9  Uame-Purple.000001A3E0
    #C       0       2       *       *       *       *       *       Uame-Purple.000001A3E0  *
    my ($type, $cluster, $size, $percent, $strand, $unk1, $unk2, $cigar_str, $seq1, $seq2) = @{ $ar_l };

    if ($type eq 'S') {
        print join("\t", $type, $cluster, $size, $percent, $strand, $unk1, $unk2, $cigar_str, $seq1, $seq2),"\n";
    } elsif ($type eq 'C') {
        $C{ $seq1 } = [$type, $cluster, $size, $percent, $strand, $unk1, $unk2, $cigar_str, $seq1, $seq2];
    } elsif ($type eq 'H') {
        if ($cigar_str) {
            my @cigar;
#            print $cigar_str,"\n";
            while ($cigar_str=~ /(\d*)(\w)/g) {
                my ($n, $o) = ($1, $2);
                $n||=1;
#                print ">>>>>\t",$n,"\t",$o,"\t";
                if ($o !~ /M/) {
                    if ($n > $ignoresize) {
                        push(@cigar, [$n, $o]);
#                        print "PUSH";
                    }
                } else {
                        push(@cigar, [$n, $o]);
#                        print "PUSH";
                }
#                print "\n";
            }

            if ($cigar[0]->[1] =~ /D/) {
                shift(@cigar) if ($cigar[0]->[0] <= $ignoretips);
            }
            if ($cigar[$#cigar]->[1] =~ /D/) {
                @cigar=@cigar[0..$#cigar-1] if ($cigar[$#cigar]->[0] <= $ignoretips);
            }

            if ($cigar[0]->[1] =~ /I/) {
                shift(@cigar);
            }
            if ($cigar[$#cigar]->[1] =~ /I/) {
                @cigar=@cigar[0..$#cigar-1];
            }
            
            my $i = 0;
            while ( $cigar[$i+1]) {
                if ($cigar[$i]->[1] eq $cigar[$i+1]->[1]) {
                    $cigar[$i+1]->[0]+=$cigar[$i]->[0];
                    $cigar[$i] = undef;
                }
                $i++;
            }
            {
                my @new_cigar;
                foreach my $ar (@cigar) {
                    push(@new_cigar, $ar) if ($ar);
                }
                @cigar = @new_cigar;
            }
            if (scalar(@cigar) > 1) {
                $C{ $seq2 }->[2]--;
#                print ">>>>>".join(";", map { $_->[0].$_->[1] } @cigar),"\n";
                print join("\t", 'S', ($maxcluster+$nc), $size, '*', '*', $unk1, $unk2, '*', $seq1, '*'),"\n";
                $C{ $seq1 } = [ 'C', ($maxcluster+$nc), 1, '*', '*', $unk1, $unk2, '*', $seq1, '*'];
                $nc++;
            } elsif (scalar(@cigar) == 1) {
                if ( $cigar[0]->[1] =~ /M/ ) {
                    if ($cigar[0]->[0] > $minsize) {
#                        print "\t\t\t".join(";", map { $_->[0].$_->[1] } @cigar),"\n";
                        print join("\t", $type, $cluster, $size, $percent, $strand, $unk1, $unk2, $cigar_str, $seq1, $seq2),"\n";
                    } else {
                        $C{ $seq2 }->[2]--;
#                        print ">>>>>".join(";", map { $_->[0].$_->[1] } @cigar),"\t",$seq2,"\t",$C{ $seq2 }->[2],"\n";
                        print join("\t", 'S', ($maxcluster+$nc), $size, '*', '*', $unk1, $unk2, '*', $seq1, '*'),"\n";
                        $C{ $seq1 } = [ 'C', ($maxcluster+$nc), 1, '*', '*', $unk1, $unk2, '*', $seq1, '*'];
                        $nc++;
                    }                
                } else {
                    $LOGGER->logdie("Something wrong!");
                }
            } else {
                $LOGGER->logdie("Something wrong!");
            }
        }
    } else {
        $LOGGER->logdie("Wrong type ($type)!");
    }
}


foreach my $seq1 (keys %C) {
    print join("\t", @{ $C{ $seq1 } }),"\n";
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

        -h      --help      Help
        -l      --level     Log level [Default: FATAL]
        -i      --infile    Input file
        -n      --ignore    Ignore n gaps [Default: 1]
        -m      --minsize   Minimum match size [Default: 1]
        -t      --ingoretip Ignore tips of size n [Default: --ignore]

END_USAGE
    print STDERR "\nERR: $msg\n\n" if $msg;
    print STDERR qq[$0  ] . q[$Revision$] . qq[\n];
	print STDERR $USAGE;
    exit(1);
}

