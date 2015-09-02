n_faces=50;
def=10;

//Screen params
LCDr0=35.1/2;
LCDr1=22.2;

LCDz=2.5;
MODz=4.9-2.5;

LCDx1f=39.1;

LCDx1=42.4;
LCDx2=35.5;
LCDx3=32.0;
LCDx4=13.2;

LCDy0=46.9;
LCDy1=20.0;
LCDy2=12.3;
LCDy3=21.2;
LCDy4=14.6;


//Holder params
HLDRx=55;
HLDRy=70;
HLDRz=50;

carvingMODz=HLDRy;

3Dprintflag=0;

uLCD220h_tr = 3Dprintflag ? [0,0,HLDRz] : [0,0,0];
uLCD220h_rot = 3Dprintflag ? [0,-90,0] : [0,0,0];

uLCD220_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
uLCD220_rot = 3Dprintflag ? [0,0,0] : [0,0,0];

//Screen holder
translate(uLCD220h_tr){rotate(uLCD220h_rot){uLCD220_h();}}

// Screen itself
//translate(uLCD220_tr){rotate(uLCD220_rot){#uLCD220();}}

//translate(uLCD220_tr){rotate(uLCD220_rot){#uLCD220_carving();}}



module uLCD220_h() {
		difference() {
			uLCD220_hcube();
			union(){
				translate(uLCD220_tr){rotate([0,90,0]){uLCD220_carving();}}
				translate([0, 0, HLDRz/2]) {translate([-HLDRx/2,-HLDRy/6,0]){cube(size=[HLDRx*1.1,HLDRy*1.1,HLDRz*1.1], center=true);}}
			}
		}
		
}


module uLCD220_hcube() {
	translate([-HLDRx/2,-HLDRy/6,0]) {cube(size=[HLDRx,HLDRy,HLDRz], center=true);}
}



module uLCD220() {
	uLCD220_screen_front();
	translate([0,(-(LCDy1+LCDy2/2)),(-(LCDy1+LCDy2/2+LCDz))]) {rotate([-90,0,0]) {uLCD220_screen_back();}}
}

module uLCD220_carving() {
	uLCD220_screen_front_carving();
	translate([0,(-(LCDy1+LCDy2/2)),(-(LCDy1+LCDy2/2+LCDz))]) {rotate([-90,0,0]) {uLCD220_screen_back_carving();}}
}

module uLCD220_screen_front() {
	difference() {
		union() {
				translate([0,0,-20]) {color([0/255, 0/255, 0/255]) {cylinder(r=LCDr0, h=LCDz+1, center=true);}}
				cylinder(r=LCDr1, h=LCDz, center=true);
				translate([0,-LCDy1/2-LCDy2/2, 0]) {cube(size=[LCDx1f,LCDy1,LCDz], center=true);}
			}
			
		union() {
			translate([0, LCDy3+def/2-1.3, 0]) {cube(size=[LCDx4+10,def,def], center=true);}
			translate([+(LCDx1f/2+def/2), 0, 0]) {cube(size=[def,LCDy2+10,def], center=true);}
			translate([-(LCDx1f/2+def/2), 0, 0]) {cube(size=[def,LCDy2+10,def], center=true);}
			translate([-LCDx1f/2-.5, -LCDy1-LCDy2/2-.5, 0]) {
				polyhedron(
					points=[[0,0,-def],[0,LCDy1,-def],[LCDx1-LCDx2,0,-def],[0,0,def],[0,LCDy1,def],[LCDx1f-LCDx2,0,def]],
					faces=[[0,2,1],[3,4,5],[0,1,4,3],[0,3,5,2],[5,4,1,2]]);
			}
			translate([LCDx1f/2+.5, -LCDy1-LCDy2/2-.5, 0]) {
				polyhedron(
					points=[[0,0,-def],[0,LCDy1,-def],[-(LCDx1-LCDx2),0,-def],[0,0,def],[0,LCDy1,def],[-(LCDx1f-LCDx2),0,def]],
					faces=[[0,1,2],[3,5,4],[0,3,4,1],[0,2,5,3],[1,4,5,2]]);
			}
		}
	}
	
}


