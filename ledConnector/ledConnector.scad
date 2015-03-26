//Variables
n_faces=12;
led_r=5/2;
led_h=6;
led_rb=5.52/2;
led_sep=.5;

tube_id=32.25;
tube_h=130;
bigtube_wall=6.05;
bigtube_h=120;

//Main call
// translate([20, 0, -10]) {#M3(20)};

ledArray();

#ledCap();

// tube();

//Modules
module ledCap() {
	cylinder(r=tube_id, h=30, center=true);
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
			cylinder(r=tube_id+bigtube_wall, h=bigtube_h, center=false,$fn=n_faces);
			translate([0, 0, -(bigtube_h/20)]) {cylinder(r=tube_id, h=bigtube_h*1.1, center=false,$fn=n_faces);}
		}
	}
}
//Other .scad files
include </Users/angueyraaristjm/Documents/3DProjects/ScrewsAndNuts/ScrewsAndNuts.scad>