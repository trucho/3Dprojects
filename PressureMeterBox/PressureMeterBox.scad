//Rack-mounted box to hold pressure meter transducer, panel and tubing.
// Created by Juan Angueyra (angueyra@nih.gov)
// March 2015

box_x=120;
box_y=60;
box_z=120;
front_z=10;

walls=box_y/8;
wallsinv=box_y*7/8;

screen_l=34.50; //screen_l=68.10; //Simpson screen
screen_w=10.40;
screen_h=21.80;

trcube_l=21.50;
trcube_w=21.5;
trcube_h=6.42;

trcyl_r=(7.70+1.5)/2; //adding tolerance
trcyl_h=34.30;
trleads_r=.5;
trleads_h=8;
trleads_delta=1.5;
trbase_l=40;
trbase_w=40;
trbase_h=20;

rackscrew_r=5; //4.66mm
rackscrew_delta=28.27;

//BNC Jack
bnc_r=9.6/2;
//Switch
switch_r=6/2;

n_faces=16;


3Dprintflag=0;

// main box
bottom_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
bottom_rot = 3Dprintflag ? [0,0,0] : [0,0,0];
// translate(bottom_tr){rotate(bottom_rot){box_bottom();}}

// front (for screen)
front_tr = 3Dprintflag ? [box_x-front_z,walls,walls+1] : [0,-front_z,front_z];
front_rot = 3Dprintflag ? [0,0,0] : [90,90,0];
translate(front_tr){rotate(front_rot){box_front(box_x-(walls*2),box_y-walls,front_z);}}

// lid
// lid_tr = 3Dprintflag ? [0,0,8] : [0,box_y*3,-box_y+walls];
lid_tr = 3Dprintflag ? [0,0,8] : [0,0,-box_y+walls];
lid_rot = 3Dprintflag ? [0,0,0] : [0,0,0];
translate(lid_tr){rotate(lid_rot){lid();}}

// pressure transducer
transducer_tr = 3Dprintflag ? [0,0,0] : [80,-95,trbase_h];
transducer_rot = 3Dprintflag ? [0,0,0] : [0,0,90];
// translate(transducer_tr){rotate(transducer_rot){#transducer();}}
translate(transducer_tr){rotate(transducer_rot){transducer_base();}}
//translate([0, trbase_w*1.1, -10]) {translate(transducer_tr){rotate(transducer_rot){#transducer();}}}
translate([0,0,-10]){translate(transducer_tr){rotate(transducer_rot){transducer_basetop();}}}

//9V battery
battery_tr = 3Dprintflag ? [-50,10,0] : [0,0,0];
battery_rot = 3Dprintflag ? [90,0,180] : [0,0,0];
// translate(battery_tr){rotate(battery_rot){#battery_9V();}}


module transducer() {
	rotate([90, 0, 0]) {
		cube(size=[trcube_l, trcube_w, trcube_h], center=true);
		cylinder(r=trcyl_r, h=trcyl_h, center=true);
		translate([trcube_l/2+trleads_h/2, -trcube_w/4, 0]){rotate([0, 90, 0]) {cylinder(r=trleads_r, h=trleads_h, center=true);}}
		translate([trcube_l/2+trleads_h/2, -trcube_w/8, 0]){rotate([0, 90, 0]) {cylinder(r=trleads_r, h=trleads_h, center=true);}}
		translate([trcube_l/2+trleads_h/2, trcube_w/4, 0]){rotate([0, 90, 0]) {cylinder(r=trleads_r, h=trleads_h, center=true);}}
		translate([trcube_l/2+trleads_h/2, trcube_w/8, 0]){rotate([0, 90, 0]) {cylinder(r=trleads_r, h=trleads_h, center=true);}}
	}
}

