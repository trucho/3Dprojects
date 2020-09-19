// Small wall for 4 well plate lid to make arena for OMR
// Created by Juan Angueyra (angueyra@nih.gov)
// November 2019

// in mm
bottle_h = 10;
bottle_l = 75;
bottle_w = 100;
bottle_wall = 1.5;

lane_l = 60;
lane_w = 5;
lane_h = 20;

indent = lane_h/4;

// main call
3Dprintflag=1;
bottle_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
bottle_rot = 3Dprintflag ? [0,0,0] : [0,0,0];

crossbar_tr = 3Dprintflag ? [bottle_w/2+10,0,(lane_h+bottle_h-indent)] : [0,0,0];
crossbar_rot = 3Dprintflag ? [-180,0,0] : [0,0,0];


// translate(bottle_tr){rotate(bottle_rot){bottle();}}
translate(bottle_tr){rotate(bottle_rot){lanes();}}
translate(crossbar_tr){rotate(crossbar_rot){crossbars();}}


// modules
module bottle() {
	difference() {
		cube(size=[bottle_l, bottle_w, bottle_h], center=true);
		translate([0, 0, bottle_wall]) {
			cube(size=[bottle_l-bottle_wall, bottle_w-bottle_wall, bottle_h*1.2], center=true);
		}
	}
}

module lane() {
	translate([0, 0, lane_h/2]) {cube(size=[lane_l, lane_w, lane_h], center=true);}
}

module lane_cut() {
	translate([0, 0, lane_h/2]) {cube(size=[lane_l, lane_w+.2, lane_h], center=true);}
}

module lanes(){
	union() {
		translate([0,40.5,0]){rotate(bottle_rot){lane();}}
		translate([0,31.5,0]){rotate(bottle_rot){lane();}}
		translate([0,22.5,0]){rotate(bottle_rot){lane();}}
		translate([0,13.5,0]){rotate(bottle_rot){lane();}}
		translate([0,4.5,0]){rotate(bottle_rot){lane();}}
		translate([0,-4.5,0]){rotate(bottle_rot){lane();}}
		translate([0,-13.5,0]){rotate(bottle_rot){lane();}}
		translate([0,-22.5,0]){rotate(bottle_rot){lane();}}
		translate([0,-31.5,0]){rotate(bottle_rot){lane();}}
		translate([0,-40.5,0]){rotate(bottle_rot){lane();}}
	}
}

module crossbars(){
	difference() {
		union() {
				translate([lane_l/4,0,lane_h+bottle_h/2-indent]){rotate(90,0,0){cube(size=[bottle_l*1.5, lane_w*2, bottle_h], center=true);}}
				translate([-lane_l/4,0,lane_h+bottle_h/2-indent]){rotate(90,0,0){cube(size=[bottle_l*1.5, lane_w*2, bottle_h], center=true);}}
			}
		union() {
			translate([0,40.5,0]){rotate(bottle_rot){lane_cut();}}
			translate([0,31.5,0]){rotate(bottle_rot){lane_cut();}}
			translate([0,22.5,0]){rotate(bottle_rot){lane_cut();}}
			translate([0,13.5,0]){rotate(bottle_rot){lane_cut();}}
			translate([0,4.5,0]){rotate(bottle_rot){lane_cut();}}
			translate([0,-4.5,0]){rotate(bottle_rot){lane_cut();}}
			translate([0,-13.5,0]){rotate(bottle_rot){lane_cut();}}
			translate([0,-22.5,0]){rotate(bottle_rot){lane_cut();}}
			translate([0,-31.5,0]){rotate(bottle_rot){lane_cut();}}
			translate([0,-40.5,0]){rotate(bottle_rot){lane_cut();}}
		}
	}
	
}

module trapezoid(width_base, width_top,height,thickness) {
	translate([height/2,-width_base/2,thickness/2]) {rotate([0,0,90]) {
  		linear_extrude(height = thickness) polygon(points=[[0,0],[width_base,0],[width_base-(width_base-width_top)/2,height],[(width_base-width_top)/2,height]], paths=[[0,1,2,3]]);  
	}}
}