# [[[ HEADER ]]]
package RPerl::Operation::Expression::SubExpression;
use strict;
use warnings;
use RPerl::AfterSubclass;
our $VERSION = 0.001_100;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Operation::Expression);
use RPerl::Operation::Expression;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils

# [[[ OO PROPERTIES ]]]
our hashref $properties = {};

# [[[ OO METHODS & SUBROUTINES ]]]

our string_hashref::method $ast_to_rperl__generate = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $rperl_source_group = { PMC => q{} };

#    RPerl::diag( 'in SubExpression->ast_to_rperl__generate(), received $self = ' . "\n" . RPerl::Parser::rperl_ast__dump($self) . "\n" );

    if (   ( ref $self eq 'SubExpressionOrInput_143' )  # SubExpressionOrInput -> SubExpression
        or ( ref $self eq 'SubExpressionOrVarMod_146' )  # SubExpressionOrVarMod -> SubExpression
        or ( ref $self eq 'ListElement_190' ) )  # ListElement -> SubExpression
    {
        my string_hashref $rperl_source_subgroup = $self->{children}->[0]->ast_to_rperl__generate($modes);
        RPerl::Generator::source_group_append( $rperl_source_group, $rperl_source_subgroup );
    }
    elsif ( ref $self eq 'ListElement_191' ) {  # ListElement -> TypeInner SubExpression
        my object $type_inner    = $self->{children}->[0];
        my string_hashref $rperl_source_subgroup = $self->{children}->[0]->ast_to_rperl__generate($modes);
        RPerl::Generator::source_group_append( $rperl_source_group, $rperl_source_subgroup );
        $rperl_source_subgroup = $self->{children}->[1]->ast_to_rperl__generate($modes);
        RPerl::Generator::source_group_append( $rperl_source_group, $rperl_source_subgroup );
    }
    else {
        die RPerl::Parser::rperl_rule__replace(
            'ERROR ECVGEASRP00, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL: grammar rule '
                . ( ref $self )
                . ' found where SubExpressionOrInput_143, SubExpressionOrVarMod_146, ListElement_190, or ListElement_191 expected, dying'
        ) . "\n";
    }

    return $rperl_source_group;
};

our string_hashref::method $ast_to_cpp__generate__CPPOPS_PERLTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group = { CPP => q{// <<< RP::O::E::SE __DUMMY_SOURCE_CODE CPPOPS_PERLTYPES >>>} . "\n" };

    #...
    return $cpp_source_group;
};

our string_hashref::method $ast_to_cpp__generate__CPPOPS_CPPTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group = { CPP => q{} };

#    RPerl::diag( 'in SubExpression->ast_to_cpp__generate__CPPOPS_CPPTYPES(), received $self = ' . "\n" . RPerl::Parser::rperl_ast__dump($self) . "\n" );

    if (   ( ref $self eq 'SubExpressionOrInput_143' )
        or ( ref $self eq 'SubExpressionOrVarMod_146' )
        or ( ref $self eq 'ListElement_190' ) )
    {
        my string_hashref $cpp_source_subgroup
            = $self->{children}->[0]->ast_to_cpp__generate__CPPOPS_CPPTYPES($modes);
#        RPerl::diag( 'in SubExpression->ast_to_cpp__generate__CPPOPS_CPPTYPES(), have $cpp_source_subgroup = ' . "\n" . RPerl::Parser::rperl_ast__dump($cpp_source_subgroup) . "\n" );
        RPerl::Generator::source_group_append( $cpp_source_group,
            $cpp_source_subgroup );
    }
    elsif ( ref $self eq 'ListElement_191' ) {
        $cpp_source_group = { CPP => q{// <<< RP::O::E::SE __DUMMY_SOURCE_CODE CPPOPS_CPPTYPES >>>} . "\n" };

#        my object $type_inner    = $self->{children}->[0];
#        my string_hashref $cpp_source_subgroup = $self->{children}->[0]->ast_to_cpp__generate__CPPOPS_CPPTYPES($modes);
#        RPerl::Generator::source_group_append( $cpp_source_group, $cpp_source_subgroup );
#        $cpp_source_subgroup = $self->{children}->[1]->ast_to_cpp__generate__CPPOPS_CPPTYPES($modes);
#        RPerl::Generator::source_group_append( $cpp_source_group, $cpp_source_subgroup );

    }
    else {
        die RPerl::Parser::rperl_rule__replace(
            'ERROR ECVGEASCP00, CODE GENERATOR, ABSTRACT SYNTAX TO C++: grammar rule '
                . ( ref $self )
                . ' found where SubExpressionOrInput_143, SubExpressionOrVarMod_146, ListElement_190, or ListElement_191 expected, dying'
        ) . "\n";
    }

    return $cpp_source_group;
};

1;    # end of class
