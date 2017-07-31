//Olympus Scope Filter Slider
// Created by Juan Angueyra (angueyra@uw.edu)
// March 2016
// Variables (is this mm?)
clock_w=42;
clock_h=60;
clock_l=126;
wall = 5;
wall_rot = 10;
opp = sin(wall_rot)*clock_h;
adj = cos(wall_rot)*clock_h;

 // main call
3Dprintflag=1;
back_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
back_rot = 3Dprintflag ? [0,0,0] : [0,0,0];

// normal
// translate(back_tr){rotate(back_rot){clockback();}}

// test piece
difference() {
	translate(back_tr){rotate(back_rot){clockback();}}
	union() {
		rotate([90,0,0]) {translate([0,0,85]) {cube(size=[100,100,100],center=true);}}
		rotate([90,0,0]) {translate([0,0,-25]) {cube(size=[100,100,100],center=true);}}
	}
}


// modules

module clockback() {
	difference() {
		union() {
			// clock();
			back();
			toparms();
		}
		
		translate([0,0,clock_h/2+wall*1.5]) {cube(size=[150,150,wall],center=true);}
	}
}

module back() {
	// color([1,0,0],0.5){rotate([0,90,0]) {cube(size=[clock_h,clock_l,wall],center=true);}}
	translate([-opp,0,+wall/2]) {rotate([0,90-wall_rot,0]) {cube(size=[clock_h+wall*1.5,clock_l,wall],center=true);}}
}

module toparms() {
		toparmL();
		toparmR();
		translate([-opp-wall*1.4,0,clock_h/2+wall/2]) {rotate([0,90,0]) {cube(size=[wall,clock_l,wall*1.4],center=true);}}
}

module toparmL() {
	translate([clock_w/2-wall-opp/2,clock_l*.25,clock_h/2+wall/2]) {rotate([0,0,0]) {cube(size=[clock_w+opp+wall,clock_w/2,wall],center=true);}}
	translate([clock_w+0,clock_l*.25,clock_h/2]) {cube(size=[wall,clock_w/2,wall*2],center=true);}
}

module toparmR() {
	mirror([0,1,0]) {toparmL();}
}

module clock(){
	translate([clock_w/2-opp/4,0,0]) {color([1,0,0],0.5){cube(size=[clock_w,clock_l,clock_h],center=true);}}
}


module trapezoid(width_base, width_top,height,thickness) {
	translate([height/2,-width_base/2,thickness/2]) {rotate([0,0,90]) {
  		linear_extrude(height = thickness) polygon(points=[[0,0],[width_base,0],[width_base-(width_base-width_top)/2,height],[(width_base-width_top)/2,height]], paths=[[0,1,2,3]]);  
	}}
}