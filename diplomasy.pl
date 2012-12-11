#!/usr/bin/perl

use PDF::Reuse;

# Default values
my $FileConfig= 'config.txt';
my $InputPDF= 'model.pdf';
my $OutputPDF= 'diplomas.pdf';
my $DataFile= 'people.csv';
my $Font= 'Times-Bold';
my $FontSize= 40;




#Open config file

open (CONFIG, "<$FileConfig") || print "Config no está";

while (<CONFIG>) {
	chomp;
    if (/^#/ || $_ eq "") {
		#print "Ignored\n";
	}
    else {
		if (s/^COORDINATES=//){@Coords= split /[\.\,]/;}
		if (s/^OutputPDF=//){$OutputPDF= $_;}		
		if (s/^InputPDF=//){$InputPDF= $_;}
		if (s/^DataFile=//){$DataFile= $_;}
		if (s/^FontSize=//){$FontSize= $_;}
		if (s/^Font=//){$Font= $_;}
	}    
}
close CONFIG;

prFile($OutputPDF) || die "No he podido abrir fichero $InputPDF\n";

prFontSize($FontSize);                      
prFont($Font); 

#Open data file

open (DATA, "<$DataFile") || print "DATA no está: $DataFile \n";

while (<DATA>) {
	chomp;
	@Cell= split /\,/;
	my @plantilla= prForm($InputPDF);
	#Para quitar el primer elemento, buscar algo más elegante
	my $quita = shift @plantilla;
	prMbox(@plantilla); 
	$i=0;
	foreach (@Cell){
		prText($Coords[$i*2], $Coords[($i*2)+1], $Cell[$i], 'left', 90);
		$i++;
	}
	prPage();
}
close DATA;


 
  
prEnd();  
  

