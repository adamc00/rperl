# [[[ PREPROCESSOR ]]]
# <<< PARSE_ERROR: 'ERROR ECVPAPL02' >>>
# <<< PARSE_ERROR: 'String found where operator expected' >>>

# [[[ HEADER ]]]
use RPerl;
package RPerl::Test::Constant::Class_00_Bad_15;
use strict;
use warnings;
our $VERSION = 0.001_000;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Test);
use RPerl::Test;

# [[[ CONSTANTS ]]]
## no critic qw(ProhibitConstantPragma ProhibitMagicNumbers)  # USER DEFAULT 3: allow constants
use constant PI => my number $TYPED_PI = 3.141_59;
use constant PIE => my string $TYPED_PIE 'pecan';

# [[[ OO PROPERTIES ]]]
our hashref $properties
    = { empty_property => my integer $TYPED_empty_property = 2 };

# [[[ OO METHODS & SUBROUTINES ]]]
our void::method $empty_method = sub {
    return 2;
};

1;    # end of class
