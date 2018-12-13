#!/usr/bin/perl
use URI;
use File::Basename;

if($ARGV[0] !~ /www\.cert-pa\.it/) {
 print "Dammi URL\n";
 exit;
}
if($ARGV[1] !~ /[a-zA-Z]/) {
 print "Dammi una definzione o nome del malware\n";
 exit;
}

$malware_name=$ARGV[1];

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
#  print "controlla $_\n"; 
 if($_ =~ /^[a-z]{3,}.*/ and $_ !~ /http/){
  print TEMP "$_;$malware_name $urlo\n"; 
 }
}
system("cat temp >>iocs/c2-ioc-certpa");
system("rm temp");
unlink($ioc);
