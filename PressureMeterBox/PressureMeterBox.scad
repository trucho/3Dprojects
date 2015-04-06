//Rack-mounted box to hold pressure meter transducer, panel and tubing.
// Created by Juan Angueyra (angueyra@nih.gov)
// March 2015

box_x=120;
box_y=60;
box_z=120;
front_z=10;

walls=box_y/8;
wallsinv=box_y*7/8;

screen_l=68.10;
screen_w=10.40;
screen_h=21.80;

trcube_l=21.50;
trcube_w=21.5;
trcube_h=6.42;

trcyl_r=(7.70+1.5)/2; //adding tolerance
trcyl_h=34.30;

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
translate(bottom_tr){rotate(bottom_rot){box_bottom();}}

// front (for screen)
front_tr = 3Dprintflag ? [box_x-front_z,walls,walls+1] : [0,-front_z,front_z];
front_rot = 3Dprintflag ? [0,0,0] : [90,90,0];
translate(front_tr){rotate(front_rot){box_front(box_x-(walls*2),box_y-walls,front_z);}}


//9V battery
battery_tr = 3Dprintflag ? [-50,10,0] : [0,0,0];
battery_rot = 3Dprintflag ? [90,0,1800] : [0,0,0];
// translate(battery_tr){rotate(battery_rot){#battery_9V();}}

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
		}
	}}
}

module screen() {
	color([50/255, 50/255, 255/255,.7]) {
		translate([(box_x-(walls*2)-10)/2, (box_y-walls)/2, front_z/2]) {
			cube(size=[screen_l, screen_h, screen_w], center=true);
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

module battery_9V() {
	cube(size=[26, 16.9, 44.7], center=true);
	translate([-6.5, 0, 2]){cylinder(r=8/2, h=48.8, center=true);}
	translate([13-6.5, 0, 2]){cylinder(r=8/2, h=48.8, center=true);}
}

//Other .scad files
include </Users/angueyraaristjm/Documents/3DProjects/ScrewsAndNuts/ScrewsAndNuts.scad>