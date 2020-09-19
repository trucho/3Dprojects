//Modular Scales?
// Created by Juan Angueyra (angueyra@gmail.com)
// June 2015

// Variables
anchor_r=1;
anchor_h=3;

delta_x=10;
noise_x=0;

delta_y=5;
noise_y=0;

phi_1=-45;
phinoise_1=0;

phi_2=180+phi_1;
phinoise_2=0;


n_faces=12;

// main call
3Dprintflag=0;
scale_tr = 3Dprintflag ? [0,0,0] : [0,0,0];
scale_rot = 3Dprintflag ? [0,0,0] : [0,0,0];
translate(scale_tr){rotate(scale_rot){fscale();}}


module fscale() {
	hull(){
		translate([0,0,0]) {anchor();}
		translate([delta_x+noise_x,0,0]) {anchor();}
		rotate([0,0,phi_1]) {translate([0,(delta_y+noise_y),0]) {anchor();}}
		rotate([0,0,-phi_2]) {translate([0,(delta_y+noise_y),0]) {anchor();}}
	}
}

module anchor(){cylinder(r=anchor_r, h=anchor_h, $fn=n_faces, center=true);}


// (c)2013 Felipe Sanches <juca@members.fsf.org>
// licensed under the terms of the GNU GPL version 3 (or later)

function normalize(v) = v/(sqrt(v[0]*v[0] + v[1]*v[1]));

module voronoi(points, L=200, thickness=1, round=6, nuclei=true){
	for (p=points){
		difference(){
			minkowski(){
			intersection_for(p1=points){
				if (p!=p1){
					translate((p+p1)/2 - normalize(p1-p) * (thickness+round))
					assign(angle=90+atan2(p[1]-p1[1], p[0]-p1[0])){
						rotate([0,0,angle])
						translate([-L,-L])
						square([2*L, L]);
					}
				}
			}
			circle(r=round, $fn=20);
			}
			if (nuclei)
			translate(p) circle(r=1, $fn=20);
		}
	}
}


module random_voronoi(n=20, nuclei=true, L=200, thickness=1, round=6, min=0, max=100, seed=42){

	x = rands(min, max, n, seed);
	y = rands(min, max, n, seed+1);

	for (i=[0:n-1]){
		difference(){
			minkowski(){
			intersection_for(j=[0:n-1]){
				if (i!=j){
					assign(p=[x[i],y[i]], p1=[x[j],y[j]]){
						translate((p+p1)/2 - normalize(p1-p) * (thickness+round))
						assign(angle=90+atan2(p[1]-p1[1], p[0]-p1[0])){
							rotate([0,0,angle])
							translate([-L,-L])
							square([2*L, L]);
						}
					}
				}
			}
			circle(r=round, $fn=20);
			}
			if (nuclei)
			translate([x[i],y[i]]) circle(r=1, $fn=20);
		}
	}
}

// example with an explicit list of points:
// point_set = [[0,0],[30,0],[20,10],[50,20],[15,30],[85,30],[35,30],[12,60], [45,50],[80,80],[20,-40],[-20,20],[-15,10],[-15,50]];
// voronoi(points=point_set, round=4, nuclei=false);


// example with randomly generated set of points
// random_voronoi(n=64, round=6, min=0, max=300);