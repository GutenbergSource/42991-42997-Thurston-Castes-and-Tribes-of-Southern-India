# process.pl -- Thurston's Castes and Tribes of Southern India.

use strict;

my $saxon   = "java -jar ../../../../../Tools/tei2html/tools/lib/saxon9he.jar ";

processVolume("1", "CastesAndTribes1-1.0.tei");
processVolume("2", "CastesAndTribes2-1.0.tei");
processVolume("3", "CastesAndTribes3-1.0.tei");
processVolume("4", "CastesAndTribes4-1.0.tei");
processVolume("5", "CastesAndTribes5-1.0.tei");
processVolume("6", "CastesAndTribes6-1.0.tei");
processVolume("7", "CastesAndTribes7-1.0.tei");

print "Create complete XML version...\n";
system ("$saxon CTSI-Complete.xsl CTSI-Complete.xsl > CTSI-Complete.xml");

system ("perl -S tei2html.pl -h -r CTSI-Complete.xml");

sub processVolume($) {
    my $volume = shift;
    my $file = shift;
    chdir "Volume $volume";
    system ("perl -S tei2html.pl -h -e -v " . $file);
    chdir "..";
}
