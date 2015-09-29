n_faces=50;
def=10;
df=0;//1.5; //distance factor for visualization purposes
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

LCDfrontbackdisp=3.5;

//Holder params
HLDRx=55;
HLDRy=70;
HLDRz=50;

//Zeiss top port adapter
ZADr0=52/2;
ZADr1=37.8/2+.5;
ZADr2=30/2+.5;
ZADh=36.35;
ZADlip=6;
ZADsetscrewh=20.3;

//Mounting rail
RAILh=125;
RAILz=8;
RAILx=ZADr0*2+RAILz+5;

//Generic base mount
BASEx=10;
POSTh=14;
LCDpost_holedist=20;

// 10x objective
obj10r1=25.9/2;
obj10h1=39.42-4.37;
obj10bevelh=8.2;
obj10bevelr=15.2/2;

obj10r2=20.2/2;
obj10h2=4.37/2;

// led holder
ledhr=31.86/2;
ledhh=100;
LEDpost_holedist=15;

carvingMODz=HLDRy;
crv=1;

3Dprintflag=1;

uLCD220h_tr = 3Dprintflag ? [0,0,HLDRx] : [-50,0,0];
uLCD220h_rot = 3Dprintflag ? [0,-90,0] : [0,0,0];

uLCD220h2_tr = 3Dprintflag ? [0,0,HLDRx/2-4.16] : [-50,0,0];
uLCD220h2_rot = 3Dprintflag ? [-90,0,0] : [0,0,0];

uLCD220_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
uLCD220_rot = 3Dprintflag ? [0,0,0] : [0,90,0];

ZAD_tr = 3Dprintflag ? [0,85,ZADr0-5] : [ZADr0,0,0];
ZAD_rot = 3Dprintflag ? [0,180,0] : [-90,0,90];

RAIL_tr = 3Dprintflag ? [ZADr0*3,0,RAILh/2]:[-RAILh/2+ZADr0/2+3,RAILz/2-3,RAILz/2-3];
RAIL_rot = 3Dprintflag ? [180,0,0] : [90,0,90];

RAIL2_tr = 3Dprintflag ? [ZADr0*3-RAILx*1.1,0,RAILh/2]:[-RAILh*2+ZADr0*2+0,RAILz/2-3,RAILz/2-3];
RAIL2_rot = 3Dprintflag ? [180,0,0] : [90,0,-90];

railBase_tr = 3Dprintflag ? [-HLDRx+15,0,BASEx-.55] : [-BASEx,1,RAILx/2+RAILz*3/4];
railBase_rot = 3Dprintflag ? [180,0,90] : [0,0,90];

post_tr = 3Dprintflag ? [HLDRx/2+5,60,POSTh/2] : [0,0,0];
post_rot = 3Dprintflag ? [0,0,0] : [0,0,0];

LCDpost_tr = 3Dprintflag ? [0,HLDRx/2+10,POSTh/2] : [-HLDRz/2-3,0,RAILx/2-RAILz/2+3];
LCDpost_rot = 3Dprintflag ? [0,0,0] : [0,0,0];

LEDpost_tr = 3Dprintflag ? [40,0,POSTh/2] : [-HLDRz/2-42,.5,RAILx/2-RAILz/2+3];
LEDpost_rot = 3Dprintflag ? [0,0,90] : [0,0,0];

obj10_tr = 3Dprintflag ? [30,0,21] : [0,0,0];
obj10_rot = 3Dprintflag ? [0,90,0] : [0,0,0];

ledh_tr = 3Dprintflag ? [0,0,17.51] : [-50,0,0];
ledh_rot = 3Dprintflag ? [0,90,0] : [0,0,0];

brace_tr = 3Dprintflag ? [0,60,ZADh/2] : [ZADr0-4,0,0];
brace_rot = 3Dprintflag ? [0,180,0] : [-90,0,90];

MAIN();

