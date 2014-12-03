#
# This file is part of Dist-Zilla-Plugin-NoSmartCommentsTests
#
# This software is Copyright (c) 2011 by Chris Weyl.
#
# This is free software, licensed under:
#
#   The GNU Lesser General Public License, Version 2.1, February 1999
#
package Dist::Zilla::Plugin::NoSmartCommentsTests;
our $AUTHORITY = 'cpan:RSRCHBOY';
# git description: 0.006-7-g2f1f2a7
$Dist::Zilla::Plugin::NoSmartCommentsTests::VERSION = '0.007';

# ABSTRACT: Make sure no Smart::Comments escape into the wild

use Moose;
use namespace::autoclean;

extends 'Dist::Zilla::Plugin::InlineFiles';

__PACKAGE__->meta->make_immutable;
1;

=pod

=encoding UTF-8

=for :stopwords Chris Weyl

=for :stopwords Wishlist flattr flattr'ed gittip gittip'ed

=head1 NAME

Dist::Zilla::Plugin::NoSmartCommentsTests - Make sure no Smart::Comments escape into the wild

=head1 VERSION

This document describes version 0.007 of Dist::Zilla::Plugin::NoSmartCommentsTests - released December 02, 2014 as part of Dist-Zilla-Plugin-NoSmartCommentsTests.

=head1 SYNOPSIS

In C<dist.ini>:

    [NoSmartCommentsTests]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following file:

  xt/release/no-smart-comments.t - test to ensure no Smart::Comments

=head1 NOTE

The name of this plugin has turned out to be somewhat misleading, I'm afraid:
we don't actually test for the _existance_ of smart comments, rather we
ensure that Smart::Comment is not used by any file checked.

=head1 BUGS

All complex software has bugs lurking in it, and this module is no exception.

Please report any bugs to
"bug-dist-zilla-plugin-nosmartcommentstests@rt.cpan.org", or through the web
interface at <http://rt.cpan.org>.

Patches and pull requests through GitHub are most welcome; our page and repo
(same URI):

    https://github.com/RsrchBoy/dist-zilla-plugin-nosmartcommentstests

=head1 SEE ALSO

Please see those modules/websites for more information related to this module.

=over 4

=item *

L<Smart::Comments>, L<Test::NoSmartComments>

=back

=head1 SOURCE

The development version is on github at L<http://https://github.com/RsrchBoy/dist-zilla-plugin-nosmartcommentstests>
and may be cloned from L<git://https://github.com/RsrchBoy/dist-zilla-plugin-nosmartcommentstests.git>

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/RsrchBoy/dist-zilla-plugin-nosmartcommentstests/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Chris Weyl <cweyl@alumni.drew.edu>

=head2 I'm a material boy in a material world

=begin html

<a href="https://www.gittip.com/RsrchBoy/"><img src="https://raw.githubusercontent.com/gittip/www.gittip.com/master/www/assets/%25version/logo.png" /></a>
<a href="http://bit.ly/rsrchboys-wishlist"><img src="http://wps.io/wp-content/uploads/2014/05/amazon_wishlist.resized.png" /></a>
<a href="https://flattr.com/submit/auto?user_id=RsrchBoy&url=https%3A%2F%2Fgithub.com%2FRsrchBoy%2Fdist-zilla-plugin-nosmartcommentstests&title=RsrchBoy's%20CPAN%20Dist-Zilla-Plugin-NoSmartCommentsTests&tags=%22RsrchBoy's%20Dist-Zilla-Plugin-NoSmartCommentsTests%20in%20the%20CPAN%22"><img src="http://api.flattr.com/button/flattr-badge-large.png" /></a>

=end html

Please note B<I do not expect to be gittip'ed or flattr'ed for this work>,
rather B<it is simply a very pleasant surprise>. I largely create and release
works like this because I need them or I find it enjoyable; however, don't let
that stop you if you feel like it ;)

L<Flattr this|https://flattr.com/submit/auto?user_id=RsrchBoy&url=https%3A%2F%2Fgithub.com%2FRsrchBoy%2Fdist-zilla-plugin-nosmartcommentstests&title=RsrchBoy's%20CPAN%20Dist-Zilla-Plugin-NoSmartCommentsTests&tags=%22RsrchBoy's%20Dist-Zilla-Plugin-NoSmartCommentsTests%20in%20the%20CPAN%22>,
L<gittip me|https://www.gittip.com/RsrchBoy/>, or indulge my
L<Amazon Wishlist|http://bit.ly/rsrchboys-wishlist>...  If you so desire.

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Chris Weyl.

This is free software, licensed under:

  The GNU Lesser General Public License, Version 2.1, February 1999

=cut

__DATA__
___[ xt/release/no-smart-comments.t ]___
#!/usr/bin/env perl

use strict;
use warnings;

use Test::More 0.88;

eval "use Test::NoSmartComments";
plan skip_all => 'Test::NoSmartComments required for checking comment IQ'
    if $@;

no_smart_comments_in_all();
no_smart_comments_in_tests();

done_testing();
