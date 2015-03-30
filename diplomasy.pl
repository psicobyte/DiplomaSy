#!/usr/bin/perl

#       CopyRight 2012 Allan Psicobyte (psicobyte@gmail.com)
#
#       This program is free software: you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation, either version 3 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#
#       You should have received a copy of the GNU General Public License
#       along with this program.  If not, see <http://www.gnu.org/licenses/>.

use PDF::Reuse;

# Default values
my $FileConfig= 'config.txt';
my $InputPDF= 'model.pdf';
my $OutputPDF= 'diplomas.pdf';
my $DataFile= 'people.csv';
my $Font= 'Times-Bold';
my $FontSize= 40;
my $Orientation= V;



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
        if (s/^Orientation=//){$Orientation= $_;}
	}    
}
close CONFIG;

if (uc $Orientation eq "V"){
    $Rotate= 90;
}
if (uc $Orientation eq "H"){
    $Rotate= 0;
}

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
        utf8::decode($Cell[$i]);
		prText($Coords[$i*2], $Coords[($i*2)+1], $Cell[$i], 'left', $Rotate);
		$i++;
	}
	prPage();
}
close DATA;


 
  
prEnd();  
  

