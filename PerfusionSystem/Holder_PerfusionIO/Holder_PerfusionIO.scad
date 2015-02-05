//Holders for perfusion inlets and outlets
//Designed to attach to ??? stage
//in mm for 3D priting
//Created by Juan Angueyra (angueyra@nih.gov)
//Jan 2015

include <pins.scad>


//Using M3 screws

//variables
sidex=14;
sidey=7;
sidez=12;
intero=16;
interi=7;
btx=60;
bty=37;
btz=3;

hx=30;
hy=7;
hz=10;

scrhx=4;
scrhz=45;
scrhy=10;
n_faces=12;


//screwstop_tr=[0,0,0];


3Dprintflag=1;
baseplate_tr = 3Dprintflag ? [0,0,btz] : [0,0,0];
swivelbase_tr = 3Dprintflag ? [85,5,15.72] : [0,0,0];
ebasetop_tr = 3Dprintflag ? [55,50,27.95] : [0,0,0];
ebasebottom_tr = 3Dprintflag ? [30,40,-18] : [0,0,0];
screwstop_tr = 3Dprintflag ? [90,40,scrhz-1] : [0,0,0];

baseplate_rot = 3Dprintflag ? [0,0,0] : [0,0,0];
swivelbase_rot = 3Dprintflag ? [-90,30,180] : [0,0,0];
ebasetop_rot = 3Dprintflag ? [0,-180,150] : [0,0,0];
ebasebottom_rot = 3Dprintflag ? [0,0,1200] : [0,0,0];
screwstop_rot = 3Dprintflag ? [180,0,-120] : [0,0,0];
//

// putting things together
mirror([1,0,0]){
difference(){
	// translate([-10, -70, -2]) {cube(size=[110,150,2],center=false);}
union() {

// Base plate
translate(baseplate_tr){
	rotate(baseplate_rot){
		difference() {
			union(){so1();bo1();}
			union(){
				translate([-.95, .3,0]) {screw_holder();}
				translate([.95, .09,0]) {screw_holder();}
				translate([-.6, .95,0]) {screw_holder();}
				translate([.6, -.6,0]) {screw_holder();}
			}
		}
}}	

// Screw stop	
translate(screwstop_tr){
	rotate(screwstop_rot){
			screw_holder();
}}

	
// Swivel base
translate(swivelbase_tr){
	rotate(swivelbase_rot){
			si();
}}
// Electrode base
translate(ebasetop_tr){
	rotate(ebasetop_rot){
			hl_basetop();
}}

translate(ebasebottom_tr){
	rotate(ebasebottom_rot){
			hl_basebottom();
}}
} //union of all parts


// final check
translate([-10, -70, -2]) {cube(size=[110,150,2],center=false);}
} //difference with bottom leveler
} // mirror for left vs. right
// modules
module screw_holder(){
	rotate([0,0,60]) {
		translate([-.5,-18-scrhy,-1]) {
			difference(){
				union(){
					cube([scrhx,scrhy,scrhz]);
					translate([20, 0, 0]){cube([scrhx,scrhy,scrhz]);}
					translate([0,0,scrhz-sidey]) {cube([24, scrhy, sidey]);}
				}
				translate([12,scrhy/2,scrhz+11.45]) {rotate([0, 0, 0]){screw2(15.5);}}
			}
	}}
}


module hl_basetop(){
	difference() {
		translate([-13, 9, 18]) {rotate([0, 0, -30]){
			hl_top(.33);}}
		union(){
			translate([-.6, 1.4,0]) {si();}
			translate([1.4, .3,0]) {si();}
			translate([0, -1,0]) {si();}
			translate([-1.5, -.1,0]) {si();}
		}
	}

}

module hl_basebottom(){
	difference() {
		translate([-13, 9, 18]) {rotate([0, 0, -30]){
			hl_bottom(.33);}}
		// union(){
		// 	translate([-.6, 1.4,-.5]) {si();}
		// 	translate([1.4, .3,-.50]) {si();}
		// 	translate([0, -1,-.50]) {si();}
		// 	translate([-1.5, -.1,-.50]) {si();}
		// }
	}

}

