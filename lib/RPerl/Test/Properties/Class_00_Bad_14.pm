# [[[ PREPROCESSOR ]]]
# <<< PARSE_ERROR: 'ERROR ECVPAPL02' >>>
# <<< PARSE_ERROR: 'Number found where operator expected' >>>

# [[[ HEADER ]]]
use RPerl;
package RPerl::Test::Properties::Class_00_Bad_14;
use strict;
use warnings;
our $VERSION = 0.001_000;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Test);
use RPerl::Test;

# [[[ OO PROPERTIES ]]]
our hashref $properties
    = { empty_property => my integer $TYPED_empty_property  2 };

# [[[ OO METHODS & SUBROUTINES ]]]
our void::method $empty_method = sub {
    return 2;
};

1;                  # end of class