module MAIN() {
	difference() {
	union(){
		//Zeiss top port adapter
		//translate(ZAD_tr){rotate(ZAD_rot){ZAD();}}

		//Rail
		translate(RAIL_tr){rotate(RAIL_rot){RAIL();}}
		translate(RAIL2_tr){rotate(RAIL2_rot){RAIL2();}}

		//Rail base
		// translate(railBase_tr){rotate(railBase_rot){railBase();}}
		// translate([-HLDRx,0,BASEx-.55]){rotate([180,0,90]){railBase();}}
		// translate([-HLDRx-15,0,BASEx-.55]){rotate([180,0,90]){railBase();}}
		// translate([-HLDRx-30,0,BASEx-.55]){rotate([180,0,90]){railBase();}}

		// //Posts
 		// translate(LCDpost_tr){rotate(LCDpost_rot){LCDpost();}}
		// translate(LEDpost_tr){rotate(LEDpost_rot){LEDpost();}}
		// translate([50,0,POSTh/2]){rotate(LEDpost_rot){LEDpost();}}
		// translate([60,0,POSTh/2]){rotate(LEDpost_rot){LEDpost();}}
		// translate([70,0,POSTh/2]){rotate(LEDpost_rot){LEDpost();}}
 		// translate(post_tr){rotate(post_rot){post();}}

		// //Extraposts
		// translate([0,HLDRx/2+20,POSTh/2]){LCDpost();}
		// translate([HLDRx/2+5,70,POSTh/2]){post();}
		// translate([HLDRx/2+5,60,POSTh/2]){post();}
		// translate([HLDRx/2+5,50,POSTh/2]){post();}
		// translate([HLDRx/2+5,40,POSTh/2]){post();}
		// translate([HLDRx/2+20,70,POSTh/2]){post();}
		// translate([HLDRx/2+20,60,POSTh/2]){post();}
		// translate([HLDRx/2+20,50,POSTh/2]){post();}
		// translate([HLDRx/2+20,40,POSTh/2]){post();}

		// //Screen holder
		// translate(uLCD220h2_tr){rotate(uLCD220h2_rot){uLCD220_h2();}}

		// Screen itself
		// translate(uLCD220_tr){rotate(uLCD220_rot){uLCD220_carving();}}
		// color([255/255,0/255,0/255],.5){translate(uLCD220_tr){rotate(uLCD220_rot){uLCD220();}}}
		
		//Objective holder (10x)
		// translate(obj10_tr){rotate(obj10_rot){holder_obj10x();}}
		
		//led holder
		// translate(ledh_tr){rotate(ledh_rot){ledh();}}
		
		//brace
		// translate(brace_tr){rotate(brace_rot){brace();}}
	}
	
	color([255/255,0/255,120/255,0.2]){translate([0,0,-4.99]) {cube(size=[200,200,10],center=true);}}
	}
}

module brace() {
	difference() {
			union() {
				translate([0,0,0]){cube(size=[ZADr0*2,ZADr0*2,ZADh], center=true);}
			}
			union() {
				translate([0,0,ZADlip]) {cylinder(r=ZADr2, h=10*(ZADh+ZADlip), center=true);}
				//screw and nut holes
				rotate([90,0,0]) {translate([(ZADr1+2),ZADh/2-6,34.1]) {M3(13);}}
				rotate([90,0,0]) {translate([-(ZADr1+2),ZADh/2-6,34.1]) {M3(13);}}
				rotate([0,90,0]) {translate([-(ZADr1-ZADlip/2)+4,ZADh/2+3,34.1]) {M3(13);}}
				
				rotate([90,0,0]) {translate([(ZADr1+2),-ZADh/2+6,34.1]) {M3(13);}}
				rotate([90,0,0]) {translate([-(ZADr1+2),-ZADh/2+6,34.1]) {M3(13);}}
				rotate([0,90,0]) {translate([-(ZADr1-ZADlip/2)+ZADh-9,ZADh/2+3,34.1]) {M3(13);}}
			}
	}

}

module braceplate(){
	//Adapter itself
	difference() {
			union() {
				translate([0,0,ZADh/2-ZADlip/2+0.5]){cube(size=[ZADr0*2,ZADr0*2,ZADh-(ZADsetscrewh+5)], center=true);}
			}
			union() {
				translate([0,0,ZADlip]) {cylinder(r=ZADr2, h=10*(ZADh+ZADlip), center=true);}
				//screw and nut holes
				rotate([90,0,0]) {translate([(ZADr1+2),ZADh/2-2,34.1]) {M3(13);}}
				rotate([90,0,0]) {translate([-(ZADr1+2),ZADh/2-2,34.1]) {M3(13);}}
				rotate([0,90,0]) {translate([-(ZADr1-ZADlip/2),ZADh/2+2,34.1]) {M3(13);}}
			}
	}
	// #rotate([90,0,0]) {translate([(ZADr1+2),ZADh/2-2,40]) {M3(18);}}
	// #rotate([90,0,0]) {translate([-(ZADr1+2),ZADh/2-2,40]) {M3(18);}}
	// #rotate([0,90,0]) {translate([-(ZADr1-ZADlip/2),ZADh/2+2,40]) {M3(18);}}
	// rotate([0,90,0]) {translate([-(ZADr1-ZADlip/2),-ZADh/2-2,34.1]) {M3(13);}}
}


