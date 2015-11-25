# [[[ DOCUMENTATION ]]]
# http://perldoc.perl.org/functions/open.html
# NOT SUPPORTED:  open FILEHANDLE,EXPR
#     SUPPORTED:  open FILEHANDLE,MODE,EXPR
# NOT SUPPORTED:  open FILEHANDLE,MODE,EXPR,LIST
# NOT SUPPORTED:  open FILEHANDLE,MODE,REFERENCE
# NOT SUPPORTED:  open FILEHANDLE

# [[[ HEADER ]]]
package RPerl::Operation::Expression::Operator::Open;
use strict;
use warnings;
use RPerl::AfterSubclass;
our $VERSION = 0.001_000;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Operation::Expression::Operator);
use RPerl::Operation::Expression::Operator;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils

# [[[ OO PROPERTIES ]]]
our hashref $properties = {};

# [[[ OO METHODS & SUBROUTINES ]]]

our string_hashref::method $ast_to_rperl__generate = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $rperl_source_group = { PMC => q{} };
    my string_hashref $rperl_source_subgroup;

#    RPerl::diag( 'in Operator::Open->ast_to_rperl__generate(), received $self = ' . "\n" . RPerl::Parser::rperl_ast__dump($self) . "\n" );

    my string $self_class = ref $self;
    if ( $self_class eq 'Operator_85' ) { # Operator -> OP01_OPEN MY TYPE_FHREF FHREF_SYMBOL OP21_LIST_COMMA LITERAL_STRING OP21_LIST_COMMA SubExpression
        my string $open_operator          = $self->{children}->[0];
        my string $my            = $self->{children}->[1];
        my string $type_fhref    = $self->{children}->[2];
        my string $fhref_symbol  = $self->{children}->[3];
        my string $list_comma0   = $self->{children}->[4];
        my string $open_mode     = $self->{children}->[5];
        my string $list_comma1   = $self->{children}->[6];
        my object $subexpression = $self->{children}->[7];

        $rperl_source_group->{PMC}
            .= $open_operator . q{ }
            . $my . q{ }
            . $type_fhref . q{ }
            . $fhref_symbol
            . $list_comma0 . q{ }
            . $open_mode
            . $list_comma1 . q{ };
        $rperl_source_subgroup
            = $subexpression->ast_to_rperl__generate($modes);
        RPerl::Generator::source_group_append( $rperl_source_group,
            $rperl_source_subgroup );
    }
    else {
        die RPerl::Parser::rperl_rule__replace(
            'ERROR ECVGEASRP00, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL: grammar rule '
                . $self_class
                . ' found where Operator_85 expected, dying' )
            . "\n";
    }

    return $rperl_source_group;
};

our string_hashref::method $ast_to_cpp__generate__CPPOPS_PERLTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group
        = { CPP =>
            q{// <<< RP::O::E::O::O __DUMMY_SOURCE_CODE CPPOPS_PERLTYPES >>>}
            . "\n" };

    #...
    return $cpp_source_group;
};

our string_hashref::method $ast_to_cpp__generate__CPPOPS_CPPTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group
        = { CPP =>
              q{// <<< RP::O::E::O::O __DUMMY_SOURCE_CODE CPPOPS_CPPTYPES >>>}
            . "\n" };

    #...
    return $cpp_source_group;
};

1;    # end of class
