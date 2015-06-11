//Tron-Trout
// Created by Juan Angueyra (angueyra@gmail.com
// May 2015

// Variables
unit=10;
unit_z=unit/10;

n_faces=16;


// main call
3Dprintflag=0;
t1_tr = 3Dprintflag ? [0,0,0] : [-10*unit,0,0];
t1_rot = 3Dprintflag ? [0,0,0] : [0,0,0];
translate(t1_tr){rotate(t1_rot){t1();}}

t2_tr = 3Dprintflag ? [0,0,0] : [-10*unit,3*unit,0];
t2_rot = 3Dprintflag ? [0,0,0] : [0,0,0];
translate(t2_tr){rotate(t2_rot){t2();}}

r1_tr = 3Dprintflag ? [0,0,0] : [-10*unit,5*unit,0];
r1_rot = 3Dprintflag ? [0,0,0] : [0,0,0];
translate(r1_tr){rotate(r1_rot){r1();}}

r2_tr = 3Dprintflag ? [0,0,0] : [-10*unit,6*unit,0];
r2_rot = 3Dprintflag ? [0,0,0] : [0,0,0];
translate(r2_tr){rotate(r2_rot){r2();}}

r3_tr = 3Dprintflag ? [0,0,0] : [-7.5*unit,6.5*unit,0];
r3_rot = 3Dprintflag ? [0,0,0] : [0,0,0];
translate(r3_tr){rotate(r3_rot){r3();}}

o1_tr = 3Dprintflag ? [0,0,0] : [-7.5*unit,12.5*unit,0];
o1_rot = 3Dprintflag ? [0,0,0] : [0,0,0];
translate(o1_tr){rotate(o1_rot){o1();}}

u1_tr = 3Dprintflag ? [0,0,0] : [-11.5*unit,16*unit,0];
u1_rot = 3Dprintflag ? [0,0,0] : [0,0,0];
translate(u1_tr){rotate(u1_rot){u1();}}


module u1() {
	square(1.5,0);
	square(2,0);
	square(3,0);
	square(4,0);
	square(5,0);
	square(5.5,0);
	translate([6.5*unit, 0, 0]) {mirror([1, 0, 0]) {pgram(0,0);}}
	translate([5.5*unit, unit, 0]) {mirror([1, 0, 0]) {pgram(0,0);}}
}

module o1(){
	difference() {
		cylinder(r=2.5*unit, h=unit_z, center=true);
		cylinder(r=1.25*unit, h=unit_z*1.1, center=true);
	}
	
}

module r3() {
	pgram(0,0);
	pgram(1,1);
}

module r2() {
	square(1.5,0.5);
	square(1.5,1.5);
	q_circle(1,1.5,2.5);
}


module r1() {
	square(1.5,0);
	square(2,0);
	square(3,0);
	square(3.5,0);
}

module t2() {
	square(1,0);
	square(2,0);
	square(3,0);
	square(3.5,0);
	q_circle(3,1,1);
	square(0,1);
	square(0,2);
	square(0,3);
	square(0,4);
	square(0,4.5);
	q_circle(2,1,5.5);
}

module t1() {
	square(0,0.5);
	square(0,1.5);
}


	
//modules

module pgram(trx,try) {
	translate([unit*trx, unit*try, 0]) {pgram_base();}
	
}

module pgram_base(){
	difference() {
		square(0,0);
	
		translate([0, -sqrt(2)*unit, 0]) {rotate([0, 0, 45]) {
			union(){
				square(1,0);
				square(2,0);
			}
		}}
	}
	translate([unit,2*unit,0]) {
		rotate([180, 180, 0]) {
				difference() {
					square(0,0);
	
					translate([0, -sqrt(2)*unit, 0]) {rotate([0, 0, 45]) {
						union(){
							square(1,0);
							square(2,0);
						}
					}}
				}
			}
	}
	
}


module square(trx,try) {
	translate([unit*trx, unit*try, 0]) {cube(size=[unit, unit, unit_z], center=false);}
	
}

module q_circle(quarter,trx,try){
	if (quarter==1) {
		translate([unit*trx, unit*try, 0]) {
			difference() {
				cylinder(r=unit, h=unit_z, center=false);
				union() {
					// translate([0, 0, 0]) {square();}
					translate([-unit, 0, 0]) {square();}
					translate([-unit, -unit, 0]) {square();}
					translate([0, -unit, 0]) {square();}
				}
			}
		}
	}
	if (quarter==2) {
		translate([unit*trx, unit*try, 0]) {
			difference() {
				cylinder(r=unit, h=unit_z, center=false);
				union() {
					translate([0, 0, 0]) {square();}
					// translate([-unit, 0, 0]) {square();}
					translate([-unit, -unit, 0]) {square();}
					translate([0, -unit, 0]) {square();}
				}
			}
		}
	}
	if (quarter==3) {
		translate([unit*trx, unit*try, 0]) {
			difference() {
				cylinder(r=unit, h=unit_z, center=false);
				union() {
					translate([0, 0, 0]) {square();}
					translate([-unit, 0, 0]) {square();}
					// translate([-unit, -unit, 0]) {square();}
					translate([0, -unit, 0]) {square();}
				}
			}
		}
	}
	if (quarter==4) {
		translate([unit*trx, unit*try, 0]) {
			difference() {
				cylinder(r=unit, h=unit_z, center=false);
				union() {
					translate([0, 0, 0]) {square();}
					translate([-unit, 0, 0]) {square();}
					translate([-unit, -unit, 0]) {square();}
					// translate([0, -unit, 0]) {square();}
				}
			}
		}
	}
}

//Other .scad files
// use </Users/angueyraaristjm/Documents/3DProjects/ScrewsAndNuts/ScrewsAndNuts.scad>