module hl_top(split){
	difference(){
	// top
			//lip
			union(){
				translate([hx*.90,4.5,hz-1.5]){cube([22, hy*1.75, 1.5]);}
				// translate([0,-7.5,hz]){cube([hx, 29, 2]);}
		
				//body
				translate([0,0,hz*split]){cube([hx, hy, hz-(hz*split)]);}
				translate([0,hy,hz*(1-split)]){cube([hx, hy, hz-(hz*(1-split))]);}

				union() {
					translate([0,14,(hz*(1-split))]){cube([hx, 7.5, (hz*split)]);}
					mirror([0, 0, 1]) {
						translate([8, 17,-(hz*(1-split))-1.5]) {scale([.5,.5,.5]){pintack(h=10);}}}
					mirror([0, 0, 1]) {
						translate([24, 17,-(hz*(1-split))-1.5]) {scale([.5,.5,.5]){pintack(h=10);}}}

				}

				// difference() {
				// 	translate([0,-7.5,(hz*split)]){cube([hx, 7.5, hz*(1-split)]);}
				// 	union() {
				// 		translate([8, -3,(hz*split)]) {scale([.5,.5,.5]){pinhole(h=10);}}
				// 		translate([24, -3,(hz*split)]) {scale([.5,.5,.5]){pinhole(h=10);}}
				// 	}
				// }
			}
		
		union() {
			translate([hx+10, hy/2, hz*split]) {inlet();}
			translate([hx+10, hy+hy/2, hz*(1-split)]) {inlet();}
			}
		}
		
}
module hl_bottom(split){
	difference(){
		//bottom
		union(){
				cube([hx, hy, hz-(hz*(1-split))]);
				translate([0,hy,0]){{cube([hx, hy, hz-(hz*split)]);}}
		
				// union() {
				// 	translate([0,-7.5,0]){cube([hx, 7.5, hz*(split)]);}
				// 	translate([8, -3,(hz*split)-1.5]) {scale([.5,.5,.5]){pintack(h=10);}}
				// 	translate([24, -3,(hz*split)-1.5]) {scale([.5,.5,.5]){pintack(h=10);}}
				// }
		
				difference() {
					translate([0,14,0]){cube([hx, 7.5, hz*(1-split)]);}
					union() {
						mirror([0, 0, 1]) {
							translate([8, 17,-(hz*(split))-3.38]) {scale([.5,.5,.5]){pinhole(h=10);}}}
						mirror([0, 0, 1]) {
							translate([24, 17,-(hz*(split))-3.38]) {scale([.5,.5,.5]){pinhole(h=10);}}}
					}
				}
		}
		union() {
			translate([hx+10, hy/2, hz*split]) {inlet();}
			translate([hx+10, hy+hy/2, hz*(1-split)]) {inlet();}
		}
	}
}


module si(){
	rotate([0, 0, -30]) {
		si1();
	}
}

module si1(){
	translate([0,2.25,sidez/2]){
		difference(){union(){
			translate([1,5,2]) {
				rotate([0,0,0]) {cube([sidex-2,sidey+1.5,sidez-2]);}
			}
			translate([sidex/2,6+sidey+.5,2]){
				rotate([90, 90, 0]) {cylinder(r=(sidex-2)/2, h=sidey+1.5);}
			}
		}
		translate([sidex/2,6+sidey,2]){
			translate([0,-15,0]){rotate([90, 90, 0]){screw2();}}
		}
	}}
}
	

module bo1(){
	translate([0,-10-(bty-(intero+sidey))/2,-btz]) {
		difference(){
			rotate([0,0,0]) {cube([btx,bty,btz]);}
			hull() {
				translate([btx-6, bty/2+11, btz]) {cylinder(r=4, h=10, center=true);}
				translate([btx-25, bty/2+11, btz]) {cylinder(r=4, h=10, center=true);}
			}
		}
	}
}
module so1(){
	rotate([0,0,-30]){
		difference() {
			union() {
				translate([0,0,0]) {rotate([0,0,0]) {cube([sidex,sidey,sidez]);}}
				translate([0,intero,0]) {rotate([0,0,0]) {cube([sidex,sidey,sidez]);}}
			}
			translate([sidex/2, 23.1, 2+sidez/2]) {rotate([90, 0, 180]){screw2(21);}}
		}
	}
}


module inlet() {
	mirror([1,0,1]) {
		color([0/255, 150/255, 180/255, 1/2]){cylinder(r=1.66/2+.8, h=60,$fn=n_faces);}
	}
}

module screw() {
	mirror([0,0,1]) {
		union() {
			cylinder(r=1.5+.5, h=27.80,$fn=n_faces);
			cylinder(r=5.4/2+.5, h=3.00,$fn=n_faces);
		}
	}
}
module nut() {
		cylinder(r=5.45/2+1, h=3,$fn=6);
	}
	
module screw2(nutz) {
	mirror([0,0,1]) {
		union() {
			cylinder(r=1.5+.5, h=27.80,$fn=n_faces);
			cylinder(r=5.4/2+.5, h=3.00,$fn=n_faces);
		}
		translate([0, 0, nutz]) {nut();}
	}
}