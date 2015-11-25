# [[[ HEADER ]]]
package RPerl::Operation::Expression::SubExpression::Parenthesis;
use strict;
use warnings;
use RPerl::AfterSubclass;
our $VERSION = 0.002_000;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Operation::Expression::SubExpression);
use RPerl::Operation::Expression::SubExpression;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils

# [[[ OO PROPERTIES ]]]
our hashref $properties = {};

# [[[ OO METHODS & SUBROUTINES ]]]

our string_hashref::method $ast_to_rperl__generate = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $rperl_source_group = { PMC => q{} };

#    RPerl::diag( 'in Parenthesis->ast_to_rperl__generate(), received $self = ' . "\n" . RPerl::Parser::rperl_ast__dump($self) . "\n" );

    if ( ( ref $self ) ne 'SubExpression_142' ) {
        die RPerl::Parser::rperl_rule__replace(
            'ERROR ECVGEASRP00, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL: grammar rule '
                . ( ref $self )
                . ' found where SubExpression_142 expected, dying' )
            . "\n";
    }

    my string $lparen = $self->{children}->[0];
    my string $rparen = $self->{children}->[2];
    
    $rperl_source_group->{PMC} .= $lparen;
    my string_hashref $rperl_source_subgroup = $self->{children}->[1]->ast_to_rperl__generate($modes);
    RPerl::Generator::source_group_append( $rperl_source_group, $rperl_source_subgroup );
    $rperl_source_group->{PMC} .= $rparen;

    return $rperl_source_group;
};

our string_hashref::method $ast_to_cpp__generate__CPPOPS_PERLTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group
        = { CPP =>
              q{// <<< RP::O::E::SE::P __DUMMY_SOURCE_CODE CPPOPS_PERLTYPES >>>}
            . "\n" };

    #...
    return $cpp_source_group;
};

# DEV NOTE: PERLOPS_PERLTYPES & CPPOPS_CPPTYPES code generation are exactly equivalent
our string_hashref::method $ast_to_cpp__generate__CPPOPS_CPPTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group = { CPP => q{} };

#    RPerl::diag( 'in Parenthesis->ast_to_cpp__generate__CPPOPS_CPPTYPES(), received $self = ' . "\n" . RPerl::Parser::rperl_ast__dump($self) . "\n" );

    if ( ( ref $self ) ne 'SubExpression_142' ) {
        die RPerl::Parser::rperl_rule__replace(
            'ERROR ECVGEASCP00, CODE GENERATOR, ABSTRACT SYNTAX TO C++: grammar rule '
                . ( ref $self )
                . ' found where SubExpression_142 expected, dying' )
            . "\n";
    }

    my string $lparen = $self->{children}->[0];
    my string $rparen = $self->{children}->[2];
    
    $cpp_source_group->{CPP} .= $lparen;
    my string_hashref $cpp_source_subgroup = $self->{children}->[1]->ast_to_cpp__generate__CPPOPS_CPPTYPES($modes);
    RPerl::Generator::source_group_append( $cpp_source_group, $cpp_source_subgroup );
    $cpp_source_group->{CPP} .= $rparen;

    return $cpp_source_group;
};

1;    # end of class
