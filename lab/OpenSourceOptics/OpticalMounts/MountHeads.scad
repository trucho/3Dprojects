include <../myCAD/standard_screw_holes.scad>;

// Optical mount heads for aluminum vee block optical system
// by S. D. Kovaleski
// 05/15/12

//pinhole_head(6);
led_head();

module stemSetScrew(hgt=25) {
	zdim = 12;
	xdim = 16;
	ydim = hgt;
	difference() {
		cube(size=[xdim, ydim, zdim], center=true);
		rotate([0,90,0])translate([0,3-ydim/2,xdim/2])screwHole(size="6-32",length=xdim,thru=false,cntr=true,$fn=40);
		rotate([90,0,0])translate([0,0,ydim/8])screwHole(size="1/4-20",length=ydim,thru=true,cntr=true,$fn=40);
	}
}

module stemCaptiveNut(hgt=25) {
	zdim = 12;
	xdim = 16;
	ydim = hgt;
	difference() {
		cube(size=[xdim, ydim, zdim], center=true);
		rotate([0,0,90])captureNut(size="1/4-20",length=2*zdim,spin=false,cntr=true);
		rotate([90,0,0])translate([0,0,ydim/4])screwHole(size="1/4-20",length=ydim,thru=true,cntr=true,$fn=40);
	}
}

module pinhole_head(rad=3) { // rad is the aperture radius, covered by pinhole
	height=3; // thickness of head
	width=50; // width of square head
	hs=25; // lenght of stem
	union() {
		translate([0,width/2+hs/2-1,0])
			difference() {
				cube(size=[width, width, height], center=true);
				cylinder(r=rad, h=2*height, center=true,$fn=40);
			}
		translate([0,0,6-height/2])stemCaptiveNut(hgt=hs);
	}
}

module led_head() { 
	rad=2.5; // rad is the aperture radius, match to LED radius
	height=3; // thickness of head
	lh=9; // length of LED barrel
	width=50; // width of square head
	hs=25; // lenght of stem
	union() {
		translate([0,width/2+hs/2-1,0])
			difference() {
				union() {
					cube(size=[width, width, height], center=true);
					translate([0,0,(lh-height)/2])
						cylinder(r=rad+2, h=lh, center=true, $fn=40);
				}
				cylinder(r=rad, h=2*lh, center=true,$fn=40);
			}
		translate([0,0,6-height/2])stemCaptiveNut(hgt=hs);
	}
}

