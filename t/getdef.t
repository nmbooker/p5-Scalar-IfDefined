#!perl -T

use Test::More tests => 2;

use Scalar::IfDefined qw/$ifdef/;

my $undef_obj;

my $def_obj = TestPackage->new;

is($undef_obj->$ifdef('foo')->$ifdef('bar'), undef);
is($def_obj->$ifdef('foo'), 'foo');

package TestPackage;

sub new {
    return bless {}, shift;
}

sub foo {
    return 'foo';
}