module transducer_basetop() {
	translate([0, trbase_w*1.1, 0]) {
		difference() {
			rotate([0,0,0]) {transducer_base();}
			union() {
				translate([0, 0, -trbase_h+4]) {cube(size=[50, 50, 10], center=true);}
				translate([-(trbase_l/2-5),-trbase_w/2+5,-trbase_h+8]) {mirror([0,0,1]){screwM3();}}
				translate([(trbase_l/2-5),trbase_w/2-5,-trbase_h+8]) {mirror([0,0,1]){screwM3();}}
				translate([(trbase_l/2-5),-trbase_w/2+5,-trbase_h+8]) {mirror([0,0,1]){screwM3();}}
				translate([-(trbase_l/2-5),trbase_w/2-5,-trbase_h+8]) {mirror([0,0,1]){screwM3();}}
			}
		}			
	}
}
module transducer_base() {
	difference() {
		translate([0,0,-trbase_h/2]) {cube(size=[trbase_l, trbase_w, trbase_h], center=true);}
		
		translate([trbase_l/2-5,-trbase_w/2+5,trbase_h-8.5]) {mirror([0,0,0]){M3(15);}}
		translate([-trbase_l/2+5,+trbase_w/2-5,trbase_h-8.5]) {mirror([0,0,0]){M3(15);}}
		translate([-(trbase_l/2-5),-trbase_w/2+5,trbase_h-8.5]) {mirror([0,0,0]){M3(15);}}
		translate([(trbase_l/2-5),+trbase_w/2-5,trbase_h-8.5]) {mirror([0,0,0]){M3(15);}}
		rotate([90, 0, 0]) {
			cube(size=[trcube_l+2, trcube_w+2, trcube_h+2], center=true);
			cylinder(r=trcyl_r+2, h=trcyl_h+50, center=true);
			hull(){
				translate([trcube_l/2+trleads_h/2, -trcube_w/4, 0]){rotate([0, 90, 0]) {cylinder(r=trleads_r+4, h=trleads_h+10, center=true);}}
				translate([trcube_l/2+trleads_h/2, -trcube_w/8, 0]){rotate([0, 90, 0]) {cylinder(r=trleads_r+4, h=trleads_h+10, center=true);}}
				translate([trcube_l/2+trleads_h/2, trcube_w/4, 0]){rotate([0, 90, 0]) {cylinder(r=trleads_r+4, h=trleads_h+10, center=true);}}
				translate([trcube_l/2+trleads_h/2, trcube_w/8, 0]){rotate([0, 90, 0]) {cylinder(r=trleads_r+4, h=trleads_h+10, center=true);}}
			}
		}
	}
}
	

module box_front(bx,by,bz){
	edge_r=by/8;
	// Hull
	rotate([90, 0, 90]){translate([edge_r+.5, edge_r, 0]) {
		difference() {
			hull() {
				//straight top
				translate([0, 0, bz/2]){cube(size=[edge_r*2, edge_r*2, bz],center=true);}
				translate([bx-edge_r, 0, bz/2]){cube(size=[edge_r*2, edge_r*2, bz],center=true);}
				//straight bottom
				translate([0, by-edge_r, bz/2]){cube(size=[edge_r*2, edge_r*2, bz],center=true);}
				translate([bx-edge_r, by-edge_r, bz/2]){cube(size=[edge_r*2, edge_r*2, bz],center=true);}
			}
			screen();
			translate([85, by/2, bz/2+1]) {rotate([90,270,0]) {
				rotate([0, 90, 0]) {cylinder(r=6/2, h=10, center=true);}
				translate([9, 0, 1.5]) {rotate([0, 70, 0]) {cylinder(r=2/2, h=10, center=true);}}
				translate([-8,0,0]) {cube(size=[10,7,15], center=true);}
				//overshooting hole for quick 3D print
				translate([-8,0,0]) {cube(size=[15,15,20], center=true);}
			}}
			translate([10, by/2, bz/2+1]) {rotate([90,270,0]) {
				rotate([0, 90, 0]) {cylinder(r=6/2, h=10, center=true);}
				translate([9, 0, 1.5]) {rotate([0, 70, 0]) {cylinder(r=2/2, h=10, center=true);}}
				translate([-8,0,0]) {cube(size=[10,7,15], center=true);}
				//overshooting hole for quick 3D print
				translate([-8,0,0]) {cube(size=[15,15,20], center=true);}
			}}
		}
	
	}}
}

module screen() {
	color([50/255, 50/255, 255/255,.7]) {
		translate([(box_x-(walls*2)-10)/2, (box_y-walls)/2, front_z/2]) {
			cube(size=[screen_l, screen_h, screen_w], center=true);
			translate([0, 0, -screen_w/2+1]) {
				cube(size=[screen_l*1.5, screen_h*1.5, screen_w/2], center=true);
			}
		}
	}
}

