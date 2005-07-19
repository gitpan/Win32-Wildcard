use strict;
#use warnings;
#use Config;
use inc::Module::Install;

name            ('Win32-Wildcard');
version_from    ('lib/Win32/Wildcard.pm');
abstract_from   ( 'lib/Win32/Wildcard.pm' );
author          ('Agent Zhang <agent2002@126.com>');
license         ('perl');

requires        ('Exporter');
requires        ('File::DosGlob');
build_requires  ('Test::More');
build_requires  ('File::Compare');

&WriteAll;


# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => '',
    VERSION_FROM      => '', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Win32/Wildcard.pm', # retrieve abstract from module
       AUTHOR         => 'A. U. Thor <a.u.thor@a.galaxy.far.far.away>') : ()),
);
