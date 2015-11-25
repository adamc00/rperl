# [[[ DOCUMENTATION ]]]
# http://perldoc.perl.org/functions/scalar.html
#     SUPPORTED:  scalar EXPR

# [[[ HEADER ]]]
package RPerl::Operation::Expression::Operator::NamedUnary::Scalar;
use strict;
use warnings;
use RPerl::AfterSubclass;
our $VERSION = 0.003_000;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Operation::Expression::Operator::NamedUnary);
use RPerl::Operation::Expression::Operator::NamedUnary;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils

# [[[ CONSTANTS ]]]
use constant NAME                  => my string $TYPED_NAME                  = 'scalar';
use constant NAME_CPPOPS_PERLTYPES => my string $TYPED_NAME_CPPOPS_PERLTYPES = 'DUMMY_OP_SCALAR';
use constant NAME_CPPOPS_CPPTYPES  => my string $TYPED_NAME_CPPOPS_CPPTYPES  = 'size';
use constant ARGUMENTS_MIN         => my integer $TYPED_ARGUMENTS_MIN        = 1;
use constant ARGUMENTS_MAX         => my integer $TYPED_ARGUMENTS_MAX        = 1;

# [[[ OO PROPERTIES ]]]
our hashref $properties = {};

# [[[ OO METHODS & SUBROUTINES ]]]

our string_hashref::method $ast_to_rperl__generate = sub {
    ( my object $self, my object $operator_named, my string_hashref $modes) = @_;
    my string_hashref $rperl_source_group = { PMC => q{} };

#    RPerl::diag( 'in Operator::NamedUnary::Scalar->ast_to_rperl__generate(), received $self = ' . "\n" . RPerl::Parser::rperl_ast__dump($self) . "\n" );
#    RPerl::diag( 'in Operator::NamedUnary::Scalar->ast_to_rperl__generate(), received $operator_named = ' . "\n" . RPerl::Parser::rperl_ast__dump($operator_named) . "\n" );

    my string $operator_named_class = ref $operator_named;
    if ( $operator_named_class eq 'Operation_80' ) {    # Operation -> OP10_NAMED_UNARY_SCOLON
        die RPerl::Parser::rperl_rule__replace( 'ERROR ECVGEASRP15, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL: named operator '
                . $operator_named->{children}->[0]
                . ' requires exactly one argument, dying' )
            . "\n";
    }
    elsif ( $operator_named_class eq 'Operator_98' ) {    # Operator -> OP10_NAMED_UNARY SubExpression
        $rperl_source_group->{PMC} .= $operator_named->{children}->[0] . q{ };
        my string_hashref $rperl_source_subgroup = $operator_named->{children}->[1]->ast_to_rperl__generate( $modes, $self );
        RPerl::Generator::source_group_append( $rperl_source_group, $rperl_source_subgroup );
    }
    elsif ( $operator_named_class eq 'Operator_99' ) {    # Operator -> OP10_NAMED_UNARY
        die RPerl::Parser::rperl_rule__replace( 'ERROR ECVGEASRP15, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL: named operator '
                . $operator_named->{children}->[0]
                . ' requires exactly one argument, dying' )
            . "\n";
    }
    else {
        die RPerl::Parser::rperl_rule__replace( 'ERROR ECVGEASRP00, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL: grammar rule '
                . ($operator_named_class)
                . ' found where Operation_80, Operator_98, or Operator_99 expected, dying' )
            . "\n";
    }

    return $rperl_source_group;
};

