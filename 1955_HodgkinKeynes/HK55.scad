//Tron-Trout
// Created by Juan Angueyra (angueyra@gmail.com
// May 2015

// Variables
bl=10;
wall=bl/6;
// main call

difference() {
	boxes();
	cutout();
	
}

module boxes() {
	translate([bl/2,0,0]) {box(bl);}
	translate([-bl/2,0,0]) {box(bl);}
}



module box(sidelength) {
		cube(size=sidelength,center=true);
}

module cutout() {
	translate([bl/2,0,wall]) {box(bl-wall);}
	translate([-bl/2,0,wall]) {box(bl-wall);}
	// translate([0,0,wall]) {box(bl-wall);}s
}
