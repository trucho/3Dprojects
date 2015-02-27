// boxes.scad required for roundedBox module
include </Users/angueyraaristjm/Documents/LiLab/3DPrinting/GooseNeck/Parametric_Modular_Hose_Library_v02/modularHoseLibrary.scad>
//modularHoseRoundNozzle(i4, i8);
//modularHoseSegment(i4);
//modularHoseBasePlate(i4);
//modularHoseDoubleSocket(i4);
//modularHoseFlareNozzle(i4, i1, i16);


for (i=[0:4]) {
	for (j=[0:4]) {
		scale([1.5, 1.5, 1.5]) {
			translate([16*i, 16*j, 0]) {modularHoseSegment(i4);}
		}
	}
}

	
	
