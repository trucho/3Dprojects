//KimWipe Holder
// Modified by Juan Angueyra (angueyra@uw.edu)
// April 2021

// Variables
//Slider itself
baser = 20;
baseh = 5;
magnetr = 5;
magneth = 2;

difference(){
	union(){
		cylinder(r=baser, h=baseh, center=false);
		translate([0.5, 5, 0]) {import("Kimwipe_box_holder.stl");}
	}
	#translate([0, 0, -0.1]){cylinder(r=magnetr, h=magneth, center=false);}
}


module trapezoid(width_base, width_top,height,thickness) {
	translate([height/2,-width_base/2,thickness/2]) {rotate([0,0,90]) {
  		linear_extrude(height = thickness) polygon(points=[[0,0],[width_base,0],[width_base-(width_base-width_top)/2,height],[(width_base-width_top)/2,height]], paths=[[0,1,2,3]]);
	}}
}
