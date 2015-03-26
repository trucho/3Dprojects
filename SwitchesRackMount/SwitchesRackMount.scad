// in inches
pl_x=2.2;
pl_y=1.125;
pl_z=2/8;

pl2_x=4+6/8;
pl2_y=1+1/2;


bnc_r=(0.40+0.01)/2;
sw_r=(0.25+0.02)/2;
rackh_r=(0.187+0.04)/2;

//convert to mm
scale([25.4, 25.4, 25.4]) {
//scale([1,1,1]) {

rotate([90,0,0]){

difference(){
union(){
translate([0,1.5,0])
difference(){
cube([pl_x,pl_y,pl_z]);
translate([1+3/8,0.5,-1]){cylinder(h=2,r=bnc_r,$fn=20);}
}

difference(){
cube([pl2_x,pl2_y,pl_z]);
translate([1.5,1.75,0])
union(){
for(i=[1:3]){translate([i/2-1,-1,-1]){cylinder(h=2, r=sw_r,$fn=20);}}
for(i=[1:3]){translate([i/2-1+2,-1,-1]){cylinder(h=2, r=sw_r,$fn=20);}}
}
}
}

translate([0.33,5/8,0])
union(){
translate([0,0,-1]){cylinder(h=2, r=rackh_r,$fn=20);}
translate([0,6/8,-1]){cylinder(h=2, r=rackh_r,$fn=20);}
translate([0,(2*6)/8,-1]){cylinder(h=2, r=rackh_r,$fn=20);}
}
}

}
}