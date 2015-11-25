# [[[ HEADER ]]]
package RPerl::DataType::Integer;
use strict;
use warnings;
use RPerl::AfterSubclass;
our $VERSION = 0.005_200;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::DataType::Scalar);
use RPerl::DataType::Scalar;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils
## no critic qw(Capitalization ProhibitMultiplePackages ProhibitReusedNames)  # SYSTEM DEFAULT 3: allow multiple & lower case package names

# [[[ SUB-TYPES ]]]
# an integer is a whole number, it has no floating-pointer (fractional/decimal) component
package  # hide from PAUSE indexing
    integer;
use strict;
use warnings;
use parent qw(RPerl::DataType::Integer);

package  # hide from PAUSE indexing
    unsigned_integer;
use strict;
use warnings;
use parent qw(RPerl::DataType::Integer);

package  # hide from PAUSE indexing
    constant_integer;
use strict;
use warnings;
use parent qw(RPerl::DataType::Integer);

package  # hide from PAUSE indexing
    constant_unsigned_integer;
use strict;
use warnings;
use parent qw(RPerl::DataType::Integer);

# [[[ SWITCH CONTEXT BACK TO PRIMARY PACKAGE ]]]
package RPerl::DataType::Integer;
use strict;
use warnings;

# [[[ INCLUDES ]]]
use RPerl::DataType::String;    # need string type

# [[[ TYPE-CHECKING ]]]
our void $integer_CHECK = sub {
    ( my $possible_integer ) = @_;
    if ( not( defined $possible_integer ) ) {
        croak(
            "\nERROR EIV00, TYPE-CHECKING MISMATCH, PERLOPS_PERLTYPES:\ninteger value expected but undefined/null value found,\ncroaking"
        );
    }
    if ( not( main::RPerl_SvIOKp($possible_integer) ) ) {
        croak(
            "\nERROR EIV01, TYPE-CHECKING MISMATCH, PERLOPS_PERLTYPES:\ninteger value expected but non-integer value found,\ncroaking"
        );
    }
};
our void $integer_CHECKTRACE = sub {
    ( my $possible_integer, my $variable_name, my $subroutine_name ) = @_;
    if ( not( defined $possible_integer ) ) {
        croak(
            "\nERROR EIV00, TYPE-CHECKING MISMATCH, PERLOPS_PERLTYPES:\ninteger value expected but undefined/null value found,\nin variable $variable_name from subroutine $subroutine_name,\ncroaking"
        );
    }
    if ( not( main::RPerl_SvIOKp($possible_integer) ) ) {
        croak(
            "\nERROR EIV01, TYPE-CHECKING MISMATCH, PERLOPS_PERLTYPES:\ninteger value expected but non-integer value found,\nin variable $variable_name from subroutine $subroutine_name,\ncroaking"
        );
    }
};

# [[[ BOOLIFY ]]]
our bool $integer_to_bool = sub {
    ( my integer $input_integer ) = @_;
    if ($input_integer == 0) { return 0; }
    else { return 1; }
};

# [[[ NUMBERIFY ]]]
#our number $integer_to_number = sub {
our $integer_to_number = sub {
    ( my integer $input_integer ) = @_;
    return $input_integer * 1.0;
};

# [[[ CHARIFY ]]]
#our char $integer_to_char = sub {
our $integer_to_char = sub {
    ( my integer $input_integer ) = @_;
    my string $tmp_string = integer_to_string($input_integer);
    if ($tmp_string eq q{}) { return q{}; }
    else { return substr $tmp_string, 0, 1; }
};

# [[[ STRINGIFY ]]]
our string $integer_to_string = sub {
    ( my integer $input_integer ) = @_;

    #    integer_CHECK($input_integer);
    integer_CHECKTRACE( $input_integer, '$input_integer',
        'integer_to_string()' );

#    RPerl::diag("in PERLOPS_PERLTYPES integer_to_string(), received \$input_integer = $input_integer\n");
#    RPerl::diag("in PERLOPS_PERLTYPES integer_to_string()...\n");

    # DEV NOTE: disable old stringify w/out underscores
    #    return "$input_integer";

    my integer $is_negative = 0;
    if ( $input_integer < 0 ) { $is_negative = 1; }
    my string $retval = reverse "$input_integer";
    if ($is_negative) { chop $retval; }    # remove negative sign
    $retval =~ s/(\d{3})/$1_/gxms;
    if ( ( substr $retval, -1, 1 ) eq '_' ) { chop $retval; }
    $retval = reverse $retval;

    if ($is_negative) { $retval = q{-} . $retval; }

#    RPerl::diag('in PERLOPS_PERLTYPES integer_to_string(), have $retval = ' . q{'} . $retval . q{'} . "\n");
    return $retval;
};

# [[[ TYPE TESTING ]]]
our integer $integer__typetest0 = sub {
    my integer $retval
        = ( 21 / 7 ) + main::RPerl__DataType__Integer__MODE_ID(); # return integer (not number) value, don't do (22 / 7) etc.

#    RPerl::diag("in PERLOPS_PERLTYPES integer__typetest0(), have \$retval = $retval\n");
    return ($retval);
};
our integer $integer__typetest1 = sub {
    ( my integer $lucky_integer ) = @_;

    #    integer_CHECK($lucky_integer);
    integer_CHECKTRACE( $lucky_integer, '$lucky_integer',
        'integer__typetest1()' );

#    RPerl::diag('in PERLOPS_PERLTYPES integer__typetest1(), received $lucky_integer = ' . integer_to_string($lucky_integer) . "\n");
    return (
        ( $lucky_integer * 2 ) + main::RPerl__DataType__Integer__MODE_ID() );
};

1;  # end of class
