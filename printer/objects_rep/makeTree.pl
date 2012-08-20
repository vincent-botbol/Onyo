#! /usr/bin/perl
use strict;

$/=undef;
open(f, shift);
my $file=<f>;
close(f);

$file =~ s/\"([^\"]+)\"/getName($1)/eg;

print $file;

sub nameInterne {
    my $name = shift;
    $name =~ s/^_//g;
    $name =~ s/onyx\./onyx/g;
    $name =~ s/canvas\./canvas/g;
    $name = "_\l$name";
    return $name;
}

sub heriteModule {
    my $heritname = shift;
    $heritname =~ s/^_//g;
    $heritname =~ s/onyx\./Onyx/g;
    $heritname =~ s/canvas\./Canvas/g;
    return $heritname;
}
sub getName {
    my $name = shift;
    
    my $heriteInterne = nameInterne($name);
    my $heritageName = heriteModule($name);

    return "$heritageName.$heriteInterne";
}
