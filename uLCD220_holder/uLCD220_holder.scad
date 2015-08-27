n_faces=8;
def=10;

LCDr0=35.1/2;
LCDr1=22.2;

LCDz=2.5;
MODz=4.9-2.5;

LCDx1=42.4;
LCDx2=35.5;
LCDx3=32.0;
LCDx4=13.2;

LCDy0=46.9;
LCDy1=20.0;
LCDy2=12.3;
LCDy3=21.2;
LCDy4=14.6;

3Dprintflag=0;
uLCD220_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
uLCD220_rot = 3Dprintflag ? [0,0,0] : [0,0,0];


// Screen itself
translate(uLCD220_tr){rotate(uLCD220_rot){uLCD220();}}

module uLCD220() {
	uLCD220_screen();
	translate([0,(-(LCDy1+LCDy2/2+LCDz)),(-(LCDy1+LCDy2/2+LCDz))]) {rotate([-90,0,0]) {uLCD220_screen();}}
}

module uLCD220_screen() {
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
	
}

	

	
