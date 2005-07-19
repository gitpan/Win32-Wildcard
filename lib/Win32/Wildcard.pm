#: Wildcard.pm
#: Unfold the wildcards contained in @ARGV
#:   automatically
#: Win32-Wildcard v0.01
#: Copyright (c) 2005 Agent Zhang
#: 2005-07-17 2005-07-19

package Win32::Wildcard;

use strict;
#use warnings;

use File::DosGlob 'glob';
require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	unfold
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(	
);

our $VERSION = '0.01';

sub unfold {
    my @files;
    foreach (@ARGV){
        unless (/[*?]/o){
            push @files, $_;
            next;
        }
        s/\\/\//g;
        s/ /\\ /g;
        push @files, glob($_);
    }
    @ARGV = @files;
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Win32::Wildcard - Unfold the wildcards contained in @ARGV automatically

=head1 SYNOPSIS

  # In your script:
  # foo.pl
  use Win32::Wildcard 'unfold';

  unfold;
  
  # @ARGV now contains the whole list of files.
  # other traditional code follows...

  # On Win32 command line, you can invoke it like this:
  > perl foo.pl *.ex? "C:\Program Files\MySQ?\*.txt" abc.dat

=head1 DESCRIPTION

This module provides a straight-forward interface for processing the wildcards
used in Win32 command line. The standard File::DosGlob module maked my work
minimal.

The unfold function globs the pattern appeared in @ARGV and assign the final
file list back to @ARGV. Every element of @ARGV is treated as single pattern
and white spaces are reserved.

I think the beauty of this stuff is just its simplicity. There is only one
sub with no arguments and no return values.

=head2 EXPORT

unfold

=head1 SEE ALSO

L<File::DosGlob>

=head1 AUTHOR

Agent Zhang, E<lt>agent2002@126.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 Agent Zhang.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
