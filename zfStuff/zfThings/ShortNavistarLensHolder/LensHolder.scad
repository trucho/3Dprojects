include </Users/angueyraaristjm/Documents/LiLab/3DPrinting/MCAD-master/nuts_and_bolts.scad>

// Holder for 1.5X and IR lenses in front of short Navistar lens
$fn=360;

IRFr = 25.4/2+1;
IRFh = 7;

ZLr = 26/2+1;
ZLh = 13;

APr = 21/2;
APh = 100;

Hr1 = 30/2;
Hr2 = 33/2;
Hh = 20;
NVSLlip=3;

OUTr = Hr2 + 4;
OUTh = 24;

Holder();




module Holder() {

   difference() {
      cylinder(r=OUTr, h=OUTh, center=false);

      union() {
         translate([0, 0, -.01]) {scale([1.01,1.01,1]){Assembly();}}
         translate([0, -(OUTr-1.25), 2]) {rotate([90, 0, 0]) {nut();}}
         translate([0, 0, 2]) {rotate([-90, 0, 0]) {screw();}}
      }

   }


}


module Assembly() {
   cylinder(r=APr, h=APh, center=true);
   NVStarLens();
   translate([0, 0, NVSLlip + NVSLlip-4]) {
      ZL();
      translate([0, 0, ZLh]) {IRF();}
   }

}

module NVStarLens() {
   cylinder(r=Hr2, h=NVSLlip, center=false);
   translate([0, 0, NVSLlip]) {cylinder(r=Hr1, h=NVSLlip, center=false);}
}
module ZL() {cylinder(r=ZLr, h=ZLh, center=false);}
module IRF() {cylinder(r=IRFr, h=IRFh, center=false);}



module screw() {
	mirror([0,0,1]) {
		union() {
			cylinder(r=1.5+.5, h=27.80);
			cylinder(r=5.4/2+.5, h=3.00);
		}
	}
}
module nut() {
	cylinder(r=5.45/2+.5, h=2.5,$fn=6, center = true);
}
