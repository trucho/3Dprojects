// boxes.scad required for roundedBox module
//modularHoseRoundNozzle(i4, i8);
//modularHoseSegment(i4);
//modularHoseBasePlate(i4);
//modularHoseDoubleSocket(i4);
//modularHoseFlareNozzle(i4, i1, i16);

i4 = 25.4/4;
mhBore=i4;
led_r=5/2;


difference() {
 	for (i=[0:2]) {
 	 	for (j=[0:2]) {
 	 		scale([1.5, 1.5, 1.5]) {
 	 			translate([16*i, 16*j, 0]) {
 	//				 #led();
 					difference() {
 						ledBall(i4);
 						translate([0,0,-0.01]) cylinder(h=0.25 * mhBore+0.02,r=led_r, $fn=definition);
 					}
 					
 				}
 	 		}
 	 	}
 	 }
 	
 	union() {
 		translate([0, 22, 14]) {cube(size=[2, 80, 10], center=true);}
 		translate([16*1.5, 22, 14]) {cube(size=[2, 80, 10], center=true);}
		translate([16*3, 22, 14]) {cube(size=[2, 80, 10], center=true);}
 	}
}




module ledBall(mhBore) {
	mhThreadDia=3;
	mhWaistOD = 1.58 * mhBore;
	mhPlateHeight = 0.25 * mhBore;
	mhPlateWidth = mhWaistOD;
	mhScrewOffset=mhWaistOD/2 + mhThreadDia/2;

	union() {
		translate([0,0,1 + mhPlateHeight*2]) modularHoseBall(mhBore);
		translate([0,0,1]) modularHoseWaist(mhBore, mhPlateHeight*2);
		translate([0,0,mhPlateHeight/2]) roundedBox([mhPlateWidth,mhPlateWidth,mhPlateHeight], radius=2*mhThreadDia, sidesonly=true, $fn=definition);
	}
}

module led() {
	led_r=5/2;
	led_h=6;
	led_rb=5.52/2;
	led_sep=.5;
	n_faces=12;
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

include </Users/angueyraaristjm/Documents/3Dprojects/GooseNeck/modularHoseLibrary.scad>
	
