#!/usr/bin/env perl
#
# From https://github.com/szabgab/perlmaven.com/blob/main/examples/read_config.pl
use strict;
use warnings;

use Config::Tiny;

my $filename = shift or die "Usage: $0 FILENAME\n";
my $config = Config::Tiny->read( $filename, 'utf8' );

print $config->{Build}{Milestone};
