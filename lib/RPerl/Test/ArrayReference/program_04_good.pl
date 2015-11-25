#!/usr/bin/perl
# [[[ HEADER ]]]
use RPerl;
use strict;
use warnings;
our $VERSION = 0.001_000;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils

# [[[ OPERATIONS ]]]

my number_arrayref $n_array = [ sin( 17 / 23 ), cos( 42 / 1_701 ), -( sin 21.12 ) ];
foreach my number $n ( @{$n_array} ) {
    print '$n = ', $n, "\n";
}
