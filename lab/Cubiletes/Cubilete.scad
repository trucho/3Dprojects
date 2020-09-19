h=40;
gap=.5;
wall=2;



3Dprintflag=0;
hammer_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
hammer_rot = 3Dprintflag ? [90,0,90] : [0,0,0];

// Hammer big
// translate(hammer_tr){rotate(hammer_rot){hammer(l=12.5);}}
translate(hammer_tr){
	translate([16,0,0]){rotate(hammer_rot){base(l=12.5);}}
}
// Hammer small
// translate([0,12,0]){rotate(hammer_rot){hammer(l=6);}}
translate(hammer_tr){
	translate([16,12,0]){rotate(hammer_rot){base(l=6);}}
}




	

module hammer(l) {
	translate([0,0,h/2+wall]) {
		difference() {
			cube(size=[l,l,h],center=true);
			#translate([l-wall/1.5,0,h*3/8-wall]) {cube(size=[l,l*3/4,wall],center=true);}
			#translate([-l+wall/1.5,0,h*3/8-wall]) {cube(size=[l,l*3/4,wall],center=true);}
		}
		
	}
}
	
module base(l) {
	translate([0,0,h*3/8]) {
		translate([(l/2)+gap,0,h*3/8+wall/4+wall]) {
			cube(size=[wall*3/4,l*3/4-gap,wall-gap],center=true);
		}
		translate([-(l/2)-gap,0,h*3/8+wall/4+wall]) {
			cube(size=[wall*3/4,l*3/4-gap,wall-gap],center=true);
		}
		difference() {
		 	translate([0,0,wall/2]) {cube(size=[l+wall,l,h*3/4+wall],center=true);}
		 	#translate([0,0,wall-.5]) {cube(size=[l+gap,l+wall+gap,h*3/4+gap+gap+.1],center=true);}
		}
	}
}
