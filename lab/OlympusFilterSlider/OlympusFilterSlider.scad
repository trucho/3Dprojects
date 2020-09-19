//Olympus Scope Filter Slider
// Created by Juan Angueyra (angueyra@uw.edu)
// March 2016

// Variables
//Slider itself
sx=87.78;
sy=31.85-.4; //original = 31.85
sz=7.44; //original = 7.44
//notch
nx=2;//original = 1.7
ny=0.8;//original = 0.5.
ndelta=25.8+nx/2;
//Filter hole
fhr=28.80/2; //hole on fake holder is 28.80
hr=25.8/2; 
fr=23.5/2; //real filters are 25.4 mm * 1.58 mm (Edmund optics, 1 inch?)
fz=2; 
ffloorz=2;


 // main call
3Dprintflag=1;
osfs_tr = 3Dprintflag ? [0,0,sz/2-0.25/2-0.1] : [0,0,0];
osfs_rot = 3Dprintflag ? [0,0,0] : [0,0,0];

cout_tr = 3Dprintflag ? [0,35,sz/2-.085] : [0,0,0];
cout_rot = 3Dprintflag ? [180,0,0] : [0,0,0];

difference(){
union(){
	color([255/255,255/255,255/255],1){translate(osfs_tr){rotate(osfs_rot){osfs();}}}
	translate(cout_tr){rotate(cout_rot){color([200/255,0/255,0/255],1){cutout2(0.4);}}}
//	translate(osfs_tr){rotate(osfs_rot){filter();}}
}

translate([0,0,-1]) {cube(size=[100,100,2],center=true);}
}
// modules
module osfs() {
	difference() {
		cube(size=[sx,sy,sz-.25],center=true);
		holeNnotch();
		cutout(0);
	}
}

module holeNnotch() {
	union() {
		// outer hole (creates lip, is as big as real filter)
		translate([0,0,ffloorz+.75]) {cylinder(r=hr,h=sz,center=true);}
		//center hole (exposed filter)
		translate([0,0,0]) {cylinder(r=fr,h=sz*2,center=true);}
		// outer notches
		notch();
		mirror([1,0,0]) {notch();}
		mirror([0,1,0]) {notch();}
		mirror([0,1,0]) {mirror([1,0,0]) {notch();}}
		//translate([sx/2-ndelta,-(sy/2-ny/2+.01),0]){cube(size=[nx,ny,sz*2],center=true);}
	}
}

module notch() {
	translate([sx/2-ndelta,(sy/2-ny/2+.01),0]) {cube(size=[nx,ny,sz*2],center=true);} 
}

module cutout(ctol) {
	coutx=sx*3/4-1;
	couty=fhr*2-1;
	coutz=sz-fz-ffloorz-1;
	pegx=8;
	pegz=2;
	
	//trapz_peg
	tpb=couty/2;
	tpt=tpb/2;
	tph=6;
	tpz=coutz;
	
	translate([coutx/2+.4,0,ctol+.1]) {trapezoid(tpb-ctol,tpt-ctol,tph-ctol/2,tpz-ctol);}
	mirror([1,0,0]) {translate([coutx/2+.4,0,ctol+.1]) {trapezoid(tpb-ctol,tpt-ctol,tph-ctol/2,tpz-ctol);}}
	difference() {
		union(){
				translate([0,0,coutz+.1]) {cube(size=[coutx-ctol,couty-ctol,coutz-ctol],center=true);}
				translate([coutx/2-pegx,0,coutz+.3-pegz]) {cube(size=[pegx-ctol,couty-ctol,coutz-ctol],center=true);}
				translate([-(coutx/2-pegx),0,coutz+.3-pegz]) {cube(size=[pegx-ctol,couty-ctol,coutz-ctol],center=true);}
			}
			translate([0,0,0]) {cylinder(r=fr,h=sz*2,center=true);}
			filter();
	}
}

module cutout2(ctol) {
	coutx=sx*3/4-1;
	couty=fhr*2-1;
	coutz=sz-fz-ffloorz-1;
	pegx=8;
	pegz=2;
	
	//trapz_peg
	tpb=couty/2;
	tpt=tpb/2;
	tph=6;
	tpz=coutz;
	
//	translate([coutx/2+.4,0,ctol+.1]){trapezoid(tpb-ctol,tpt-ctol,tph-ctol/2,tpz-ctol);}
//	mirror([1,0,0]){translate([coutx/2+.4,0,ctol+.1]){trapezoid(tpb-ctol,tpt-ctol,tph-ctol/2,tpz-ctol);}}
	difference() {
		union(){
				translate([0,0,coutz+.1]) {cube(size=[coutx-ctol,couty-ctol,coutz-ctol],center=true);}
				translate([coutx/2-pegx,0,coutz+.3-pegz]) {cube(size=[pegx-ctol,couty-ctol,coutz-ctol],center=true);}
				translate([-(coutx/2-pegx),0,coutz+.3-pegz]) {cube(size=[pegx-ctol,couty-ctol,coutz-ctol],center=true);}
			}
			translate([0,0,0]) {cylinder(r=fr,h=sz*2,center=true);}
			filter();
	}
}

module filter() {
	color([0/255,0/255,0/255],1){
		translate([0,0,-sz/2+fz/2+ffloorz+1]) {cylinder(r=25.4/2,h=fz,center=true);}}
}

module trapezoid(width_base, width_top,height,thickness) {
	translate([height/2,-width_base/2,thickness/2]) {rotate([0,0,90]) {
  		linear_extrude(height = thickness) polygon(points=[[0,0],[width_base,0],[width_base-(width_base-width_top)/2,height],[(width_base-width_top)/2,height]], paths=[[0,1,2,3]]);  
	}}
}