difference() {
	rotate([90,0,0]) {
		import("PCRmagrackV2.stl",convexity=5);
	}
	
	union() {
		translate([-2,-20,0]) {cube(size=[40,50,20],center=true);}
		translate([53.5,-20,15]) {cube(size=[40,50,20],center=true);}
		translate([55.85,-20,0]) {cube(size=[40,50,20],center=true);}
	}
	
}

