// Small wall for 4 well plate lid to make arena for OMR
// Created by Juan Angueyra (angueyra@nih.gov)
// November 2019

// in mm
wall_h = 7;
wall_t = 2;

// main call
3Dprintflag=1;
wall_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
wall_rot = 3Dprintflag ? [0,0,0] : [0,0,0];


translate(wall_tr){rotate(wall_rot){wall();}}


// modules
module wall() {
	cube(size=[41, wall_t, wall_h], center=true);
	translate([41/2, (20/2), 0]) {
		rotate([0, 0, 90]) {
			cube(size=[20+wall_t, wall_t, wall_h], center=true);
		}
	}
	translate([(41-20)/2, (20), 0]) {
		rotate([0, 0, 0]) {
			cube(size=[20+wall_t, wall_t, wall_h], center=true);
		}
	}
}



module trapezoid(width_base, width_top,height,thickness) {
	translate([height/2,-width_base/2,thickness/2]) {rotate([0,0,90]) {
  		linear_extrude(height = thickness) polygon(points=[[0,0],[width_base,0],[width_base-(width_base-width_top)/2,height],[(width_base-width_top)/2,height]], paths=[[0,1,2,3]]);  
	}}
}