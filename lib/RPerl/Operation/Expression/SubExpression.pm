# [[[ HEADER ]]]
package RPerl::Operation::Expression::SubExpression;
use strict;
use warnings;
use RPerl::AfterSubclass;
our $VERSION = 0.001_010;

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

    if (   ( ref $self eq 'SubExpressionOrInput_141' )
        or ( ref $self eq 'SubExpressionOrVarMod_144' )
        or ( ref $self eq 'ListElement_188' ) )
    {
        my string_hashref $rperl_source_subgroup
            = $self->{children}->[0]->ast_to_rperl__generate($modes);
        RPerl::Generator::source_group_append( $rperl_source_group,
            $rperl_source_subgroup );
    }
    elsif ( ref $self eq 'ListElement_189' ) {
        my object $type_inner    = $self->{children}->[0];
        my string $type_inner_my = $type_inner->{children}->[0];
        my string $type_inner_type
            = $type_inner->{children}->[1]->{children}->[0];
        my string $type_inner_TYPED = $type_inner->{children}->[2];
        my string $type_inner_name  = $type_inner->{children}->[3];
        my string $type_inner_equal = $type_inner->{children}->[4];

        $rperl_source_group->{PMC}
            .= $type_inner_my . q{ }
            . $type_inner_type . q{ }
            . $type_inner_TYPED
            . $type_inner_name . q{ }
            . $type_inner_equal . q{ };

        my string_hashref $rperl_source_subgroup
            = $self->{children}->[1]->ast_to_rperl__generate($modes);
        RPerl::Generator::source_group_append( $rperl_source_group,
            $rperl_source_subgroup );
    }
    else {
        die RPerl::Parser::rperl_rule__replace(
            'ERROR ECVGEASRP00, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL: grammar rule '
                . ( ref $self )
                . ' found where SubExpressionOrInput_141, SubExpressionOrVarMod_144, ListElement_188, or ListElement_189 expected, dying'
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

    if (   ( ref $self eq 'SubExpressionOrInput_141' )
        or ( ref $self eq 'SubExpressionOrVarMod_144' )
        or ( ref $self eq 'ListElement_188' ) )
    {
        my string_hashref $cpp_source_subgroup
            = $self->{children}->[0]->ast_to_cpp__generate__CPPOPS_CPPTYPES($modes);
#        RPerl::diag( 'in SubExpression->ast_to_cpp__generate__CPPOPS_CPPTYPES(), have $cpp_source_subgroup = ' . "\n" . RPerl::Parser::rperl_ast__dump($cpp_source_subgroup) . "\n" );
        RPerl::Generator::source_group_append( $cpp_source_group,
            $cpp_source_subgroup );
    }
    elsif ( ref $self eq 'ListElement_189' ) {
        $cpp_source_group = { CPP => q{// <<< RP::O::E::SE __DUMMY_SOURCE_CODE CPPOPS_CPPTYPES >>>} . "\n" };



#        my object $type_inner    = $self->{children}->[0];
##        my string $type_inner_my = $type_inner->{children}->[0];
#        my string $type_inner_type
#            = $type_inner->{children}->[1]->{children}->[0];
#        my string $type_inner_TYPED = $type_inner->{children}->[2];
#        my string $type_inner_name  = $type_inner->{children}->[3];
#        my string $type_inner_equal = $type_inner->{children}->[4];

#        $cpp_source_group->{CPP}
#            .= $type_inner_my . q{ }
#            . $type_inner_type . q{ }
#            . $type_inner_TYPED
#            . $type_inner_name . q{ }
#            . $type_inner_equal . q{ };

#        my string_hashref $cpp_source_subgroup
#            = $self->{children}->[1]->ast_to_cpp__generate__CPPOPS_CPPTYPES($modes);
#        RPerl::Generator::source_group_append( $cpp_source_group,
#            $cpp_source_subgroup );



    }
    else {
        die RPerl::Parser::rperl_rule__replace(
            'ERROR ECVGEASCP00, CODE GENERATOR, ABSTRACT SYNTAX TO C++: grammar rule '
                . ( ref $self )
                . ' found where SubExpressionOrInput_141, SubExpressionOrVarMod_144, ListElement_188, or ListElement_189 expected, dying'
        ) . "\n";
    }

    return $cpp_source_group;
};

1;    # end of class
