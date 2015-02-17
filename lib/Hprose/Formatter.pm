############################################################
#                                                          #
#                          hprose                          #
#                                                          #
# Official WebSite: http://www.hprose.com/                 #
#                   http://www.hprose.org/                 #
#                                                          #
############################################################

############################################################
#                                                          #
# Hprose/Formatter.pm                                      #
#                                                          #
# Hprose Formatter module for perl                         #
#                                                          #
# LastModified: Feb 17, 2015                               #
# Author: Ma Bingyao <andot@hprose.com>                    #
#                                                          #
############################################################
package Hprose::Formatter;

use strict;
use warnings;
use IO::String;
use Hprose::Reader;
use Hprose::Writer;

use Exporter 'import';
our @EXPORT = qw(hprose_serialize hprose_unserialize);

sub hprose_serialize {
    my ($val, $simple) = @_;
    my $stream = IO::String->new;
    my $writer = Hprose::Writer->new($stream, $simple);
    $writer->serialize($val);
    ${$stream->string_ref};
}

sub hprose_unserialize {
    my ($data, $simple) = @_;
    my $stream = IO::String->new($data);
    my $reader = Hprose::Reader->new($stream, $simple);
    $reader->unserialize;
}

sub serialize {
    my ($class, $val, $simple) = @_;
    hprose_serialize($val, $simple);
}

sub unserialize {
    my ($class, $data, $simple) = @_;
    hprose_unserialize($data, $simple);
}

1;
