package Dist::Zilla::Plugin::Test::NoSmartComments;

# ABSTRACT: Make sure no Smart::Comments escape into the wild

use Moose;
use namespace::autoclean;

extends 'Dist::Zilla::Plugin::NoSmartCommentsTests';

__PACKAGE__->meta->make_immutable;
!!42;

=head1 SYNOPSIS

    ; In C<dist.ini>:
    [Test::NoSmartComments]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following file:

  xt/release/no-smart-comments.t - test to ensure no Smart::Comments

=head1 NOTE

The name of this plugin has turned out to be somewhat misleading, I'm afraid:
we don't actually test for the _existance_ of smart comments, rather we
ensure that Smart::Comment is not used by any file checked.

=head1 SEE ALSO

Smart::Comments
Test::NoSmartComments

=cut

__DATA__
