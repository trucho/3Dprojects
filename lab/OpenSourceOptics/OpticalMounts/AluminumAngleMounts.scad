include <../myCAD/standard_screw_holes.scad>;

// System for turning 1/16"x3/4" aluminum vee into an optical rail
// by S. D. Kovaleski
// 05/06/12

side=19.3; 			// aluminum angle side length
thk=1.75; 			// aluminum angle thickness
buf=6; 				// buffer around the angle
width=sqrt(2)*side;	// width of the angle
spur=sqrt(2)*thk/2;
apex=width/2+spur;	// apex height
height=12;

//v_block_mount_setScrew(75);
//v_block_mount_capNut(); 	// vee to 1/4-20 captured nut, for optical mount
v_block(36); 	// blocks for feet, butt connection, etc.
//v_90_v_block(); 		// 90 degree connector

//channel(height); // this is the channel that accept the AL, for testing
module channel(hgt) {
	translate([0,-width/2+apex/2,0])rotate([0,0,225])difference() {
		cube(size=[side,side,hgt], center=true);
		translate([thk,thk,0])cube(size=[side,side,2*hgt], center=true);
	}
}

module v_block(hgt) {
	difference() {
		cube(size=[width+buf,apex+buf,hgt], center=true);
		channel(2*hgt);
	}
}

module v_90_v_block() {
	union() {
		v_block(width+buf);
		translate([0,apex+buf,0])rotate([0,90,0])v_block(width+buf);
	}
}

module v_block_mount() {
	union() {
		v_block(height);
		translate([0,height+(apex+buf)/2,0])difference() {
			cube(size=[width+buf,2*height,height], center=true);
			rotate([0,0,90])captureNut(size="1/4-20", length=2*height, spin=false, cntr=true);
			rotate([90,0,0])screwHole(size = "1/4-20", length=3*height, thru=true, cntr=true);
		}
	}
}

module v_block_mount_capNut(ls=25) { // ls is stem length
	union() {
		v_block(height);
		translate([0,(apex+buf)/2+ls/2-1,0])rotate([180,0,0])stemCaptiveNut(hgt=ls);
	}
}

module v_block_mount_setScrew(ls=25) { // ls is stem length
	union() {
		v_block(height);
		translate([0,(apex+buf)/2+ls/2-1,0])rotate([180,0,0])stemSetScrew(hgt=ls);
	}
}

module stemSetScrew(hgt=25) {
	zdim = 12;
	xdim = 16;
	ydim = hgt;
	difference() {
		cube(size=[xdim, ydim, zdim], center=true);
		rotate([0,90,0])
			translate([0,3-ydim/2,xdim/2])
				screwHole(size="6-32",length=xdim,thru=false,cntr=true,$fn=40);
		rotate([90,0,0])
			translate([0,0,ydim/8])
				screwHole(size="1/4-20",length=ydim,thru=true,cntr=true,$fn=40);
	}
}

module stemCaptiveNut(hgt=25) {
	zdim = 12;
	xdim = 16;
	ydim = hgt;
	difference() {
		cube(size=[xdim, ydim, zdim], center=true);
		rotate([0,0,90])
			captureNut(size="1/4-20",length=2*zdim,spin=false,cntr=true);
		rotate([90,0,0])
			translate([0,0,ydim/4])
				screwHole(size="1/4-20",length=ydim,thru=true,cntr=true,$fn=40);
	}
}