module uLCD220_screen_back() {
	difference() {
		union() {
				color([0/255, 0/255, 0/255]) {cylinder(r=LCDr0, h=LCDz+1, center=true);}
				cylinder(r=LCDr1, h=LCDz, center=true);
				translate([0,-LCDy1/2-LCDy2/2, 0]) {cube(size=[LCDx1,LCDy1,LCDz], center=true);}
			}
			
		union() {
			translate([0, LCDy3+def/2, 0]) {cube(size=[LCDx4,def,def], center=true);}
			translate([+(LCDx1/2+def/2), 0, 0]) {cube(size=[def,LCDy2,def], center=true);}
			translate([-(LCDx1/2+def/2), 0, 0]) {cube(size=[def,LCDy2,def], center=true);}
			translate([-LCDx1/2-.5, -LCDy1-LCDy2/2-.5, 0]) {
				polyhedron(
					points=[[0,0,-def],[0,LCDy1,-def],[LCDx1-LCDx2,0,-def],[0,0,def],[0,LCDy1,def],[LCDx1-LCDx2,0,def]],
					faces=[[0,2,1],[3,4,5],[0,1,4,3],[0,3,5,2],[5,4,1,2]]);
			}
			translate([LCDx1/2+.5, -LCDy1-LCDy2/2-.5, 0]) {
				polyhedron(
					points=[[0,0,-def],[0,LCDy1,-def],[-(LCDx1-LCDx2),0,-def],[0,0,def],[0,LCDy1,def],[-(LCDx1-LCDx2),0,def]],
					faces=[[0,1,2],[3,5,4],[0,3,4,1],[0,2,5,3],[1,4,5,2]]);
			}
		}
	}
	translate([0, 0, -LCDz+.2]) {
		difference() {
			union() {
					// color([0/255, 0/255, 0/255]) {cylinder(r=LCDr0, h=MODz+1, center=true);}
					cylinder(r=LCDr1, h=MODz, center=true);
					translate([0,-LCDy1/2-LCDy2/2, 0]) {cube(size=[LCDx1,LCDy1,MODz], center=true);}
				}
			
			union() {
				translate([0, LCDy3+def/2, 0]) {cube(size=[LCDx4,def,def], center=true);}
				translate([+(LCDx1/2+def/2), 0, 0]) {cube(size=[def,LCDy2,def], center=true);}
				translate([-(LCDx1/2+def/2), 0, 0]) {cube(size=[def,LCDy2,def], center=true);}
				translate([-LCDx1/2-.5, -LCDy1-LCDy2/2-.5, 0]) {
					polyhedron(
						points=[[0,0,-def],[0,LCDy1,-def],[LCDx1-LCDx2,0,-def],[0,0,def],[0,LCDy1,def],[LCDx1-LCDx2,0,def]],
						faces=[[0,2,1],[3,4,5],[0,1,4,3],[0,3,5,2],[5,4,1,2]]);
				}
				translate([LCDx1/2+.5, -LCDy1-LCDy2/2-.5, 0]) {
					polyhedron(
						points=[[0,0,-def],[0,LCDy1,-def],[-(LCDx1-LCDx2),0,-def],[0,0,def],[0,LCDy1,def],[-(LCDx1-LCDx2),0,def]],
						faces=[[0,1,2],[3,5,4],[0,3,4,1],[0,2,5,3],[1,4,5,2]]);
				}
			}
		}
	}
}

module uLCD220_screen_front_carving() {
	difference() {
		union() {
				translate([0,0,-20]) {color([0/255, 0/255, 0/255]) {cylinder(r=LCDr0, h=LCDz+1+200, center=true);}}
				cylinder(r=LCDr1, h=LCDz, center=true);
				translate([0,-LCDy1/2-LCDy2/2, 0]) {cube(size=[LCDx1f,LCDy1,LCDz], center=true);}
			}
			
		union() {
			translate([0, LCDy3+def/2-1.3, 0]) {cube(size=[LCDx4+10,def,def], center=true);}
			translate([+(LCDx1f/2+def/2), 0, 0]) {cube(size=[def,LCDy2+10,def], center=true);}
			translate([-(LCDx1f/2+def/2), 0, 0]) {cube(size=[def,LCDy2+10,def], center=true);}
			translate([-LCDx1f/2-.5, -LCDy1-LCDy2/2-.5, 0]) {
				polyhedron(
					points=[[0,0,-def],[0,LCDy1,-def],[LCDx1-LCDx2,0,-def],[0,0,def],[0,LCDy1,def],[LCDx1f-LCDx2,0,def]],
					faces=[[0,2,1],[3,4,5],[0,1,4,3],[0,3,5,2],[5,4,1,2]]);
			}
			translate([LCDx1f/2+.5, -LCDy1-LCDy2/2-.5, 0]) {
				polyhedron(
					points=[[0,0,-def],[0,LCDy1,-def],[-(LCDx1-LCDx2),0,-def],[0,0,def],[0,LCDy1,def],[-(LCDx1f-LCDx2),0,def]],
					faces=[[0,1,2],[3,5,4],[0,3,4,1],[0,2,5,3],[1,4,5,2]]);
			}
		}
	}
	
}

