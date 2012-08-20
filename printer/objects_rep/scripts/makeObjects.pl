#! /usr/bin/perl -nl

use strict;

my @obj= split ':';

my $heritage = undef;

my $name = $obj[-1];
if (@obj+0 == 2){
    $heritage = $obj[0];
}

#print $name;
my $path = fileName($name);
my $tmp = heriteModule($name);
print "\l$tmp";

if (-f $path) {
    
} else {
    open(f, ">$path", ) or die "Impossible d'ouvrir";
    print f printModule($name, $heritage);
    close(f);
}

sub fileName {
    my $name = shift;
    $name =~ s/^_//g;
    $name =~ s/onyx\./onyx/g;
    $name =~ s/canvas\./canvas/g;
    $name = "\l$name".".ml";
    return $name;
}

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


sub printModule {
    my $objName = shift;
    my $heritageName = shift;
    my $module = "";

    my $interne = nameInterne($objName);

    if ($heritageName){
	my $heriteInterne = nameInterne($heritageName);
	$heritageName = heriteModule($heritageName);
	$module = "open Struct_types

let $interne = Type_gen ($heritageName.$heriteInterne,
		       \"$objName\",
		       [],
		       [],
		       [])";
    } else {
	$module = "open Struct_types

let $interne = Type ( \"$objName\",
		       [],
		       [],
		       [])";
    }		       
    return $module;
}