module ledh() {
		difference() {
			translate([-HLDRx/2+10,-HLDRy/6+10,0]) {cube(size=[70,HLDRy-20,HLDRz], center=true);}
			union(){
				rotate([0,90,0]) {cylinder(r=ledhr+crv/2,h=ledhh*2,center=true);}
				// nut holes
				rotate([0,0,0]) {
					translate([-BASEx,0,HLDRz/2+10]) {M3(12.5);}
					translate([-BASEx-LEDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
					translate([-BASEx+LEDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
					translate([-BASEx-2*LEDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
				}
				rotate([90,0,0]) {
					translate([-BASEx,0,HLDRz/2+10]) {M3(12.5);}
					translate([-BASEx-LEDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
					translate([-BASEx+LEDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
					translate([-BASEx-2*LEDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
				}
				rotate([180,0,0]) {
					translate([-BASEx,0,HLDRz/2+10]) {M3(12.5);}
					translate([-BASEx-LEDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
					translate([-BASEx+LEDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
					translate([-BASEx-2*LEDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
				}
				rotate([-90,0,0]) {
					translate([-BASEx,0,HLDRz/2+10]) {M3(12.5);}
					translate([-BASEx-LEDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
					translate([-BASEx+LEDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
					translate([-BASEx-2*LEDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
				}
//				rotate([- 90,0,0]) {translate([-BASEx+3,-1,HLDRz/2+10]) {M3(12.5);}}
// 				rotate([-90,0,0]) {translate([-BASEx+3-LEDpost_holedist,-1,HLDRz/2+10]) {M3(12.5);}}
// 				rotate([90,0,0]) {translate([-BASEx+3,-1,HLDRz/2+10]) {M3(12.5);}}
// 				rotate([90,0,0]) {translate([-BASEx+3-LEDpost_holedist,-1,HLDRz/2+10]) {M3(12.5);}}
// 				rotate([180,0,0]) {translate([-BASEx+3,-1,HLDRz/2+10]) {M3(13.5);}}
// 				rotate([180,0,0]) {translate([-BASEx+3-LEDpost_holedist,-1,HLDRz/2+10]) {M3(13.5);}}
				
				
				// translate([-29,0,0]) {cube(size=[60,100,120],center=true);}
			}
		}
		//adding things here
		color([255/255,0/255,120/255,0.5]){
			
		}
}

module uLCD220_h2() {
		difference() {
			translate([-HLDRx/2+10,-HLDRy/6+10,0]) {cube(size=[HLDRx*2/3,HLDRy-20,HLDRz], center=true);}
			union(){
				translate(uLCD220_tr){rotate([0,90,0]){uLCD220_carving2();}}
				// nut holes
				translate([-BASEx+6,0,HLDRz/2+10]) {M3(12.5);}
				rotate([-90,0,0]) {translate([-BASEx+6,-1,HLDRz/2+10]) {M3(12.5);}}				
			}
		}
		color([255/255,0/255,120/255,0.5]){

		}
}

module uLCD220_carving2() {
	translate([0,0,-10]) {uLCD220_screen_back_carving();}
	translate([0,0,50]) {uLCD220_screen_front_carving();}
}

module holder_obj10x() {
	color([100/255,100/255,100/255],.6){
		difference() {
			translate([-6,-(HLDRy)/6+20/2,0]) {cube(size=[HLDRx,HLDRy-20,HLDRz], center=true);}
			//10x obj hole
			rotate([0,90,0]) {translate([0,0,0]) {obj10x(crv);}}
			//nut holes
			translate([22-BASEx+2,0,HLDRz/2+10]) {M3(13.5);}
			translate([22-BASEx+2-LCDpost_holedist,0,HLDRz/2+10]) {M3(13.5);}
			translate([22-BASEx+2-LCDpost_holedist*2,0,HLDRz/2+10]) {M3(13.5);}
			rotate([-90,0,0]) {
				translate([22-BASEx+2,0,HLDRz/2+10]) {M3(14.5);}
				translate([22-BASEx+2-LCDpost_holedist,0,HLDRz/2+10]) {M3(14.5);}
				translate([22-BASEx+2-LCDpost_holedist*2,0,HLDRz/2+10]) {M3(14.5);}
			}
			//set screws nuts hole
			rotate([90,0,0]) {
				translate([28-BASEx+2-LCDpost_holedist,0,HLDRz/2+10]) {M3(12);}
			}
			rotate([180,0,0]) {
				translate([28-BASEx+2-LCDpost_holedist,0,HLDRz/2+10]) {M3(14);}
			}
		}
	}
	color([0/255,0/255,200/255],.5){
		// rotate([0,90,0]) {translate([0,0,0]) {obj10x(0);}}
	}
}

module obj10x(crv) {
	translate([0,0,-((obj10h1-obj10bevelh)/2+obj10h2/2)]) {rotate([0,0,0]) {cylinder(r=obj10r2+crv,h=obj10h2,center=true);}}
	hull(){
		translate([0,0,0]) {rotate([0,0,0]) {cylinder(r=obj10r1+crv,h=obj10h1-obj10bevelh,center=true);}}
		translate([0,0,(obj10h1)/2]) {rotate([0,0,0]) {cylinder(r=obj10bevelr+crv,h=obj10bevelh,center=true);}}
	}
	translate([0,0,-crv*50]) {rotate([0,0,0]) {cylinder(r=obj10r1+crv,h=crv*100,center=true);}}
}

// module obj10x(crv) {
// 	translate([0,0,-((obj10h1-obj10bevelh)/2+obj10h2/2)]) {rotate([0,0,0]) {cylinder(r=obj10r2,h=obj10h2,center=true);}}
// 	hull(){
// 		translate([0,0,0]) {rotate([0,0,0]) {cylinder(r=obj10r1,h=obj10h1-obj10bevelh,center=true);}}
// 		translate([0,0,(obj10h1)/2]) {rotate([0,0,0]) {cylinder(r=obj10bevelr,h=obj10bevelh,center=true);}}
// 	}
// }

module railBase() {
	scfct=1.03;
	
	difference() {
		translate([0,0,RAILz*2/6]) {cube(size=[RAILx,BASEx,RAILz*2/3+RAILz*scfct],center=true);}
		scale([scfct,scfct,scfct]) {rotate([0,180,0]) {linear_extrude(height = RAILz/2, scale = 8/10) square([RAILx/2.5,RAILh*10/8], center = true);}}
		translate([0,0,RAILz+RAILz*2/6-0.5]) {M3(25);}
		translate([RAILx/3,0,RAILz*2+RAILz*2/6-0.5]) {M3(13);}
		translate([-RAILx/3,0,RAILz*2+RAILz*2/6-0.5]) {M3(13);}
	}
	//adding things here to see
	color([255/255,0/255,120/255,0.5]){
		//
		// translate([0,0,RAILz+RAILz*2/6-0.5]) {screwM3(25);}
// 		translate([RAILx/3,0,RAILz*2+RAILz*2/6-0.5]) {M3(13);}
// 		translate([-RAILx/3,0,RAILz*2+RAILz*2/6-0.5]) {M3(13);}
		//
	}
}

module LCDpost(){
	difference() {
		minkowski() {
			cylinder(r=5.4/2+.5,h=POSTh,center=true);
			cube(size=[HLDRz-6,1/1000,1/1000],center=true);
		}
			translate([LCDpost_holedist,0,20/2+5]) {screwM3();}
			translate([-LCDpost_holedist,0,20/2+5]) {screwM3();}
	}
	
}

module LEDpost(){
	difference() {
		minkowski() {
			cylinder(r=5.4/2+.5,h=POSTh,center=true);
			cube(size=[LEDpost_holedist*2.5,1/1000,1/1000],center=true);
		}
			translate([LEDpost_holedist,0,20/2+5]) {screwM3();}
			translate([-LEDpost_holedist,0,20/2+5]) {screwM3();}
	}
	
}

module post(){
	difference() {
		minkowski() {
			cylinder(r=5.4/2+.5,h=POSTh,center=true);
			cube(size=[3,1/1000,1/1000],center=true);
		}
			translate([0,0,20/2+5]) {screwM3();}
	}
	
}

module ZAD() {
	//Adapter itself
	difference() {
			union() {
				cylinder(r=ZADr0, h=ZADh+ZADlip, center=true);
				translate([0,0,ZADh/2-ZADlip/2+0.5]){cube(size=[ZADr0*2,ZADr0*2,ZADh-(ZADsetscrewh+5)], center=true);}
			}
			union() {
				translate([0,0,-ZADlip]) {cylinder(r=ZADr1, h=ZADh, center=true);}
				translate([0,0,ZADlip]) {cylinder(r=ZADr2, h=10*(ZADh+ZADlip), center=true);}
				//screw and nut holes
				rotate([90,0,0]) {translate([(ZADr1+2),ZADh/2-2,34.1]) {M3(13);}}
				rotate([90,0,0]) {translate([-(ZADr1+2),ZADh/2-2,34.1]) {M3(13);}}
				rotate([0,90,0]) {translate([-(ZADr1-ZADlip/2),ZADh/2+2,34.1]) {M3(13);}}
				//side screw holes for microscope attachment
				translate([0,0,-ZADr1-4.3+ZADsetscrewh]) {rotate([90,90,0]) {M3(27.5);}}
				translate([0,0,-ZADr1-4.3+ZADsetscrewh]) {rotate([120+90,90,0]) {M3(27.5);}}
				translate([0,0,-ZADr1-4.3+ZADsetscrewh]) {rotate([240+90,90,0]) {M3(27.5);}}
			}
	}
	// #rotate([90,0,0]) {translate([(ZADr1+2),ZADh/2-2,40]) {M3(18);}}
	// #rotate([90,0,0]) {translate([-(ZADr1+2),ZADh/2-2,40]) {M3(18);}}
	// #rotate([0,90,0]) {translate([-(ZADr1-ZADlip/2),ZADh/2+2,40]) {M3(18);}}
	// rotate([0,90,0]) {translate([-(ZADr1-ZADlip/2),-ZADh/2-2,34.1]) {M3(13);}}
}

//-ZADr0+RAILz*3/4
railbottomdisplacement=2;
railrailcorrection=2;
module RAIL() {
	difference() {
//		translate([0,0,-RAILz*2-5]) {union() {
		union() {
			difference() {
					cube(size=[RAILx,RAILx,RAILh], center=true);				
					translate([-RAILz,-RAILz,0]) {cube(size=[RAILx,RAILx,RAILh*1.1], center=true);}
			}
			//rails
			translate([-railrailcorrection,0,0]) {RAILrail();}
			rotate([0,0,270]) {translate([railrailcorrection,0,0]) {RAILrail();}}
			//bottom plate and joints
			translate([0,-(RAILx/2+RAILz)+railbottomdisplacement,0]) {rotate([90,0,0]) {cube(size=[RAILx,RAILh,RAILz*2],center=true);}}
			translate([0,-(RAILx/2)-RAILz/2+railbottomdisplacement,-RAILh/2]) {rotate([90,0,0]) {cube(size=[RAILx/2,RAILh/3,RAILz],center=true);}}
		
			translate([RAILx/2-RAILx/8,RAILx/2-RAILz/2,-RAILh/2]) {rotate([90,0,0]) {cube(size=[RAILx/4,RAILh/3,RAILz],center=true);}}
			translate([-RAILx/2+RAILx/8,RAILx/2-RAILz/2,-RAILh/2]) {rotate([90,0,0]) {cube(size=[RAILx/4,RAILh/3,RAILz],center=true);}}
		}
		translate([0,0,0]) {union(){
			//expanded screw holes
			rotate([-90,0,0]) {translate([ZADh/2-2,-RAILh/2+ZADlip,ZADr1*2-4.5]) {
				minkowski() {screwM3();cube(size=[6,.5,1],center=false);}}
			}
			rotate([-90,0,0]) {translate([-ZADh/2-6-2,-RAILh/2+ZADlip,ZADr1*2-4.5]) {
				minkowski() {screwM3();cube(size=[6,.5,1],center=false);}}
			}
			translate([RAILx/2,-RAILx/2+ZADlip,RAILh/2-ZADlip]) {
					rotate([0,90,0]) {minkowski() {screwM3();cube(size=[.5,6,1],center=false);}}
			}
			//rail holes
			translate([-railrailcorrection,RAILx/2-RAILz/2,-ZADlip*2]) {
				minkowski() {
				rotate([90,0,0]) {cylinder(r=RAILz/2,h=20,center=true);}
				cube(size=[RAILz/100,RAILz,RAILh],center=true);}
			}
			rotate([0,0,-90]) {
				translate([railrailcorrection,RAILx/2-RAILz/2,-ZADlip*2]) {
				minkowski() {
				rotate([90,0,0]) {cylinder(r=RAILz/2,h=20,center=true);}
				cube(size=[RAILz/100,RAILz,RAILh],center=true);}
				}
			}
			//joint screw holes
			translate([RAILx/2+.5,RAILx/2-4,-RAILh/2-RAILh/12]) {rotate([0,90,0]) {screwM3();}}
			translate([-RAILx/2-.5,RAILx/2-4,-RAILh/2-RAILh/12]) {rotate([0,-90,0]) {screwM3();}}
			translate([RAILx/2-10,-RAILx/2-4+railbottomdisplacement,-RAILh/2-RAILh/12]) {rotate([0,90,0]) {M3(11);}}
			translate([-RAILx/2+10,-RAILx/2-4+railbottomdisplacement,-RAILh/2-RAILh/12]) {rotate([0,-90,0]) {M3(11);}}
		}}
	}

	
	//adding things here to see
	color([255/255,255/255,120/255,0.5]){
		//
//		translate([RAILx/2+.5,RAILx/2-4,-RAILh/2-RAILh/12]) {rotate([0,90,0]) {screwM3();}}
		//
	}
}

module RAIL2() {
	difference() {
//		translate([0,0,-RAILz*2-5]) {union() {
	rotate([0,0,90]) {
		union() {
			difference() {
					cube(size=[RAILx,RAILx,RAILh], center=true);				
					translate([-RAILz,-RAILz,0]) {cube(size=[RAILx,RAILx,RAILh*1.1], center=true);}
			}
			//rails
			translate([-railrailcorrection,0,0]) {RAILrail();}
			rotate([0,0,270]) {translate([railrailcorrection,0,0]) {RAILrail();}}
			//bottom plate
			rotate([0,0,-90]) {translate([0,-(RAILx/2+RAILz)+railbottomdisplacement,0]) {rotate([90,0,0]) {cube(size=[RAILx,RAILh,RAILz*2],center=true);}}}
		}
		}
		translate([0,0,0]) {union(){
			//expanded screw holes
			rotate([-90,0,0]) {translate([ZADh/2+2,-RAILh/2+ZADlip,ZADr1*2-4.5]) {
				minkowski() {screwM3();cube(size=[6,.5,1],center=false);}}
			}
			rotate([-90,0,0]) {translate([-ZADh/2-6+2,-RAILh/2+ZADlip,ZADr1*2-4.5]) {
				minkowski() {screwM3();cube(size=[6,.5,1],center=false);}}
			}
			translate([-RAILx/2,-(RAILx/2-ZADlip),RAILh/2-ZADlip]) {
					rotate([0,-90,0]) {minkowski() {screwM3();cube(size=[.5,6,1],center=false);}}
			}
			//rail holes
			translate([railrailcorrection,RAILx/2-RAILz/2,-ZADlip*2]) {
				minkowski() {
				rotate([90,0,0]) {cylinder(r=RAILz/2,h=20,center=true);}
				cube(size=[RAILz/100,RAILz,RAILh],center=true);}
			}
			rotate([0,0,90]) {
				translate([-railrailcorrection,RAILx/2-RAILz/2,-ZADlip*2]) {
				minkowski() {
				rotate([90,0,0]) {cylinder(r=RAILz/2,h=20,center=true);}
				cube(size=[RAILz/100,RAILz,RAILh],center=true);}
				}
			}
			// joints between rails
			jtol=.01;
			translate([0,-(RAILx/2)-RAILz/2+railbottomdisplacement,-RAILh/2]) {rotate([90,0,0]) {cube(size=[RAILx/2,RAILh/3,RAILz+jtol],center=true);}}
			translate([RAILx/2-RAILx/8,RAILx/2-RAILz/2,-RAILh/2]) {rotate([90,0,0]) {cube(size=[RAILx/4+jtol,RAILh/3,RAILz+jtol],center=true);}}
			translate([-RAILx/2+RAILx/8,RAILx/2-RAILz/2,-RAILh/2]) {rotate([90,0,0]) {cube(size=[RAILx/4+jtol,RAILh/3,RAILz+jtol],center=true);}}
			
			
		
			
			//Screw hole for joints
			translate([RAILx/2,RAILx/2-4,-RAILh/2+RAILh/12]) {rotate([0,90,0]) {M3(21);}}
			translate([-RAILx/2,RAILx/2-4,-RAILh/2+RAILh/12]) {rotate([0,-90,0]) {M3(21);}}
			translate([RAILx/2+1,-RAILx/2-4+railbottomdisplacement,-RAILh/2+RAILh/12]) {rotate([0,90,0]) {minkowski() {M3(21);cube(size=[5,1/1000,1/1000],center=true);}}}
			translate([-RAILx/2-1,-RAILx/2-4+railbottomdisplacement,-RAILh/2+RAILh/12]) {rotate([0,-90,0]) {minkowski() {M3(21);cube(size=[5,1/1000,1/1000],center=true);}}}
		}}
	}

	
	//adding things here to see
	color([255/255,0/255,120/255,0.5]){
		//

		//
	}
}

module RAIL2old() {
	difference() {
//		translate([0,0,-RAILz*2-5]) {union() {
		union() {
			difference() {
					cube(size=[RAILx,RAILx,RAILh], center=true);				
					translate([-RAILz,-RAILz,0]) {cube(size=[RAILx,RAILx,RAILh*1.1], center=true);}
			}
			//rails
			RAILrail();
			rotate([0,0,270]) {translate([0,0,0]) {RAILrail();}}
			//bottom plate
			translate([0,-(RAILx/2+RAILz),0]) {rotate([90,0,0]) {cube(size=[RAILx,RAILh,RAILz*2],center=true);}}
		}
		translate([0,0,0]) {union(){
			//expanded screw holes
			rotate([-90,0,0]) {translate([ZADh/2-3,-RAILh/2+ZADlip,ZADr1*2-4.5]) {
				minkowski() {screwM3();cube(size=[6,.5,1],center=false);}}
			}
			rotate([-90,0,0]) {translate([-ZADh/2-6-3,-RAILh/2+ZADlip,ZADr1*2-4.5]) {
				minkowski() {screwM3();cube(size=[6,.5,1],center=false);}}
			}
			translate([RAILx/2,-RAILx/2+ZADlip,RAILh/2-ZADlip]) {
					rotate([0,90,0]) {minkowski() {screwM3();cube(size=[.5,6,1],center=false);}}
			}
			//rail holes
			translate([0,RAILx/2-RAILz/2,-ZADlip*2]) {
				minkowski() {
				rotate([90,0,0]) {cylinder(r=RAILz/2,h=20,center=true);}
				cube(size=[RAILz/100,RAILz,RAILh],center=true);}
			}
			rotate([0,0,-90]) {
				translate([0,RAILx/2-RAILz/2,-ZADlip*2]) {
				minkowski() {
				rotate([90,0,0]) {cylinder(r=RAILz/2,h=20,center=true);}
				cube(size=[RAILz/100,RAILz,RAILh],center=true);}
				}
			}
			// joints between rails
			jtol=.01;
			translate([0,-(RAILx/2)-RAILz/2,-RAILh/2]) {rotate([90,0,0]) {cube(size=[RAILx/2,RAILh/3,RAILz+jtol],center=true);}}
			translate([RAILx/2-RAILx/8,RAILx/2-RAILz/2,-RAILh/2]) {rotate([90,0,0]) {cube(size=[RAILx/4+jtol,RAILh/3,RAILz+jtol],center=true);}}
			translate([-RAILx/2+RAILx/8,RAILx/2-RAILz/2,-RAILh/2]) {rotate([90,0,0]) {cube(size=[RAILx/4+jtol,RAILh/3,RAILz+jtol],center=true);}}
			
			
		
			
			//Screw hole for joints
			translate([RAILx/2,RAILx/2-4,-RAILh/2+RAILh/12]) {rotate([0,90,0]) {M3(21);}}
			translate([-RAILx/2,RAILx/2-4,-RAILh/2+RAILh/12]) {rotate([0,-90,0]) {M3(21);}}
			translate([RAILx/2+1,-RAILx/2-4,-RAILh/2+RAILh/12]) {rotate([0,90,0]) {screwM3();}}
			translate([-RAILx/2-1,-RAILx/2-4,-RAILh/2+RAILh/12]) {rotate([0,-90,0]) {screwM3();}}
		}}
	}

	
	//adding things here to see
	color([255/255,0/255,120/255,0.5]){
		//
		
		//
	}
}


module RAILrail(){
	difference() {
				translate([0,RAILx/2+RAILz/2,0]) {rotate([90,0,0]) {
					linear_extrude(height = RAILz/2, scale = 8/10) square([RAILx/2.5,RAILh*10/8], center = true);
				}}
				translate([0,RAILz,RAILh/2+RAILz]) {cube(size=[RAILx,RAILx,RAILz*2],center=true);}
				translate([0,RAILz,-RAILh/2-RAILz]) {cube(size=[RAILx,RAILx,RAILz*2],center=true);}
	}
}




module uLCD220_h() {
		difference() {
			uLCD220_hcube();
			union(){
				translate(uLCD220_tr){rotate([0,90,0]){uLCD220_carving();}}
				// nut holes
				translate([-BASEx+2,0,HLDRz/2+10]) {M3(12.5);}
				translate([-BASEx+2-LCDpost_holedist,0,HLDRz/2+10]) {M3(12.5);}
				translate([-BASEx+2-LCDpost_holedist*2,0,HLDRz/2+10]) {M3(12.5);}
				rotate([-90,0,0]) {
					translate([-BASEx+2,0,HLDRz/2+10]) {M3(13.5);}
					translate([-BASEx+2-LCDpost_holedist,0,HLDRz/2+10]) {M3(13.5);}
					translate([-BASEx+2-LCDpost_holedist*2,0,HLDRz/2+10]) {M3(13.5);}
				}
				//translate([0, 0, HLDRz/2]) {translate([-HLDRx/2,-HLDRy/6,0]){cube(size=[HLDRx*1.1,HLDRy*1.1,HLDRz*1.1], center=true);}}
			}
		}
		color([255/255,0/255,120/255,0.5]){

		}
}


module uLCD220_hcube() {
	translate([-HLDRx/2,-HLDRy/6,0]) {cube(size=[HLDRx,HLDRy,HLDRz], center=true);}
}



module uLCD220() {
	uLCD220_screen_front();
	translate([0,(-(LCDy1+LCDy2/2))+LCDfrontbackdisp,(-(LCDy1+LCDy2/2+LCDz))]) {rotate([-90,0,0]) {uLCD220_screen_back();}}
	translate([0,(-(LCDy1+LCDy2/2))-.5+LCDfrontbackdisp,-LCDz/2]) {cube(size=[LCDx3,LCDz*2.5,LCDz*2],center=true);}
}

module uLCD220_carving() {
	uLCD220_screen_front_carving();
	translate([0,(-(LCDy1+LCDy2/2))+LCDfrontbackdisp,(-(LCDy1+LCDy2/2+LCDz))]) {rotate([-90,0,0]) {uLCD220_screen_back_carving();}}
	translate([0,(-(LCDy1+LCDy2/2))-.5+LCDfrontbackdisp,-LCDz/2]) {cube(size=[LCDx2,LCDz*2.5,LCDz*2],center=true);}
}

module uLCD220_screen_front() {
	difference() {
		union() {
				translate([0,0,0]) {color([0/255, 0/255, 0/255,1]) {cylinder(r=LCDr0, h=LCDz, center=true);}}
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
				translate([0,0,-100]) {color([0/255, 0/255, 0/255,.5]) {cylinder(r=LCDr0, h=LCDz+1+200, center=true);}}
				cylinder(r=LCDr1+crv, h=LCDz, center=true);
				translate([0,-LCDy1/2-LCDy2/2, 0]) {cube(size=[LCDx1f,LCDy1,LCDz], center=true);}
			}
			
		union() {
			translate([0, LCDy3+def/2-1.3+crv, 0]) {cube(size=[LCDx4+10,def,def], center=true);}
			translate([+(LCDx1f/2+def/2)+crv, 0, 0]) {cube(size=[def,LCDy2+10,def], center=true);}
			translate([-(LCDx1f/2+def/2)-crv, 0, 0]) {cube(size=[def,LCDy2+10,def], center=true);}
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
				cylinder(r=LCDr1+crv, h=LCDz, center=true);
				translate([0,-LCDy1/2-LCDy2/2, 0]) {cube(size=[LCDx1,LCDy1,LCDz], center=true);}
			}
			
		union() {
			translate([0, LCDy3+def/2+crv, 0]) {cube(size=[LCDx4,def,def], center=true);}
			translate([+(LCDx1/2+def/2)+crv, 0, 0]) {cube(size=[def,LCDy2,def], center=true);}
			translate([-(LCDx1/2+def/2)-crv, 0, 0]) {cube(size=[def,LCDy2,def], center=true);}
			translate([-LCDx1/2-.5-crv*2, -LCDy1-LCDy2/2-.5, 0]) {
				polyhedron(
					points=[[0,0,-def],[0,LCDy1,-def],[LCDx1-LCDx2,0,-def],[0,0,def],[0,LCDy1,def],[LCDx1-LCDx2,0,def]],
					faces=[[0,2,1],[3,4,5],[0,1,4,3],[0,3,5,2],[5,4,1,2]]);
			}
			translate([LCDx1/2+.5+crv*2, -LCDy1-LCDy2/2-.5, 0]) {
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
					cylinder(r=LCDr1+crv, h=carvingMODz, center=true);
					translate([0,-LCDy1/2-LCDy2/2, 0]) {cube(size=[LCDx1+crv*2,LCDy1+10,carvingMODz], center=true);}
				}
			
			union() {
				translate([0, LCDy3+def/2+crv, 0]) {cube(size=[LCDx4,def,def+carvingMODz], center=true);}
				translate([+(LCDx1/2+def/2)+crv, 0, 0]) {cube(size=[def,LCDy2,def+carvingMODz], center=true);}
				translate([-(LCDx1/2+def/2)-crv, 0, 0]) {cube(size=[def,LCDy2,def+carvingMODz], center=true);}
				translate([-LCDx1/2-.5-crv*2, -LCDy1-LCDy2/2-.5, 0]) {
					polyhedron(
						points=[[0,0,-(def+carvingMODz)],[0,LCDy1,-(def+carvingMODz)],[LCDx1-LCDx2,0,-(def+carvingMODz)],[0,0,(def+carvingMODz)],[0,LCDy1,(def+carvingMODz)],[LCDx1-LCDx2,0,(def+carvingMODz)]],
						faces=[[0,2,1],[3,4,5],[0,1,4,3],[0,3,5,2],[5,4,1,2]]);
				}
				translate([LCDx1/2+.5+crv*2, -LCDy1-LCDy2/2-.5, 0]) {
					polyhedron(
						points=[[0,0,-(def+carvingMODz)],[0,LCDy1,-(def+carvingMODz)],[-(LCDx1-LCDx2),0,-(def+carvingMODz)],[0,0,(def+carvingMODz)],[0,LCDy1,(def+carvingMODz)],[-(LCDx1-LCDx2),0,(def+carvingMODz)]],
						faces=[[0,1,2],[3,5,4],[0,3,4,1],[0,2,5,3],[1,4,5,2]]);
				}
			}
		}
	}
}


use </Users/angueyraaristjm/Documents/3Dprojects/ScrewsAndNuts/ScrewsAndNuts.scad>