module uLCD220_screen_back_carving() {
	difference() {
		union() {
				color([0/255, 0/255, 0/255]) {cylinder(r=LCDr0, h=LCDz+1, center=true);}
				cylinder(r=LCDr1, h=LCDz, center=true);
				translate([0,-LCDy1/2-LCDy2/2, 0]) {cube(size=[LCDx1,LCDy1,LCDz], center=true);}
			}
			
		union() {
			translate([0, LCDy3+def/2, 0]) {cube(size=[LCDx4,def,def], center=true);}
			translate([+(LCDx1/2+def/2), 0, 0]) {cube(size=[def,LCDy2,def], center=true);}
			translate([-(LCDx1/2+def/2), 0, 0]) {cube(size=[def,LCDy2,def], center=true);}
			translate([-LCDx1/2-.5, -LCDy1-LCDy2/2-.5, 0]) {
				polyhedron(
					points=[[0,0,-def],[0,LCDy1,-def],[LCDx1-LCDx2,0,-def],[0,0,def],[0,LCDy1,def],[LCDx1-LCDx2,0,def]],
					faces=[[0,2,1],[3,4,5],[0,1,4,3],[0,3,5,2],[5,4,1,2]]);
			}
			translate([LCDx1/2+.5, -LCDy1-LCDy2/2-.5, 0]) {
				polyhedron(
					points=[[0,0,-def],[0,LCDy1,-def],[-(LCDx1-LCDx2),0,-def],[0,0,def],[0,LCDy1,def],[-(LCDx1-LCDx2),0,def]],
					faces=[[0,1,2],[3,5,4],[0,3,4,1],[0,2,5,3],[1,4,5,2]]);
			}
		}
	}
	translate([0, 0, -carvingMODz/2+.2]) {
		difference() {
			union() {
					// color([0/255, 0/255, 0/255]) {cylinder(r=LCDr0, h=MODz+1, center=true);}
					cylinder(r=LCDr1, h=carvingMODz, center=true);
					translate([0,-LCDy1/2-LCDy2/2, 0]) {cube(size=[LCDx1,LCDy1+10,carvingMODz], center=true);}
				}
			
			union() {
				translate([0, LCDy3+def/2, 0]) {cube(size=[LCDx4,def,def+carvingMODz], center=true);}
				translate([+(LCDx1/2+def/2), 0, 0]) {cube(size=[def,LCDy2,def+carvingMODz], center=true);}
				translate([-(LCDx1/2+def/2), 0, 0]) {cube(size=[def,LCDy2,def+carvingMODz], center=true);}
				translate([-LCDx1/2-.5, -LCDy1-LCDy2/2-.5, 0]) {
					polyhedron(
						points=[[0,0,-(def+carvingMODz)],[0,LCDy1,-(def+carvingMODz)],[LCDx1-LCDx2,0,-(def+carvingMODz)],[0,0,(def+carvingMODz)],[0,LCDy1,(def+carvingMODz)],[LCDx1-LCDx2,0,(def+carvingMODz)]],
						faces=[[0,2,1],[3,4,5],[0,1,4,3],[0,3,5,2],[5,4,1,2]]);
				}
				translate([LCDx1/2+.5, -LCDy1-LCDy2/2-.5, 0]) {
					polyhedron(
						points=[[0,0,-(def+carvingMODz)],[0,LCDy1,-(def+carvingMODz)],[-(LCDx1-LCDx2),0,-(def+carvingMODz)],[0,0,(def+carvingMODz)],[0,LCDy1,(def+carvingMODz)],[-(LCDx1-LCDx2),0,(def+carvingMODz)]],
						faces=[[0,1,2],[3,5,4],[0,3,4,1],[0,2,5,3],[1,4,5,2]]);
				}
			}
		}
	}
}


	
