// SAE thread and through holes
// by S. Kovaleski
// 03/18/12

no_sizes = 10;

SCREW_SIZE = // Some standard screw sizes
[
	"2-56",
	"4-40",
	"6-32",
	"8-32",
	"10-24",
	"10-32",
	"12-24",
	"12-32",
	"1/4-20",
	"5/16-18"
];

THREADED_HOLE_SIZE = // In inches
[
	0.0700,
	0.0890,
	0.1065,
	0.1360,
	0.1495,
	0.1590,
	0.1770,
	0.1850,
	0.2010,
	0.2570
];

THROUGH_HOLE_SIZE = // In inches
[
	0.0960,
	0.1285,
	0.1495,
	0.1770,
	0.2010,
	0.2010,
	0.2280,
	0.2280,
	0.2660,
	0.3320
];

NUT_FLAT_DIAM = // In inches
[
	0.1995,
	0.2660,
	0.3325,
	0.3658,
	0.3990,
	0.3990,
	0.4655,
	0.4655,
	0.4655,
	0.5985
];

NUT_HEIGHT = // In inches
[
	0.0665,
	0.0998,
	0.1164,
	0.1330,
	0.1330,
	0.1330,
	0.1662,
	0.1662,
	0.2328,
	0.2328
];


module screwHole(size = "1/4-20", length, thru=true, cntr=true) {

	hole = THROUGH_HOLE_SIZE[8];
	for (i=[0:1:no_sizes-1]) {
		if (SCREW_SIZE[i] == size) {
			if (thru) {
				cylinder(r=THROUGH_HOLE_SIZE[i]*25.4/2, h=length, center=cntr);
			} else {
				cylinder(r=THREADED_HOLE_SIZE[i]*25.4/2, h=length, center=cntr);
			}
		}
	}	
}

module captureNut(size = "1/4-20", length, spin=false, cntr=true) {

	for (i=[0:1:no_sizes-1]) {
		if (SCREW_SIZE[i] == size) {
			if (spin) {
				cube(size=[NUT_HEIGHT[i]*25.4,NUT_FLAT_DIAM[i]*1.1547*25.4,length],center=cntr);
			} else {
				cube(size=[NUT_HEIGHT[i]*25.4,NUT_FLAT_DIAM[i]*25.4,length],center=cntr);
			}
		}
	}	
}

//difference () {
//	cylinder(r=25.4, h=10);
//	translate([0,0,5])screwHole(size="5/16-18", length=20, cntr=false);
//	translate([10,0,5])captureNut(size="5/16-18", length=20);
//}