use strict;
use warnings;

use Test::More tests => 4;
use Dist::Zilla::App::Tester;
#use Test::DZil;
use Test::Output;

use Smart::Comments;

{
    my $result;
    TODO: {
        local $TODO = "Can't seem to capture stderr from test_dzil()?!";
        stderr_like { $result = test_dzil('t/test-dists/fail', [ qw(test) ]) }
            qr!Failed test '\S+' w/o Smart::Comments!,
            'saw Smart::Comments test failure',
            ;
    }
    is($result->exit_code, -1, "dzil test exited -1 (fail)");
}

{
    my $result;
    stderr_unlike { $result = test_dzil('t/test-dists/pass', [ qw(test) ]) }
        qr!Failed test '\S+' w/o Smart::Comments!,
        'did not see Smart::Comments test failure',
        ;
    #my $result = test_dzil('t/test-dists/pass', [ qw(test) ]);
    is($result->exit_code, 0, "dzil test exited 0 (pass)");
}

1;
