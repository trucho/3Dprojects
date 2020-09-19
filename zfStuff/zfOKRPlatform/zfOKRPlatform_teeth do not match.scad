include <gears.scad>

// projection ring ~ 80 mm in diameter
// petri dish lid ~ 90 mm in diameter
// 12-well plate well is 25 mm in diameter and plate is ~125 x 85

#translate ([0,0,-20])cylinder(r=90, h=5, center=true);
bothGears();
/* gearBase(); */



module gearBase() {

   difference() {
      translate([0, 0, .6]) {cylinder(r=80, h=.5, center=true); }
      bothGears();
   }
}

module bothGears() {
   translate ([-8,0,5+4]){
      innerGear();
      /* translate ([0,0,2.5+4])cylinder(r=20, h=5, center=true);
      translate ([0,0,-(2.5+4)])cylinder(r=20, h=5, center=true); */
   }

   translate ([50,0,8]){
      outerGear();
      translate ([0,0,-4])cylinder(r=30, h=8, center=true);
   }
}


module outerGear() {
   linear_extrude(height = 4, center = true, convexity = 10, twist = 0)
   gear(number_of_teeth=97,diametral_pitch=1, clearance = 0.2, verbose = false);

}

module innerGear() {
   linear_extrude(height = 10, center = true, convexity = 10, twist = 0)
   gear(number_of_teeth=17,diametral_pitch=1, clearance = 0.2, verbose = false);

}