our string_hashref::method $ast_to_cpp__generate__CPPOPS_PERLTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group = { CPP => q{// <<< RP::O::E::O::NU::Sca __DUMMY_SOURCE_CODE CPPOPS_PERLTYPES >>>} . "\n" };

    #...
    return $cpp_source_group;
};

our string_hashref::method $ast_to_cpp__generate__CPPOPS_CPPTYPES = sub {
    ( my object $self, my object $operator_named, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group = { CPP => q{} };

#    RPerl::diag( 'in NamedUnary::Scalar->ast_to_cpp__generate__CPPOPS_CPPTYPES(), received $self = ' . "\n" . RPerl::Parser::rperl_ast__dump($self) . "\n" );
#    RPerl::diag( 'in NamedUnary::Scalar->ast_to_cpp__generate__CPPOPS_CPPTYPES(), received $operator_named = ' . "\n" . RPerl::Parser::rperl_ast__dump($operator_named) . "\n" );

    my string $operator_named_class = ref $operator_named;
    if ( $operator_named_class eq 'Operation_80' ) {    # Operation -> OP10_NAMED_UNARY_SCOLON
        die RPerl::Parser::rperl_rule__replace( 'ERROR ECVGEASCP15, CODE GENERATOR, ABSTRACT SYNTAX TO C++: named operator '
                . $operator_named->{children}->[0]
                . ' requires exactly one argument, dying' )
            . "\n";
    }
    elsif ( $operator_named_class eq 'Operator_98' ) {    # Operator -> OP10_NAMED_UNARY SubExpression
        # must have ArrayDereference as only argument
        my object $subexpression       = $operator_named->{children}->[1];
        my string $subexpression_class = ref $subexpression;
        if (    ( $subexpression_class ne 'SubExpression_139' )
            and ( $subexpression_class ne 'ArrayDereference_199' )
            and ( $subexpression_class ne 'ArrayDereference_200' ) )
        {
            die RPerl::Parser::rperl_rule__replace( 'ERROR ECVGEASCP00, CODE GENERATOR, ABSTRACT SYNTAX TO C++: grammar rule '
                    . $subexpression_class
                    . ' found where SubExpression_139, ArrayDereference_199 or ArrayDereference_200 expected, dying' )
                . "\n";
        }

        # unwrap ArrayDereference_199 and ArrayDereference_200 from SubExpression_139
        if ( $subexpression_class eq 'SubExpression_139' ) {    # SubExpression -> ArrayDereference
            $subexpression = $subexpression->{children}->[0];
        }

        $subexpression_class = ref $subexpression;
        my string_hashref $cpp_source_subgroup;
        if ( $subexpression_class eq 'ArrayDereference_199' ) {    # ArrayDereference -> '@{' Variable '}'
            $cpp_source_subgroup = $subexpression->{children}->[1]->ast_to_cpp__generate__CPPOPS_CPPTYPES($modes);
            RPerl::Generator::source_group_append( $cpp_source_group, $cpp_source_subgroup );
        }
        elsif ( $subexpression_class eq 'ArrayDereference_200' ) {    # ArrayDereference -> '@{' OPTIONAL-47 ArrayReference '}'
            my object $type_inner_optional = $subexpression->{children}->[1];
            my object $array_reference     = $subexpression->{children}->[2];

            if ( exists $type_inner_optional->{children}->[0] ) {
                $cpp_source_group->{CPP} .= '((';
                $cpp_source_subgroup = $type_inner_optional->{children}->[0]->ast_to_cpp__generate__CPPOPS_CPPTYPES($modes);

#            RPerl::diag( 'in NamedUnary::Scalar->ast_to_cpp__generate__CPPOPS_CPPTYPES(), have $cpp_source_subgroup = ' . "\n" . RPerl::Parser::rperl_ast__dump($cpp_source_subgroup) . "\n" );
                RPerl::Generator::source_group_append( $cpp_source_group, $cpp_source_subgroup );
                $cpp_source_group->{CPP} .= ') ';
                $cpp_source_subgroup = $array_reference->ast_to_cpp__generate__CPPOPS_CPPTYPES($modes);
                RPerl::Generator::source_group_append( $cpp_source_group, $cpp_source_subgroup );
                $cpp_source_group->{CPP} .= ')';
            }

            # DEV NOTE: I think we don't have to die here in CPPOPS_PERLTYPES mode???
            else {
                die RPerl::Parser::rperl_rule__replace(
                    'ERROR ECVGEASCP11, CODE GENERATOR, ABSTRACT SYNTAX TO C++: array dereference of array reference must provide data type for array reference in CPPOPS_CPPTYPES mode, but no data type provide, dying'
                ) . "\n";
            }
        }
        else {
            die RPerl::Parser::rperl_rule__replace( 'ERROR ECVGEASCP00, CODE GENERATOR, ABSTRACT SYNTAX TO C++: grammar rule '
                    . $subexpression_class
                    . ' found where ArrayDereference_199 or ArrayDereference_200 expected, dying' )
                . "\n";
        }

        $cpp_source_group->{CPP} .= '.' . NAME_CPPOPS_CPPTYPES() . '()';
    }
    elsif ( $operator_named_class eq 'Operator_99' ) {    # Operator -> OP10_NAMED_UNARY
        die RPerl::Parser::rperl_rule__replace( 'ERROR ECVGEASCP15, CODE GENERATOR, ABSTRACT SYNTAX TO C++: named operator '
                . $operator_named->{children}->[0]
                . ' requires exactly one argument, dying' )
            . "\n";
    }
    else {
        die RPerl::Parser::rperl_rule__replace( 'ERROR ECVGEASCP00, CODE GENERATOR, ABSTRACT SYNTAX TO C++: grammar rule '
                . ($operator_named_class)
                . ' found where Operation_80, Operator_98, or Operator_99 expected, dying' )
            . "\n";
    }

    return $cpp_source_group;
};

1;    # end of class
