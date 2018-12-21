#!/usr/bin/env perl

##
## Author......: See docs/credits.txt
## License.....: MIT
##

use strict;
use warnings;

use Digest::MD5 qw (md5_hex);

sub module_generate_hash
{
  my $word = shift;

  my $hash = md5_hex ($word);

  return $hash;
}

sub module_verify_hash
{
  my $line = shift;

  my ($hash, $word) = split ":", $line;

  return unless defined $hash;
  return unless defined $word;

  $word = pack_if_HEX_notation ($word);

  my $new_hash = module_generate_hash ($word);

  return unless defined $new_hash;

  return unless $new_hash eq $hash;

  return $new_hash;
}

1;
