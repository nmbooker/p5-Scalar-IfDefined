use inc::Module::Install;

name     'Scalar-IfDefined';
all_from 'lib/Scalar/IfDefined.pm';
author   q{Nick Booker <NMBooker@gmail.com>};
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

