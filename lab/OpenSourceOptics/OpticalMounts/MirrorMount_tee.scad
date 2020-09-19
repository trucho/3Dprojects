// Mirror mount tee
// tee that links to stops and two claws for a mirror holder and mount
// by S. Kovaleski
// date 04/22/12

include <../myCAD/standard_screw_holes.scad>;

// Modifiable parameters
mirror_thickness = 11.62; // measured mirror thickness, tolerance will be handled in code
mirror_diameter = 149.66; // measured mirror diameter, tolerance will be handled in code

// Tee uses 2 claws+2 stops with 1/4-20 rod to hold a first surface mirror

height = 12; // width of the claw
width = 5*height;
depth = 3*height;
blind_hole = 1.75*height;

difference() {
	difference() {
		cube(size=[width,depth,height], center=true);
		translate([(width-2*height),(depth-height+3),0])cube(size=[width,depth,2*height], center=true);
		translate([(width-2*height),-(depth-height+3),0])cube(size=[width,depth,2*height], center=true);
		translate([-(width-2*height),(depth-height+3),0])cube(size=[width,depth,2*height], center=true);
		translate([-(width-2*height),-(depth-height+3),0])cube(size=[width,depth,2*height], center=true);
	}
	rotate([90,0,0])screwHole(size = "1/4-20", length=1.5*width, thru=true, cntr=true);
	rotate([0,90,0])translate([0,0,width/2])screwHole(size="1/4-20",length=2*blind_hole, thru=true, cntr=true);
	rotate([0,-90,0])translate([0,0,width/2])screwHole(size="1/4-20",length=2*blind_hole, thru=true, cntr=true);
	translate([width/4,0,0])captureNut(size="1/4-20",length=2*height, spin=false, cntr=true);
	translate([-width/4,0,0])captureNut(size="1/4-20",length=2*height, spin=false, cntr=true);
}