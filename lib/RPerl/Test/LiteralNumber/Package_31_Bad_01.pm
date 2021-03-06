# [[[ PREPROCESSOR ]]]
# <<< PARSE_ERROR: 'ERROR ECVPARP00' >>>

# [[[ HEADER ]]]
use RPerl;
package RPerl::Test::LiteralNumber::Package_31_Bad_01;
use strict;
use warnings;
our $VERSION = 0.001_000;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator

# [[[ SUBROUTINES ]]]
our number $empty_sub = sub {
    return -.234_567_89;
};

1;    # end of package
