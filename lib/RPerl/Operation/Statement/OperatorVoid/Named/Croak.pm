# [[[ HEADER ]]]
package RPerl::Operation::Statement::OperatorVoid::Named::Croak;
use strict;
use warnings;
use RPerl::AfterSubclass;
our $VERSION = 0.002_010;

# [[[ OO INHERITANCE ]]]
# NEED FIX: is not a Grammar Rule so should not inherit from OperatorVoid, need create Grammar Production class
use parent qw(RPerl::Operation::Statement::OperatorVoid::Named);
use RPerl::Operation::Statement::OperatorVoid::Named;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils
## no critic qw(ProhibitConstantPragma ProhibitMagicNumbers)  # USER DEFAULT 3: allow constants

# [[[ CONSTANTS ]]]
use constant NAME => my string $TYPED_NAME = 'croak';

# DEV NOTE: ARGUMENTS_MIN of 0 can be ignored, no such thing as negative number of args!
use constant ARGUMENTS_MIN => my integer $TYPED_ARGUMENTS_MIN = 0;
use constant ARGUMENTS_MAX => my integer $TYPED_ARGUMENTS_MAX = 999;

# [[[ OO PROPERTIES ]]]
our hashref $properties = {};

# [[[ OO METHODS & SUBROUTINES ]]]

our string_hashref::method $ast_to_rperl__generate = sub {
    ( my object $self, my string_hashref $modes, my object $operator_void_named) = @_;
    my string_hashref $rperl_source_group = { PMC => q{} };

#    RPerl::diag( 'in OperatorVoid::Named::Croak->ast_to_rperl__generate(), received $self = ' . "\n" . RPerl::Parser::rperl_ast__dump($self) . "\n" );
#    RPerl::diag( 'in OperatorVoid::Named::Croak->ast_to_rperl__generate(), received $operator_void_named = ' . "\n" . RPerl::Parser::rperl_ast__dump($operator_void_named) . "\n" );

    if ( ref $operator_void_named eq 'OperatorVoid_118' ) {    # OperatorVoid -> OP01_NAMED_VOID_SCOLON
        $rperl_source_group->{PMC} .= $operator_void_named->{children}->[0];    # name semicolon
    }
    elsif ( ref $operator_void_named eq 'OperatorVoid_119' ) {                  # OperatorVoid -> OP01_NAMED_VOID_LPAREN OPTIONAL-32 ')' ';'
        $rperl_source_group->{PMC}
            .= $operator_void_named->{children}->[0];                           # name lparen
        my object $arguments_optional = $operator_void_named->{children}->[1];
        if ( exists $arguments_optional->{children}->[0] ) {
            my object $arguments       = $arguments_optional->{children}->[0];
            my integer $argument_count = $arguments->length();
            if ( $argument_count > ARGUMENTS_MAX() ) {
                die 'ERROR ECVGEASRP03, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL:' . "\n"
                    . 'Argument count '
                    . $argument_count
                    . ' exceeds maximum argument limit '
                    . ARGUMENTS_MAX()
                    . ' for operator ' . q{'}
                    . NAME() . q{'}
                    . ', dying' . "\n";
            }
            my string_hashref $rperl_source_subgroup = $arguments->ast_to_rperl__generate( $modes, $self );
            RPerl::Generator::source_group_append( $rperl_source_group, $rperl_source_subgroup );
        }
        $rperl_source_group->{PMC} .= $operator_void_named->{children}->[2] . $operator_void_named->{children}->[3];    # rparen semicolon
    }
    elsif ( ref $operator_void_named eq 'OperatorVoid_120' ) {    # OperatorVoid -> OP01_NAMED_VOID ListElements ';'
        $rperl_source_group->{PMC}
            .= $operator_void_named->{children}->[0] . q{ };      # name
        my object $arguments       = $operator_void_named->{children}->[1];
        my integer $argument_count = $arguments->length();
        if ( $argument_count > ARGUMENTS_MAX() ) {
            die 'ERROR ECVGEASRP03, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL:' . "\n"
                . 'Argument count '
                . $argument_count
                . ' exceeds maximum argument limit '
                . ARGUMENTS_MAX()
                . ' for operator ' . q{'}
                . NAME() . q{'}
                . ', dying' . "\n";
        }
        my string_hashref $rperl_source_subgroup = $arguments->ast_to_rperl__generate( $modes, $self );
        RPerl::Generator::source_group_append( $rperl_source_group, $rperl_source_subgroup );
        $rperl_source_group->{PMC} .= $operator_void_named->{children}->[2];    # semicolon
    }
    else {
        die RPerl::Parser::rperl_rule__replace( 'ERROR ECVGEASRP00, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL: grammar rule '
                . ( ref $operator_void_named )
                . ' found where OperatorVoid_118, OperatorVoid_119, or OperatorVoid_120 expected, dying' )
            . "\n";
    }

    $rperl_source_group->{PMC} .= "\n";
    return $rperl_source_group;
};

our string_hashref::method $ast_to_cpp__generate__CPPOPS_PERLTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group = { CPP => q{// <<< RP::O::S::OV::N::C __DUMMY_SOURCE_CODE CPPOPS_PERLTYPES >>>} . "\n" };

    #...
    return $cpp_source_group;
};

our string_hashref::method $ast_to_cpp__generate__CPPOPS_CPPTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group = { CPP => q{// <<< RP::O::S::OV::N::C __DUMMY_SOURCE_CODE CPPOPS_CPPTYPES >>>} . "\n" };

    #...
    return $cpp_source_group;
};

1;    # end of class
