/* include </Users/angueyraaristjm/Documents/LiLab/3DPrinting/MCAD-master/nuts_and_bolts.scad> */

//
$fn=360;


Cr = 3.05/2;
Ch = 131.74;
Pr = 2.24/2;
Ph = 7.60;
Sr = 0.4;
Br = 4.40/2;
Bh = 1;

Mina();


module Mina() {
   difference() {
      cylinder(r=Cr, h=Ch, center=false);
      cylinder(r=Cr*.5, h=Ch, center=false);
   }
   difference() {
      translate([0, 0, 131.74]) {cylinder(r=Pr, h=Ph, center=false);}
      translate([0, 0, 131.74+.1]) {cylinder(r=Sr, h=Ph, center=false);}
   }
   translate([0, 0, 131.74-15.00]) {rotate([90, 0, 00]) {cylinder(r=Br, h=Bh, center=true);}}
}
