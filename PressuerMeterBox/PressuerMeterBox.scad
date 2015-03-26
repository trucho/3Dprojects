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

trcyl_d=7.70;
trcyl_h=34.30;


n_faces=16;


3Dprintflag=1;
bottom_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
bottom_rot = 3Dprintflag ? [0,0,0] : [0,0,0];

front_tr = 3Dprintflag ? [box_x-front_z,box_y/6,box_y/6] : [0,0,0];
front_rot = 3Dprintflag ? [0,0,0] : [0,0,0];

translate(bottom_tr){rotate(bottom_rot){box_bottom();}}
translate(front_tr){rotate(front_rot){box_front(box_x-(walls*2)-4,box_y-walls,front_z);}}

module box_front(bx,by,bz){
	edge_r=by/8;
	// Hull
	rotate([90, 0, 90]){translate([edge_r+.5, edge_r, 0]) {
		hull() {
			//straight top
			translate([0, 0, bz/2]){cube(size=[edge_r*2, edge_r*2, bz],center=true);}
			translate([bx-edge_r, 0, bz/2]){cube(size=[edge_r*2, edge_r*2, bz],center=true);}
			//straight bottom
			translate([0, by-edge_r, bz/2]){cube(size=[edge_r*2, edge_r*2, bz],center=true);}
			translate([bx-edge_r, by-edge_r, bz/2]){cube(size=[edge_r*2, edge_r*2, bz],center=true);}
		}		
	}}	
}

module box_bottom() {	
	difference() {
			box_hull(box_x,box_y,box_z);
			translate([10,walls,walls]){box_hull(box_x*7/8,box_y,box_z*1.1);}
	}
	//Pillars
	translate([walls+box_y/25, walls, 0]){
		cube(size=[box_y/5, box_y/5, box_y],center=false);
		translate([box_y/10, box_y/10, box_y+6]) {M3(10);}
	}
	translate([box_x-front_z-walls*2, walls, 0]){
		cube(size=[box_y/5, box_y/5, box_y],center=false);
		translate([box_y/10, box_y/10, box_y+6]) {M3(10);}
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