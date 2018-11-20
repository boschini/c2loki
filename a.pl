#!/usr/bin/perl
use URI;
use File::Basename;

if($ARGV[0] !~ /www\.cert-pa\.it/) {
 print "Dammi URL\n";
 exit;
}

$urlo=$ARGV[0];
$u1 = URI->new($urlo);
$ioc=lc(basename($u1->path()));
system("wget -q -O $ioc $urlo");
system("dos2unix $ioc");
##print "HASR IoC $ioc\n";
open(TEMP,">temp");
open(IOC,"<$ioc");
while(<IOC>) {
 chomp;
 print TEMP "$_;",$ioc," CERT-PA\n";
}
$new_ioc='cpa-'.$ioc;
system("mv temp $ioc");
system("mv $ioc iocs/$new_ioc");
