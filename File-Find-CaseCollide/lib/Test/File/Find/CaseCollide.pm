package Test::File::Find::CaseCollide;

use strict;
use warnings;
use Test::Differences (qw( eq_or_diff ));
use File::Find::CaseCollide ();

sub verify
{
    local $Test::Builder::Level = $Test::Builder::Level + 1;
    my ( $class, $args ) = @_;
    my $obj = File::Find::CaseCollide->new( { dir => $args->{dir} } );
    my $results = $obj->find;

    return eq_or_diff( $results, {}, "No results were found." );
}

1;

=head1 NAME

Test::File::Find::CaseCollide - test for collisions in filenames, differing only in case

=head1 SYNOPSIS

    use Test::More tests => 1;
    use Test::File::Find::CaseCollide ();

    # TEST
    Test::File::Find::CaseCollide->verify( { dir => '.' } );

=head1 METHODS

=head2 Test::File::Find::CaseCollide->verify({dir => "."});

Verifies that there are no conflicting filenames in the dir.

=cut
