#!/usr/bin/perl

use strict;
use warnings;

#use Cwd;

my %pathPartsMap = (
    node_modules => '~nm'
    , local_modules => '~lm'
    , 'ruby' => '~r'
    , 'ruby-app' => '~ra'
    , 'src' => 'src'
);
my %reversePathPartsMap = reverse %pathPartsMap;

my $formattedCwd = formatPath(prettycwd());
print "$formattedCwd";

sub prettycwd
{
    #my $cwd = fastcwd;
    my $cwd = $ENV{PWD};
    $cwd =~ s/$ENV{HOME}/~/;
    return $cwd;
}

sub formatPath
{
    my ($path) = @_;
    my @parts = map {
        $pathPartsMap{$_} || $_
    } split('/', $path);

    if(scalar @parts > 4) {
        my @xfrmedParts = map {
            !$reversePathPartsMap{$_} ? substr($_, 0, 1) : $_
        } @parts[3..($#parts-1)];
        @parts = (
            @parts[0..2]
            , @xfrmedParts
            , $parts[$#parts]
        );
    }

    return join('/', @parts);
}

