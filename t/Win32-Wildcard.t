use strict;
#use warnings;

use Test::More tests => 25;
use Win32::Wildcard 'unfold';

my $dir = '.';
if (-d 't') {
    $dir = 't';
}

chdir("$dir/dir");
@ARGV = ( 'oh', 'nothing', '*o?*',
    'a b c\ab*\*.exe', 'a b c\ab*\*.txt' );
unfold;
my $fh;
foreach (@ARGV) {
    ok(-f $_);
    ok(open $fh, $_);
    close $fh;
}
is(shift, 'oh');
is(shift, 'nothing');
ok eq_set([splice(@ARGV, 0, 2)], [qw(oh nothing)]);
#$" = "\n";
#print "@ARGV\n";
ok eq_set([splice(@ARGV, 0, 5)], [
    'a b c/ab/mya.exe',
    'a b c/ab/myb.exe',
    'a b c/ab/myc.exe',
    'a b c/ab/test.exe',
    'a b c/abc/test2.exe'
]);
is(shift, 'a b c/abc/foo.txt');
