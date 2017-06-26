//Olympus Scope Filter Slider
// Created by Juan Angueyra (angueyra@uw.edu)
// March 2016

// Variables (is this mm?)
clock_w=50;
clock_h=70;
clock_l=120;
wall = 5;
wall_rot = 10;
opp = sin(wall_rot)*clock_h;
adj = cos(wall_rot)*clock_h;

 // main call
3Dprintflag=1;
back_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
back_rot = 3Dprintflag ? [0,0,0] : [0,0,0];

translate(back_tr){rotate(back_rot){clockback();}}

// modules

module clockback() {
	back();
	toparmL();
	toparmR();
}

module back() {
	color([1,0,0],0.5){rotate([0,90,0]) {cube(size=[clock_h,clock_l,wall],center=true);}}
	translate([-opp,0,+wall/2]) {rotate([0,90-wall_rot,0]) {cube(size=[clock_h+wall,clock_l,wall],center=true);}}
}

module toparmL() {
	translate([clock_w/2-wall-opp/2,clock_l*.25,clock_h/2+wall/2]) {rotate([0,0,0]) {cube(size=[clock_w+opp+wall,clock_w/2,wall],center=true);}}
}

module toparmR() {
	mirror([0,1,0]) {toparmL();}
}

module trapezoid(width_base, width_top,height,thickness) {
	translate([height/2,-width_base/2,thickness/2]) {rotate([0,0,90]) {
  		linear_extrude(height = thickness) polygon(points=[[0,0],[width_base,0],[width_base-(width_base-width_top)/2,height],[(width_base-width_top)/2,height]], paths=[[0,1,2,3]]);  
	}}
}