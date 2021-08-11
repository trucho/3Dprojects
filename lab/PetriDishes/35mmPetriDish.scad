sPD();


module sPD() {
   difference() {
      union() {
         cylinder(d1=37.90, d2=39.14, h=6.17, center=false);
         translate([0, 0, 11.05-6.17]) {cylinder(d1=37.13-0.77,d2=39.14, h=6.17, center=false);}
      }
      translate([0, 0, 1.01]) {cylinder(d1=35.00,d2=35.61, h=11.05-1.0, center=false);}
   }
}
