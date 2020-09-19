// Mirror mount stop
// simple stop for a mirror holder and mount
// by S. Kovaleski
// date 04/22/12

include <../myCAD/standard_screw_holes.scad>;

// Modifiable parameters
mirror_thickness = 11.62; // measured mirror thickness, tolerance will be handled in code
mirror_diameter = 149.66; // measured mirror diameter, tolerance will be handled in code

// Stop used with 1/4-20 rod to hold a first surface mirror

width = 12; // width of the stop
height = 2*width; // overall height of the stop
depth = width + 1.1*mirror_thickness + 6; // depth of the stop
stop_ht = 6; // size of the stop

difference() {
	cube(size=[width,depth,height]);
	translate([width/2,width/2,-height/2])screwHole(size="1/4-20",length=2*height,thru=true,cntr=false);
	translate([-width/2,width,stop_ht])cube(size=[2*width,depth,height]);
}