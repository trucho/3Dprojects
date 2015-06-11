separation=35;
n_faces=8;

box_x=100;
box_y=60;
box_z=40;
lid_z=10;
lid_tol=1; //tolerance

box_wall=5;

pillar_z=25;
pillar_r=8;

3Dprintflag=1;
basebox_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
basebox_rot = 3Dprintflag ? [0,0,0] : [0,0,0];

lid_tr = 3Dprintflag ? [80,80,box_wall*2] : [-20,-20,40];
lid_rot = 3Dprintflag ? [0,180,0] : [0,0,0];

battery_tr = 3Dprintflag ? [-50,10,0] : [0,0,0];
battery_rot = 3Dprintflag ? [90,0,1800] : [0,0,0];



// Box
// translate(basebox_tr){rotate(basebox_rot){base_box();}}

// Lid
translate(lid_tr){rotate(lid_rot){lid();}}

// 9V battery
// translate(battery_tr){rotate(battery_rot){battery_9V();}}

module battery_9V() {
	cube(size=[26, 16.9, 44.7], center=true);
	translate([-6.5, 0, 2]){cylinder(r=8/2, h=48.8, center=true);}
	translate([13-6.5, 0, 2]){cylinder(r=8/2, h=48.8, center=true);}
}



module base_box() {
	difference() {
		base_box_rim();
		union() {
			translate([5,0,0]){base_box_holes();}
			translate([-20, -20, pillar_z+9.9]) {lid_pillars2();}
			translate([30, 30, 5]) {cylinder(r=6/2, h=20, center=true);}
		}
	}
	translate([5,0,0]){neck_attachment();}

}

module lid() {
	difference() {
		union(){
				lid_rim();
				lid_pillars();
			}
			lid_screws();
	}
	// #lid_screws();
}

module lid_pillars() {
	//Pillars for screws
	union() {
		for (i=[0:1]) {
			for (j=[0:1]) {
				translate([box_x*i, box_y*j, -2]) {
						cylinder(r=pillar_r-lid_tol, h=box_wall+box_z-pillar_z-lid_tol, center=true);
				}
			}
		}
	}
}

module lid_pillars2() {
	//Pillars for base box without tolerance modification
	union() {
		for (i=[0:1]) {
			for (j=[0:1]) {
				translate([box_x*i, box_y*j, -.4]) {
						cylinder(r=pillar_r, h=box_z-pillar_z, center=true);
				}
			}
		}
	}
}

module lid_screws(){
	union() {
		for (i=[0:1]) {
			for (j=[0:1]) {
				translate([box_x*i, box_y*j, 10.1]) {
						screw();
				}
			}
		}
	}
}

module lid_rim(){
	lid_pillars();
	
	 difference() {
		//Outer shell
		hull() {
			translate([0, 0, 5]) {
				for (i=[0:1]) {
					for (j=[0:1]) {
						translate([box_x*i, box_y*j, 0]) {
							cylinder(r=10, h=lid_z, center=true);
						}
					}
				}
			}
		}
		//Inner shell	
		hull() {
				translate([box_wall,box_wall,0]) {
					cylinder(r=10, h=lid_z, center=true);}
				translate([box_x-box_wall,box_wall,0]) {
					cylinder(r=10, h=lid_z, center=true);}
				translate([box_wall,box_y-box_wall,0]) {
					cylinder(r=10, h=lid_z, center=true);}
				translate([box_x-box_wall,box_y-box_wall,0]) {
					cylinder(r=10, h=lid_z, center=true);}
			}
	}
}


module base_box_rim(){
	//Pillars for screws
	translate([-20, -20, 15]) {
		for (i=[0:1]) {
			for (j=[0:1]) {
				translate([box_x*i, box_y*j, 0]) {
					difference(){
						cylinder(r=pillar_r, h=pillar_z, center=true);
						union() {
							translate([0, 0, pillar_z-9.9]) {nut();}
							translate([0, 0, -10]) {cylinder(r=1.5+.5, h=27.80,$fn=n_faces);}
						}
					}
				}
			}
		}
	}
	
	
	difference() {
		//Outer shell
		hull() {
			translate([-20, -20, 20]) {
				for (i=[0:1]) {
					for (j=[0:1]) {
						translate([box_x*i, box_y*j, 0]) {
							cylinder(r=10, h=box_z, center=true);
						}
					}
				}
			}
		}
		//Inner shell	
		hull() {
			translate([-20, -20, 22]) {
				translate([box_wall,box_wall,0]) {
					cylinder(r=10, h=box_z, center=true);}
				translate([box_x-box_wall,box_wall,0]) {
					cylinder(r=10, h=box_z, center=true);}
				translate([box_wall,box_y-box_wall,0]) {
					cylinder(r=10, h=box_z, center=true);}
				translate([box_x-box_wall,box_y-box_wall,0]) {
					cylinder(r=10, h=box_z, center=true);}
			}
		}
	}
}

module base_box_holes(){
	box_holes_r=10;
	// Holes
	translate([0,0,5]) {cylinder(r=box_holes_r, h=20, center=true);}
	translate([(1.5*separation),0,5]) {cylinder(r=box_holes_r, h=40, center=true);}
}

module neck_attachment() {
	for (i=[0:1]) {
		scale([1.5, 1.5, 1.5]) {
			translate([separation*i, 0 , 0]) {
				difference() {
					modularHoseSegment(i4);
					// translate([0, 0 , 17]) {cube(size=[0, 0, 0], center=true);}
					translate([0, 0 , 17]) {cube(size=[15, 15, 10], center=true);}
				}
			}
		}
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
	//nut_h=3; //Real
	nut_h=5; //Making Hole deeper
	translate([0, 0, -nut_h]) {
		cylinder(r=5.45/2+1, h=nut_h,$fn=6);
	}	
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
	

// boxes.scad required for roundedBox module
include </Users/angueyraaristjm/Documents/LiLab/3DPrinting/GooseNeck/Parametric_Modular_Hose_Library_v02/modularHoseLibrary.scad>
	