module lid() {
	//Pillars
	difference(){
		hull(){
			translate([walls+box_y/25+1, walls+1, wallsinv]){
					cube(size=[box_y/5, box_y/5, walls],center=false);
			}
			translate([box_x-front_z-walls*2-1, walls+1, wallsinv]){
					cube(size=[box_y/5, box_y/5, walls],center=false);
			}
			translate([box_x-front_z-walls*2-1, box_x-walls-4.5-1, wallsinv]){
					cube(size=[box_y/5, box_y/5, walls],center=false);
			}
			translate([walls+box_y/25+1, box_x-walls-4.5-1, wallsinv]){
					cube(size=[box_y/5, box_y/5, walls],center=false);
			}
		}
	
		translate([walls+box_y/25, walls, wallsinv]){
				translate([box_y/10, box_y/10, walls+.1]) {M3(10);}
		}
		translate([box_x-front_z-walls*2, walls, wallsinv]){
				translate([box_y/10, box_y/10, walls+.1]) {M3(10);}
		}
		translate([box_x-front_z-walls*2, box_x-walls-4.5, wallsinv]){
				translate([box_y/10, box_y/10, walls+.1]) {M3(10);}
		}
		translate([walls+box_y/25, box_x-walls-4.5, wallsinv]){
				translate([box_y/10, box_y/10, walls+.1]) {M3(10);}
		}
	}
}

module box_bottom() {	
	difference() {
		box_hull(box_x,box_y,box_z);
		union(){
			// smaller box chop
			translate([10,walls,walls]){box_hull(box_x*7/8,box_y,box_z*1.1);}
			// tubing inlet and outlet
			translate([0,box_z/2-trcyl_h*1.5/2+trcyl_r, box_y/4]) {
				rotate([0,90,0]) {
					cylinder(r=trcyl_r, h=trcyl_h, center=true);
					translate([0,trcyl_h*1.5, 0]) {cylinder(r=trcyl_r, h=trcyl_h, center=true);}
				}
			}
		}
		
	}
	//Pillars
	translate([walls+box_y/25, walls, 0]){
		difference() {
			cube(size=[box_y/5, box_y/5, box_y],center=false);
			translate([box_y/10, box_y/10, box_y+6]) {M3(10);}
		}
	}
	translate([box_x-front_z-walls*2, walls, 0]){
		difference() {
			cube(size=[box_y/5, box_y/5, box_y],center=false);
			translate([box_y/10, box_y/10, box_y+6]) {M3(10);}
		}
	}
	translate([box_x-front_z-walls*2, box_x-walls-4.5, 0]){
		difference() {
			cube(size=[box_y/5, box_y/5, box_y],center=false);
			translate([box_y/10, box_y/10, box_y+6]) {M3(10);}
		}
	}
	translate([walls+box_y/25, box_x-walls-4.5, 0]){
		difference() {
			cube(size=[box_y/5, box_y/5, box_y],center=false);
			translate([box_y/10, box_y/10, box_y+6]) {M3(10);}
		}
	}
}	

module box_hull(bx,by,bz) {
	edge_r=by/8;
	// Hull
	rotate([90, 0, 90]){translate([edge_r, edge_r, 0]) {
		hull() {
			//rounded bottom
			//translate([0, 0, 0]){cylinder(r=edge_r,h=bz,center=false,$fn=n_faces);}
			// translate([bx-edge_r, 0,0]){cylinder(r=edge_r,h=bz,center=false,$fn=n_faces);}
			
			//straight top
			translate([0, 0, bz/2]){cube(size=[edge_r*2, edge_r*2, bz],center=true);}
			translate([bx-edge_r, 0, bz/2]){cube(size=[edge_r*2, edge_r*2, bz],center=true);}
			//rounded top
			translate([0, by-edge_r, 0]){cylinder(r=edge_r,h=bz,center=false,$fn=n_faces);}
			translate([bx-edge_r, by-edge_r, 0]){cylinder(r=edge_r,h=bz,center=false,$fn=n_faces);}
		}		
	}}	
}


//Other .scad files
include </Users/angueyraaristjm/Documents/3DProjects/ScrewsAndNuts/ScrewsAndNuts.scad>