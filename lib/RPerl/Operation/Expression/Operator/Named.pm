# [[[ HEADER ]]]
package RPerl::Operation::Expression::Operator::Named;
use strict;
use warnings;
use RPerl::AfterSubclass;
our $VERSION = 0.001_200;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Operation::Expression::Operator);
use RPerl::Operation::Expression::Operator;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils

# [[[ OO PROPERTIES ]]]
our hashref $properties = {};

# [[[ OO PROPERTIES, CLASS PROPERTY AKA PACKAGE VARIABLE ]]]
# DEV NOTE, CORRELATION #rp20: upon adding new named op file lib/RPerl/Operation/Expression/Operator/Named/* also add in Grammar.eyp, Named.pm, and rperloperations.pm
our string_hashref $NAMES = {
    'chomp'   => 'RPerl::Operation::Expression::Operator::Named::Chomp',
    'join'    => 'RPerl::Operation::Expression::Operator::Named::Join',
    'keys'    => 'RPerl::Operation::Expression::Operator::Named::Keys',
    'pop'     => 'RPerl::Operation::Expression::Operator::Named::Pop',
    'push'    => 'RPerl::Operation::Expression::Operator::Named::Push',
    'reverse' => 'RPerl::Operation::Expression::Operator::Named::Reverse',
    'sort'    => 'RPerl::Operation::Expression::Operator::Named::Sort',
    'split'   => 'RPerl::Operation::Expression::Operator::Named::Split',
    'values'  => 'RPerl::Operation::Expression::Operator::Named::Values',
    'wait'  => 'RPerl::Operation::Expression::Operator::Named::Wait'
};

# [[[ OO METHODS & SUBROUTINES ]]]

our string_hashref::method $ast_to_rperl__generate = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $rperl_source_group = { PMC => q{} };
    my string_hashref $rperl_source_subgroup;

    #    RPerl::diag( 'in Operator::Named->ast_to_rperl__generate(), received $self = ' . "\n" . RPerl::Parser::rperl_ast__dump($self) . "\n" );

    my string $self_class = ref $self;
    my string $operator_name;
    if ( $self_class eq 'Operation_79' ) {    # Statement -> OP01_NAMED_SCOLON
        $operator_name = substr $self->{children}->[0], 0, -1;
    }
    elsif (( $self_class eq 'Operator_83' )    # Operator -> OP01_NAMED SubExpression
        or ( $self_class eq 'OperatorVoid_121' )
        )                                   # OperatorVoid -> OP01_NAMED ListElement OP21_LIST_COMMA ListElements ';'
    {
        $operator_name = $self->{children}->[0];
    }
    elsif ( $self_class eq 'Operator_84' ) {    # Operator -> LPAREN OP01_NAMED ListElement OP21_LIST_COMMA ListElements ')'
        $operator_name = $self->{children}->[1];
    }
    else {
        die RPerl::Parser::rperl_rule__replace( 'ERROR ECVGEASRP00, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL: grammar rule '
                . $self_class
                . ' found where Operation_79, Operator_83, Operator_84, or OperatorVoid_121 expected, dying' )
            . "\n";
    }
 
    # remove trailing whitespace, caused by the need to have the grammar match some tokens with a trailing whitespace, as with 'scalar ', etc.
    $operator_name =~ s/^(\w+)\s*$/$1/gxms;

 # DEV NOTE: compile-time operator name checking short-circuited first by Parse Phase 0 ERROR ECVPAPL02 'Bareword "FOO" not allowed while "strict subs" in use';
 # can't figure out how to create test which gets past ECVPAPL02 to trigger ECVGEASRP12
    if ( not exists $NAMES->{$operator_name} ) {
        die q{ERROR ECVGEASRP12, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL: unsupported or unrecognized named operator '}
            . $operator_name
            . q{' found where }
            . ( join ', ', ( sort keys %{$NAMES} ) )
            . ' expected, operator may not be properly listed in $RPerl::Operation::Expression::Operator::Named::NAMES, dying' . "\n";
    }
    my string $operator_class  = $NAMES->{$operator_name};
    my object $operator_object = $operator_class->new();

    $rperl_source_subgroup = $operator_object->ast_to_rperl__generate( $self, $modes );
    RPerl::Generator::source_group_append( $rperl_source_group, $rperl_source_subgroup );

    return $rperl_source_group;
};

our string_hashref::method $ast_to_cpp__generate__CPPOPS_PERLTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group = { CPP => q{// <<< RP::O::E::O::N __DUMMY_SOURCE_CODE CPPOPS_PERLTYPES >>>} . "\n" };

    #...
    return $cpp_source_group;
};

our string_hashref::method $ast_to_cpp__generate__CPPOPS_CPPTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group = { CPP => q{// <<< RP::O::E::O::N __DUMMY_SOURCE_CODE CPPOPS_CPPTYPES >>>} . "\n" };

    #...
    return $cpp_source_group;
};

1;    # end of class
