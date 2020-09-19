rim=1;

difference() {
	import(file="cross-tweezer-tough.stl");
	union() {
		translate([-2, 0, 0]) {cylinder(r=rERG-rim, h=10,center=true);}
		translate([-2, 5, 0]) {cylinder(r=rERG-rim, h=10,center=true);}
	}
}



rERG=16/2; //in mm
translate([-2, 0, 0]) {
difference() {
	difference() {
		cylinder(r=rERG, h=3);
		cylinder(r=rERG-rim, h=10,center=true);
	}
	translate([-15, 0, -5]) {
		cube(size=[30, 30, 10]);}
}
}

translate([-2.5, 4.6, 0]) {
difference() {
	difference() {
		cylinder(r=rERG, h=3);
		cylinder(r=rERG-rim, h=10,center=true);
	}
	translate([-15, 0, -5]) {
		cube(size=[30, 30, 10]);}
}
}

rimERG()

function rimERG(rim) {
	difference() {
		difference() {
			cylinder(r=rERG, h=3);
			cylinder(r=rERG-rim, h=10,center=true);
		}
		translate([-15, 0, -5]) {
			cube(size=[30, 30, 10]);}
	}
}