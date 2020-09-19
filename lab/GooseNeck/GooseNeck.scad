// boxes.scad required for roundedBox module
//modularHoseRoundNozzle(i4, i8);
//modularHoseSegment(i4);
//modularHoseBasePlate(i4);
//modularHoseDoubleSocket(i4);
//modularHoseFlareNozzle(i4, i1, i16);

s=16;
sh=16*sqrt(3)/2;

//
// for (i=[0:4]) {
// 	for (j=[0:5]) {
// 		scale([1.5, 1.5, 1.5]) {
// 			translate([16*i, 16*j, 0]) {modularHoseSegment(i4);}
// 		}
// 	}
// }
		
for (i=[0]) {
		scale([1.5, 1.5, 1.5]) {
			translate([s*i, 0, 0]) {unit();}
			
			translate([s*i, sh*2, 0]) {unit();}
			
			translate([s*i, sh*4, 0]) {unit();}
			
			translate([s*i+s/2, sh, 0]) {unit();}
			
			translate([s*i+s/2, sh*3, 0]) {unit();q}
		}
		
}

module unit() {
	difference() {
			modularHoseSegment(i4);
			translate([0, 0, 18.7]) {cube(size=[20, 2, 10], center=true);}
	}
}

// for (i=[0:1]) {for (j=[0:1]) {scale([1.5, 1.5, 1.5]) {translate([16*i, 16*j, 0]) {modularHoseSegment(i4);}}}}
//
// translate([-50, 0, 0]) {
// 		for (i=[0:1]) {for (j=[0:1]) {translate([16*i, 16*j, 0]) {modularHoseSegment(i4);}}}
// }
//
// translate([0,50,0]) {
// 		for (i=[0:1]) {for (j=[0:1]) {translate([8*i, 8*j, 0]) {modularHoseSegment(i8);}}}
// }
//
// translate([-30,50,0]) {
// 		for (i=[0:1]) {for (j=[0:1]) {translate([4*i,4*j, 0]) {modularHoseSegment(i16);}}}
// }

include </Users/angueyraaristjm/Documents/3Dprojects/GooseNeck/modularHoseLibrary.scad>
	
