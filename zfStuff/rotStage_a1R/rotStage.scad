include <../zfOKRPLatform/gears_v5.1.scad>

// projection ring ~ 80 mm in diameter
// petri dish lid ~ 90 mm in diameter
// 12-well plate well is 25 mm in diameter and plate is ~125 x 85

bpx = 160-1;
bpy = 110-1;
bpz = 3-1;
bpr = 7;
// but it also has rounded corners with ~7mm radius to that curve


difference() {
	union() {
		myGear();
		translate([0, 0, -5]) {slidePlate();}
	}
	union() {
		translate([0, 0, 1.5]) {slide();}
		slideCutOut();
	}
}

module basePlate() {
	difference() {
		union() {
			translate([0, 0, bpz+2]) {cylinder(r=44.5, h=2, center=true);}
			minkowski(){
				  cube(size=[bpx-bpr, bpy-bpr, bpz], center=true);
				  cylinder(r=bpr,h=bpz);
			}
		}
		cylinder(r=40.5, h=14, center=true);
	}
}

module slidePlate() {
	difference() {
		union() {
			translate([0, 0, bpz/2]) {cylinder(r=44.5, h=bpz*2, center=true);}
			cube(size=[bpx-30, 25, bpz], center=true);
		}
		cylinder(r=40.5, h=14, center=true);
	}
}

module slideCutOut() {
	scale([.9, .95, 10]) {slide();}
}

module slide() {
	cube(size=[75, 25, 2], center=true);
}
module myGear2() {

}

module myGear() {
	rotate([180, 0, 0]) {
		translate([0, 0, -3/2]) {
			gear (number_of_teeth=36,
			circular_pitch=500,
			circles=0,
			hub_diameter=2*8.88888889,
			rim_width=2,
			rim_thickness=3,
			gear_thickness=2,
			hub_thickness=2);
		}

	}


	translate ([54.5,-31.5,-3/2]){rotate ([0,0,360*5/36]){
	gear (number_of_teeth=9,
		circular_pitch=500,
		hub_diameter=10,
		circles=0,
		rim_width=2,
		rim_thickness=3,
		gear_thickness=2,
		hub_thickness=2);
	}}
}
