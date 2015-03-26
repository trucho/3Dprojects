//n_faces=12;

module screwM3() {
	mirror([0,0,1]) {
		union() {
			cylinder(r=1.5+.5, h=27.80,$fn=n_faces);
			cylinder(r=5.4/2+.5, h=3.00,$fn=n_faces);
		}
	}
}
module nutM3() {
	//nut_h=3; //Real
	nut_h=5; //Making Hole deeper
	translate([0, 0, -nut_h]) {
		cylinder(r=5.45/2+1, h=nut_h,$fn=6);
	}	
}
	
module M3(nutz) {
	mirror([0,0,1]) {
		union() {
			cylinder(r=1.5+.5, h=27.80,$fn=n_faces);
			cylinder(r=5.4/2+.5, h=3.00,$fn=n_faces);
		}
		translate([0, 0, nutz]) {nutM3();}
	}
}