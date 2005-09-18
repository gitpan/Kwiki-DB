package Kwiki::DB::DBI;
use Kwiki::DB -Base;
use base 'DBI';

our $VERSION = '0.01';

sub connect {
     my ($dsn, $user, $pass, $attr, $old_driver) =  @_;
     $attr->{RootClass} = 'DBI';
     super($dsn, $user, $pass, $attr, $old_driver);
}

__END__

=head1 NAME

  Kwiki::DB::DBI - A DBI.pm wrapper as a Kwiki base class.

=head1 SYNOPSIS

  package Kwiki::MyPlugin;
  use Kwiki::Plugin -Base;

  const db_class => 'Kwiki::DB::DBI';

  sub action {
      $self->db->connect($dsn,$user,$password);
      $self->db->do(...);
      $self->db->$dbi_method(...);
  }

=head1 DESCRIPTION

This class is for those pure DBI.pm lover. It does nothing but let DBI.pm do
all the work. Plugin writers who want to use this module, just put a line:

    const db_class => 'Kwiki::DB::DBI';

in there plugin module, and there will be a convienent C<$hub->db> reference
to an instantiated DBI object. After that, just follow the manual of DBI.pm to
use the DBI object.

=head1 SEE ALSO

L<DBI>

=head1 COPYRIGHT

Copyright 2005 by Kang-min Liu <gugod@gugod.org>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

See <http://www.perl.com/perl/misc/Artistic.html>

=cut

