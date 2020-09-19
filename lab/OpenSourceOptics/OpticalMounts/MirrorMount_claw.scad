// Mirror mount claw
// simple claw for a mirror holder and mount
// by S. Kovaleski
// date 03/17/12
// modified: 04/22/12

include <../myCAD/standard_screw_holes.scad>;

// Modifiable parameters
mirror_thickness = 11.62; // measured mirror thickness, tolerance will be handled in code
mirror_diameter = 149.66; // measured mirror diameter, tolerance will be handled in code

// Claw used with 1/4-20 rod to hold a first surface mirror

width = 12; // width of the claw
height = 2*width; // overall height of the claw
depth = width + 1.1*mirror_thickness + 6; // depth of the claw
lip_ht = 6; // height of the lip to secure mirror

difference() {
	cube(size=[width,depth,height]);
	translate([width/2,width/2,-height/2])screwHole(size="1/4-20",length=2*height,thru=true,cntr=false);
	translate([-width/2,width,height/2])cube(size=[2*width,2*width,height]);
	translate([-width/2,width,lip_ht])cube(size=[2*width,depth-width-lip_ht,height]);
}