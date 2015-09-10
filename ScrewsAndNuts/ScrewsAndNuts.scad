n_faces=12;

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

module headM3() {
	mirror([0,0,1]) {
		union() {
			cylinder(r=5.4/2+.5, h=3.00,$fn=n_faces);
		}
	}
}

module noheadM3() {
	mirror([0,0,1]) {
		union() {
			cylinder(r=1.5+.5, h=27.80,$fn=n_faces);
		}
	}
}

module M3(nutz) {
	mirror([0,0,1]) {
		union() {
			cylinder(r=1.5+.5, h=27.80,$fn=n_faces);
			cylinder(r=5.4/2+.5, h=3.00,$fn=n_faces);
		}
		translate([0, 0, 0+nutz]) {nutM3();}
	}
}

module battery_9V() {
	cube(size=[26, 16.9, 44.7], center=true);
	translate([-6.5, 0, 2]){cylinder(r=8/2, h=48.8, center=true);}
	translate([13-6.5, 0, 2]){cylinder(r=8/2, h=48.8, center=true);}
}

module e_switch(){
	rotate([0, 90, 0]) {cylinder(r=6/2, h=10, center=true);}
	translate([9, 0, 1.5]) {rotate([0, 70, 0]) {cylinder(r=2/2, h=10, center=true);}}
	translate([-8,0,0]) {cube(size=[10,7,15], center=true);}
}

module trapezoid(width_base, width_top,height,thickness) {
  linear_extrude(height = thickness) polygon(points=[[0,0],[width_base,0],[width_base-(width_base-width_top)/2,height],[(width_base-width_top)/2,height]], paths=[[0,1,2,3]]);  
}