#!perl -T

use Test::More tests => 2;

use Scalar::IfDefined qw/lifdef/;

is((scalar lifdef { $_ + 1 } 1) , 2);
is((scalar lifdef { $_ + 1 } undef) , undef);
is([ lifdef { $_ } 1 ], [ 1 ]);
is([ lifdef { $_ } undef ], []);
