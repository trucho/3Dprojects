// Light-blocking cylinder for 
// Created by Juan Angueyra (angueyra@nih.gov)
// September 2018
lbc_r=38.4/2; //(to fit top inner ring of the lid of 35-mm petri dishes)
lbc_h=70;
lbc_wall = 3;

adp_h=90-lbc_h;
adp_r = 24/2;

 // main call
3Dprintflag=1;
lbc_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
lbc_rot = 3Dprintflag ? [0,180,0] : [0,0,0];

adp_tr = 3Dprintflag ? [lbc_r*2.1,0,0] : [0,0,0];

translate(lbc_tr){rotate(lbc_rot){lbc();}}
translate(adp_tr){rotate(lbc_rot){adp();}}


// modules
module lbc() {
	difference() {
		cylinder(r=lbc_r,h=lbc_h,center=true);
		translate([0,0,-lbc_h/8]) {cylinder(r=lbc_r-lbc_wall,h=lbc_h*2,center=true);}
	}
}

module adp() {
	difference() {
		union() {
			translate([0,0,lbc_h/2-adp_h/2]) {cylinder(r=lbc_r,h=adp_h,center=true);}
			translate([0,0,lbc_h/2-adp_h-.005]) {cylinder(r=lbc_r-lbc_wall-.5,h=adp_h*2,center=true);}
		}
		translate([0,0,lbc_h/2]) {cylinder(r=adp_r,h=adp_h*8,center=true);}
	}
	
}


module trapezoid(width_base, width_top,height,thickness) {
	translate([height/2,-width_base/2,thickness/2]) {rotate([0,0,90]) {
  		linear_extrude(height = thickness) polygon(points=[[0,0],[width_base,0],[width_base-(width_base-width_top)/2,height],[(width_base-width_top)/2,height]], paths=[[0,1,2,3]]);  
	}}
}