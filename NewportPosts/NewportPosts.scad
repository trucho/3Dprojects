n_faces=50;
def=10;
df=0;//1.5; //distance factor for visualization purposes
//Post params
Ph1=30;
Ph2=60;
Ph3=90;
Ph4=120;

Prout=19/2;
Prin=8.4/2;

Prtap=5.12/2;
Prtaph=6;
Pbevelh=2.75;
Pbevelr=2.55;

Pscrewh=8;



3Dprintflag=0;

NPost_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
NPost_rot = 3Dprintflag ? [0,0,0] : [0,0,0];

NPost2_tr = 3Dprintflag ? [0,0,0] : [25,0,0];
NPost3_tr = 3Dprintflag ? [0,0,0] : [50,0,0];


MAIN();

module MAIN() {
	// difference() {
	union(){
		translate(NPost_tr){rotate(NPost_rot){NPost(Ph1);}}
		translate(NPost2_tr){rotate(NPost_rot){NPost(Ph1);}}
		// translate(NPost3_tr){rotate(NPost_rot){NPost(Ph3);}}
		// translate(NPost4_tr){rotate(NPost_rot){NPost(Ph4);}}
		// color([255/255,0/255,0/255],.5){translate(uLCD220_tr){rotate(uLCD220_rot){uLCD220();}}}
	
	}
	
	// color([255/255,0/255,120/255,0.5]){translate([0,0,-4.99]) {cube(size=[200,200,10],center=true);}}
	// }
}

module NPost(Ph) {
	translate([0,0,Ph/2]) {
	// NewPortPost
		difference() {
				cylinder(r=Prout,h=Ph,center=true);
				translate([0,0,Prtaph]) {cylinder(r=Prin,h=Ph,center=true);}
				translate([0,0,-Prtaph]) {cylinder(r=Prtap,h=Ph,center=true);}
				translate([30,0,Ph/2-Prtaph]) {rotate([0,90,0]) {M3(25.5);}}
		}
	}	
}


use </Users/angueyraaristjm/Documents/3Dprojects/ScrewsAndNuts/ScrewsAndNuts.scad>
