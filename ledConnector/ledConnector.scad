//Variables

//general
n_faces=12;

//inner tube
tube_id=32;
tube_h=130;
tube_wall=10;

cap_d=tube_id-tube_wall-1;
// //outer tube
// bigtube_wall=6.05;
// bigtube_h=120;

//RJ connector for ethernet cable
rj_x=14.7;
rj_y=37.3;
rj_z=16.1;
rjtabs_x=9.98;
rjtabs_y=13.1;
rjtabs_z=19.4;

rjtabs_disy=8.55;

rjb_x=18.04;
rjb_y=27.07;
rjb_z=25.52;


ethhole_x=11.45;
ethhole_y=10;
ethhole_z=6.95;

ethhole_x2=4.7;
ethhole_z2=9.8;

ethhole_zdis=5.40;
//leds
led_r=5/2;
led_h=6;
led_rb=5.52/2;
led_sep=.5;

//Main call
// translate([20, 0, -10]) {#M3(20)};

translate([0,0,15-led_h]){#ledArray();}

ledCap();

translate([0, 0, -100]) {rj_connector();}
// translate([0, 0, -100]) {tube();}


//Modules
module ledCap() {
	color([100/255, 100/255, 200/255, .3]) {
		difference() {
			cylinder(r=cap_d, h=30, center=true);
			translate([0,0,15-led_h]){ledArray();}
		}
	}
}


module rj_connector() {
	rotate([90, 180, 0]) {
		difference() {
			union(){
				translate([0, rj_y/2-rjtabs_disy, 0]) {cube(size=[rjtabs_x,rjtabs_y,rjtabs_z], center=true);}
				translate([0, 0, 0]) {cube(size=[rj_x,rj_y,rj_z], center=true);}
				translate([0, -5, 0]) {cube(size=[rjb_x,rjb_y,rjb_z], center=true);}
			
			}
			union(){
				translate([0,  rj_y/2, -rj_z/2+ethhole_z/2+ethhole_zdis]) {cube(size=[ethhole_x,ethhole_y,ethhole_z], center=true);}
				translate([0,  rj_y/2, -rj_z/2+ethhole_z2/2+ethhole_zdis]) {cube(size=[ethhole_x2,ethhole_y,ethhole_z2], center=true);}
			}
		}
	}
	
	
	//translate([0, rj_y, 0]) {cube(size=[rjb_x,rjb_y,rjb_z], center=true);}
}

module ledArray(){
	eq1=led_rb+led_sep;
	eq2=(led_rb*sqrt(3))+led_sep;
	led();
	translate([+eq1,+eq2,0]) {led();}
	translate([-eq1,+eq2,0]) {led();}
	translate([+eq1,-eq2,0]) {led();}
	translate([-eq1,-eq2,0]) {led();}
	translate([+eq1*2,+000,0]) {led();}
}
module led() {
	translate([0, 0, led_h/2-1.5]) {
		union(){
			translate([0, 0, 0]) {cylinder(r=led_r, h=led_h, center=true,$fn=n_faces);}
			translate([0, 0, -led_h/2]) {cylinder(r=led_rb, h=1.5, center=true,$fn=n_faces);}
			translate([0, 0, led_h/2]) {sphere(r=led_r,$fn=n_faces);}
			translate([led_r/2, 0, -17]) {cylinder(r=.2,h=26.92,center=true,$fn=n_faces);}
			translate([-led_r/2, 0, -16]) {cylinder(r=.2,h=23.77,center=true,$fn=n_faces);}	
		}
	}
}
module tube() {
	color([100/255, 100/255, 100/255, .3]) {	
		difference() {
			cylinder(r=tube_id, h=tube_h, center=false,$fn=n_faces);
			translate([0,0,-5]){cylinder(r=tube_id-tube_wall, h=tube_h*1.1, center=false,$fn=n_faces);}

		}
	}
}
//Other .scad files
include </Users/angueyraaristjm/Documents/3DProjects/ScrewsAndNuts/ScrewsAndNuts.scad>