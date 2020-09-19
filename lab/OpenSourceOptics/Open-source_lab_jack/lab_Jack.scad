/*******************
Coded By:
Nick Anzalone, June & August 2012
Thingiverse Account: Acarius10
********************/

//Misc Variables
screw_d=3; //Screw Diameter
screw_hd_d=6; //Screw Head Diameter
screw_n_d=6; //Screw Nut Diameter
screw_n_t=6; //Screw Nut Thickness
t_rod_d=4; //Threaded rod Diameter
t_rod_n_d=7; //Threaded Rod Nut Diameter
t_rod_n_t=3; //Threaded Rod Nut Thickness
x=6; //Tube Outer Diameter for Central BArs

//Platform Variables
platform_l=150; //Platform Length 
platform_w= 100; //Platform Width
platform_h= 18;  //platform Height
platform_wt=8; //Platform Wall Thickness
platform_t=5;//Platform Thickness

//Scissor Variables
scissor_l =130;// Scissor Length
scissor_w=15; //Scissor Width
scissor_t=3;  //Scissor Thickness

//Bearing Dimensions
608_h=5; //608 Bearing height
608_od=13; //608 Bearing Outer Diameter
624_h=5;   //624 Bearing height
624_d=13; //624 bearing Diameter


central_bars();
platform_final();
hand_crank();
scissor();
bar_holder();
//*******************Modules******************//
module central_bars(){
translate([50,0,0])central_bar_f();
central_bar_r();
}
module top_platform(){
difference(){
platform();
cube([platform_l-20,platform_w-20,platform_h+10], center = true);
}
}


module nut_clamp(){
difference(){
cylinder(t_rod_n_t+4,(t_rod_n_d+8)/2,(t_rod_n_d+8)/2);
translate([0,0,3])hexagon(t_rod_n_t+1,(t_rod_n_d+4)/2);
cylinder(t_rod_n_t+4,(t_rod_d+1)/2,(t_rod_d+1)/2);
}
translate([(t_rod_n_d+8)/2+1,0,(t_rod_n_t+4)/2])cube([4,3,t_rod_n_t+4],center = true);
}

//******************
module nut_clamp_cap(){
difference(){
translate([0,0,0])cylinder(t_rod_n_t+7,(t_rod_n_d+15)/2,(t_rod_n_d+15)/2);
translate([0,0,3])cylinder(t_rod_n_t+4,(t_rod_n_d+9)/2,(t_rod_n_d+9)/2);
translate([0,0,0])cylinder(t_rod_n_t+4,(t_rod_d+1)/2,(t_rod_d+1)/2);
translate([(t_rod_n_d+15)/2+1,0,(t_rod_n_t+7)/2+1.5])cube([10,3,t_rod_n_t+4],center = true);
}
}

//******************
module central_bar_f(){
difference(){
translate([0,(platform_w-scissor_t)/2,(screw_n_d+5)/2])rotate([90,0,0])cylinder((platform_w)-(scissor_t),(screw_n_d+5)/2,(screw_n_d+5)/2);
//cylinder(t_rod_n_t+7,(t_rod_n_d+15)/2,(t_rod_n_d+15)/2);
translate([0,(platform_w-scissor_t)/2,(screw_n_d+5)/2])rotate([90,0,0])cylinder((platform_w)-(scissor_t),(screw_d+1)/2,(screw_d+1)/2);
translate([0,((platform_w-scissor_t)/2)-7,(screw_n_d+5)/2])rotate([0,0,90])screw_nuttrap();
translate([0,((platform_w-scissor_t)/-2)+7,(screw_n_d+5)/2])rotate([0,0,90])screw_nuttrap();
#translate([0,((platform_w)-(scissor_t))/4,0])cylinder(t_rod_n_t+5,(t_rod_n_d+8)/2,(t_rod_n_d+8)/2);
#translate([0,((platform_w)-(scissor_t))/-4,0])cylinder(t_rod_n_t+5,(t_rod_n_d+8)/2,(t_rod_n_d+8)/2);
cylinder(t_rod_n_t+200,(t_rod_d+1)/2,(t_rod_d+1)/2);
translate([0,((platform_w)-(scissor_t))/4,0])cylinder(t_rod_n_t+200,(t_rod_d+1)/2,(t_rod_d+1)/2);
translate([0,((platform_w)-(scissor_t))/-4,0])cylinder(t_rod_n_t+200,(t_rod_d+1)/2,(t_rod_d+1)/2);
}
difference(){
translate([0,0,(screw_n_d+5)/4])cube([screw_n_d+5,(platform_w)-(scissor_t),(screw_n_d+5)/2], center = true);
//cylinder(t_rod_n_t+7,(t_rod_n_d+15)/2,(t_rod_n_d+15)/2);
translate([0,(platform_w-scissor_t)/2+3,(screw_n_d+5)/2])rotate([90,0,0])cylinder((platform_w)*2,(screw_d+1)/2,(screw_d+1)/2);
translate([0,((platform_w-scissor_t)/2)-7,(screw_n_d+5)/2])rotate([0,0,90])screw_nuttrap();
translate([0,((platform_w-scissor_t)/-2)+7,(screw_n_d+5)/2])rotate([0,0,90])screw_nuttrap();
cylinder(t_rod_n_t+200,(t_rod_d+1)/2,(t_rod_d+1)/2);
#translate([0,((platform_w)-(scissor_t))/4,0])cylinder(t_rod_n_t+5,(t_rod_n_d+8)/2,(t_rod_n_d+8)/2);
#translate([0,((platform_w)-(scissor_t))/-4,0])cylinder(t_rod_n_t+5,(t_rod_n_d+8)/2,(t_rod_n_d+8)/2);
}


translate([0,((platform_w)-(scissor_t))/4,0])threaded_bar_nut_holder();
translate([0,((platform_w)-(scissor_t))/-4,0])threaded_bar_nut_holder();
}
module threaded_bar_nut_holder(){
difference(){
cylinder(t_rod_n_t+5,(t_rod_n_d+8)/2,(t_rod_n_d+8)/2);
translate([0,0,t_rod_n_t+4])cylinder(t_rod_n_t,(t_rod_d+1)/2,(t_rod_d+1)/2);
cylinder(t_rod_n_t,(t_rod_d+1)/2,(t_rod_d+1)/2);
translate([0,0,(t_rod_n_t+2)/4])t_rod_nut_trap();
#translate([(t_rod_n_d+3.5)/2,(t_rod_n_d)/-2,t_rod_n_t+1])cube([100,t_rod_n_d,t_rod_n_t+1]);
}
}
//*****************
module central_bar_r(){
difference(){
translate([0,(platform_w-scissor_t)/2,(screw_n_d+5)/2])rotate([90,0,0])cylinder((platform_w)-(scissor_t),(screw_n_d+5)/2,(screw_n_d+5)/2);
translate([0,(platform_w-scissor_t)/2,(screw_n_d+5)/2])rotate([90,0,0])cylinder((platform_w)-(scissor_t),(screw_d+1)/2,(screw_d+1)/2);
translate([0,((platform_w)-(scissor_t))/-4,0])cylinder(608_h+6,(x+.5)/2,(x+.5)/2);
translate([0,((platform_w)-(scissor_t))/4,0])cylinder(608_h+6,(x+.5)/2,(x+.5)/2);
cylinder(608_h+6,(6)/2,(6)/2);
#translate([0,((platform_w-scissor_t)/2)-7,(screw_n_d+5)/2])rotate([0,0,90])screw_nuttrap();
#translate([0,((platform_w-scissor_t)/-2)+7,(screw_n_d+5)/2])rotate([0,0,90])screw_nuttrap();
cylinder(608_h,(t_rod_d+1)/2,(t_rod_d+1)/2);
cylinder(t_rod_n_t+200,(t_rod_d+1)/2,(t_rod_d+1)/2);
}
difference(){
translate([0,0,(screw_n_d+5)/4])cube([screw_n_d+5,(platform_w)-(scissor_t),(screw_n_d+5)/2], center = true);
translate([0,(platform_w-scissor_t)/2+3,(screw_n_d+5)/2])rotate([90,0,0])cylinder((platform_w)*2,(screw_d+1)/2,(screw_d+1)/2);
translate([0,((platform_w)-(scissor_t))/4,0])cylinder(608_h+6,(x+.5)/2,(x+.5)/2);
translate([0,((platform_w)-(scissor_t))/-4,0])cylinder(608_h+6,(x+.5)/2,(x+.5)/2);
cylinder(608_h+6,(6)/2,(6)/2);
#translate([0,((platform_w-scissor_t)/2)-7,(screw_n_d+5)/2])rotate([0,0,90])screw_nuttrap();
#translate([0,((platform_w-scissor_t)/-2)+7,(screw_n_d+5)/2])rotate([0,0,90])screw_nuttrap();
cylinder(t_rod_n_t+200,(t_rod_d+1)/2,(t_rod_d+1)/2);
}
//translate([0,((platform_w)-(scissor_t))/4,0])bearing_holder();
//translate([0,((platform_w)-(scissor_t))/-4,0])bearing_holder();
//bearing_holder();
}

//****************
module scissor(){
difference(){
	hull(){
		cylinder(scissor_t,scissor_w/2,scissor_w/2);
		translate([scissor_l-(scissor_w),0,0])cylinder(scissor_t,scissor_w/2,scissor_w/2);
	}
translate([-3,0,0])cylinder(scissor_t,(screw_d+1)/2,(screw_d+1)/2);
translate([scissor_l-(scissor_w)/1.25,0,0])cylinder(scissor_t,(screw_d+1)/2,(screw_d+1)/2);
translate([(scissor_l-(scissor_w))/2,0,0])cylinder(scissor_t,(screw_d+1)/2,(screw_d+1)/2);
}
}
//***************
module platform(){
difference(){
translate([0,0,platform_h/2])cube([platform_l,platform_w,platform_h], center = true);
translate([0,0,((platform_h+10)/2)+(platform_t)])cube([platform_l+10,platform_w-(platform_wt*2),platform_h+10], center = true);
translate([(platform_l-20)/2,platform_w/2+5,platform_h/2])rotate([90,0,0])cylinder(platform_w+10,(screw_d+1)/2,(screw_d+1)/2);
translate([(platform_l-20)/-2,platform_w/2+5,platform_h/2])screw_slot((platform_l-60));
translate([(platform_l-20)/-2,platform_w/2+2.5,platform_h/2])bearing_slot((platform_l-60));
translate([0,0,platform_h/2])cube([platform_l-20,platform_w-30,platform_h], center = true);
}
}

//****************
module screw_slot(length){
difference(){
hull() {
translate([0,0,0])rotate([90,0,0])cylinder(platform_w+10,(screw_d+1)/2,(screw_d+1)/2);
translate([length,0,0])rotate([90,0,0])cylinder(platform_w+10,(screw_d+1)/2,(screw_d+1)/2);
 }

//translate([5,0,10/-2])rotate([0,0,-90])cube([platform_w+10,2,10]);
//translate([5+length,0,10/-2])rotate([0,0,-90])cube([platform_w+10,2,10]);
}
}

//*****************
module bearing_slot(length){
difference(){
hull() {
translate([0,0,0])rotate([90,0,0])cylinder(platform_w+5,(624_d+1)/2,(624_d+1)/2);
translate([length,0,0])rotate([90,0,0])cylinder(platform_w+5,(624_d+1)/2,(624_d+1)/2);
 }

//#translate([5,0,10/-2])rotate([0,0,-90])cube([platform_w+10,2,10]);
//translate([5+length,0,10/-2])rotate([0,0,-90])cube([platform_w+10,2,10]);
translate([624_d/-1.8,-(platform_w+2.5)+(platform_wt/2),(624_d+1)/-2])cube([platform_l,(platform_w-platform_wt),100]);
}
}

//*****************
module Lab_jack_part_comp(){
translate([(scissor_l/-2)-(scissor_w/-2)+29,platform_w/2-platform_wt,platform_h/2])rotate([90,-45,0])scissor();
translate([(scissor_l/-2)-(scissor_w/-2)+29,platform_w/2-platform_wt-scissor_t,platform_h+scissor_l/2+24])rotate([90,45,0])scissor();
translate([(scissor_l/-2)-(scissor_w/-2)+29,platform_w/-2+platform_wt+scissor_t*2,platform_h/2])rotate([90,-45,0])scissor();
translate([(scissor_l/-2)-(scissor_w/-2)+29,platform_w/-2+platform_wt+scissor_t,platform_h+scissor_l/2+24])rotate([90,45,0])scissor();
platform();
translate([0,0,scissor_l-28])rotate([0,180,0])platform();
}

//******************
module bearing_holder(){
difference(){
cylinder(608_h+7,(608_od+7)/2,(608_od+7)/2);
translate([0,0,3])rotate([00,0,0])cylinder(608_h+1,(608_od+1)/2,(608_od+1)/2);
translate([(608_od+17.5)/2,0,((608_h+1)/2)+3])cube([608_od+20,608_od+1,608_h+1], center = true);
#translate([(608_od+(17*2))/2,0,((608_h+3)/2)+6])cube([608_od+20,608_od+7,608_h+3], center = true);
cylinder(608_h,(t_rod_n_d+3)/2,(t_rod_n_d+3)/2);
translate([0,0,608_h+5])cylinder(608_h,(t_rod_n_d+3)/2,(t_rod_n_d+3)/2);
translate([(t_rod_n_d+100)/2,0,(608_h+3.25)*2])cube([t_rod_n_d+100,t_rod_n_d+3,(608_h+8)], center = true);
translate([(t_rod_n_d+100)/2,0,0])cube([t_rod_n_d+100,t_rod_n_d+3,(608_h+8)], center = true);
}
}


//*******************
module screw_nuttrap(){
translate([0,0,screw_n_d])cube([screw_n_t+1,screw_n_d+5,screw_n_d*2], center = true);
translate([(screw_n_t+1)/-2,0,0])rotate([0,90,0])hexagon(screw_n_t+1,(screw_n_d+2)/2);
}

//********************
module reg_polygon(sides,radius)
{
  function dia(r) = sqrt(pow(r*2,2)/2);  //sqrt((r*2^2)/2) if only we had an exponention op
  if(sides<2) square([radius,0]);
  if(sides==3) triangle(radius);
  if(sides==4) square([dia(radius),dia(radius)],center=true);
  if(sides>4) circle(r=radius,$fn=sides);
}

module hexagonf(radius)
{
  reg_polygon(6,radius);
}

module hexagon(height,radius) 
{
  linear_extrude(height=height) hexagonf(radius);
}

//*************************
//Hand Crank Code:
module hand_crank(){

translate([0,-20,0]){
difference(){
translate([0,0,10])sphere((screw_hd_d+7)/2);
cylinder(100,(screw_hd_d+1)/2,(screw_hd_d+1)/2);
translate([0,0,5]){
rotate_extrude(convexity = 10, $fn = 100)
translate([(screw_hd_d+9)/2, 0, 0])
circle(r = 2.5, $fn = 100);
}
}



difference(){
cylinder(10,(screw_hd_d+7)/2,(screw_hd_d+7)/2);
cylinder(100,(screw_d+1)/2,(screw_d+1)/2);
translate([0,0,5])cylinder(100,(screw_hd_d+1)/2,(screw_hd_d+1)/2);
translate([0,0,5]){
rotate_extrude(convexity = 10, $fn = 100)
translate([(screw_hd_d+9)/2, 0, 0])
circle(r = 2.5, $fn = 100);
}
}
}

//Arm:
translate([0,20,0]){
difference(){
translate([0,0,7.5/2])cube([50,t_rod_d+7,7.5],center = true);
translate([0,(t_rod_d+15.5)/2,7.5/2])rotate([0,0,1])cube([150,t_rod_d+7,7.5],center = true);
translate([-5,(t_rod_d+14.5)/-2,7.5/2])rotate([0,0,-1])cube([150,t_rod_d+7,7.5],center = true);
#translate([0,0,(7.5+2)/2])cube([28,3,7.5-2],center = true);
translate([50-7.5,0,(7.5)/2])cube([50,t_rod_d-4,7.5],center = true);
translate([50/2-(7.5/2),t_rod_d+5,(7.5)/2])rotate([90,0,0])cylinder(t_rod_d+20,(screw_d+1)/2,(screw_d+1)/2);
translate([50/-2+5,0,0])cylinder(t_rod_d+20,(screw_d+1)/2,(screw_d+1)/2);
#translate([21.5,4.5,0])cube([10,5,100],center = true);
#translate([21.5,-4.5,0])cube([10,5,100],center = true);
}
}

//Bar Clamp
difference(){
cylinder(15,(t_rod_n_d+8)/2,(t_rod_n_d+8)/2);
cylinder(5,(t_rod_d+1)/2,(t_rod_d+1)/2);
translate([0,0,t_rod_n_t+4])cylinder(5,(t_rod_d+1)/2,(t_rod_d+1)/2);
translate([0,0,13])cube([(t_rod_d+7),(t_rod_d+1),10],center = true);
translate([(screw_d+7),0,11.5])cube([(t_rod_d+7),(t_rod_d+11),7],center = true);
translate([(-screw_d-7),0,11.5])cube([(t_rod_d+7),(t_rod_d+11),7],center = true);
translate([0,0,2.5])t_rod_nut_trap();
#translate([(t_rod_n_d+16)/4,(t_rod_n_d+4)/-2,0])cube([100,t_rod_n_d+5,15]);
	difference(){
	translate([0,0,22/2])cube([(t_rod_n_d+8),(t_rod_d+206),22],center = true);
	translate([0,0,22/2])cube([(t_rod_n_d+8),(t_rod_n_d+6),22],center = true);

}
translate([0,(t_rod_d+20)/2,15])rotate([90,0,0])cylinder(t_rod_d+20,(screw_d+1)/2,(screw_d+1)/2);

}
difference(){
#translate([0,(t_rod_d+9)/2,15])rotate([90,0,0])cylinder(4,(screw_d+6)/2,(screw_d+6)/2);
translate([0,(t_rod_d+20)/2,15])rotate([90,0,0])cylinder(t_rod_d+20,(screw_d+1)/2,(screw_d+1)/2);
}
difference(){
translate([0,(t_rod_d+1)/-2,15])rotate([90,0,0])cylinder(4,(screw_d+6)/2,(screw_d+6)/2);
translate([0,(t_rod_d+20)/2,15])rotate([90,0,0])cylinder(t_rod_d+20,(screw_d+1)/2,(screw_d+1)/2);
}
}


//********************
//Nut trap for Threaded Rod
module t_rod_nut_trap(){
hexagon(t_rod_n_t+1,(t_rod_n_d+2)/2);
translate([0,(t_rod_n_d+1)/-2,0])cube([100,t_rod_n_d+1,t_rod_n_t+1]);
}


//**********************
module platform_final(){
difference(){
platform();
translate([-7,0,(platform_h)])cube([platform_l-7,platform_w+10,platform_h],center = true);
translate([(platform_l/2)-((screw_n_d+3)/2),0,0])hexagon(screw_n_t+1,(screw_n_d+1)/2);
translate([-(platform_l/2)+((screw_n_d+3)/2),0,0])hexagon(screw_n_t+1,(screw_n_d+1)/2);
}
difference(){
translate([(platform_l/2)-((screw_n_d+3)/2),0,(platform_h/2)-2.5])cube([screw_n_d+3,screw_n_d+3,5], center = true);
translate([(platform_l/2)-((screw_n_d+3)/2),0,0])hexagon(screw_n_t+1,(screw_n_d+1)/2);
translate([(platform_l/2)-((screw_n_d+3)/2),0,0])cylinder(20,(screw_d+1)/2,(screw_d+1)/2);
translate([(platform_l-20)/-2,platform_w/2+5,platform_h/2])screw_slot((platform_l-60));
}
difference(){
translate([-(platform_l/2)+((screw_n_d+3)/2),0,(platform_h/2)-2.5])cube([screw_n_d+3,screw_n_d+3,5], center = true);
translate([-(platform_l/2)+((screw_n_d+3)/2),0,0])hexagon(screw_n_t+1,(screw_n_d+1)/2);
translate([-(platform_l/2)+((screw_n_d+3)/2),0,0])cylinder(20,(screw_d+1)/2,(screw_d+1)/2);
translate([(platform_l-20)/-2,platform_w/2+5,platform_h/2])screw_slot((platform_l-60));
}
difference(){
translate([(platform_l-20)/2,platform_w/2,platform_h/2])rotate([90,0,0])cylinder(platform_w,(screw_d+14)/2,(screw_d+14)/2);
translate([(platform_l-20)/2,platform_w/2+5,platform_h/2])rotate([90,0,0])cylinder(platform_w+10,(screw_d+1)/2,(screw_d+1)/2);
translate([0,0,((platform_h+10)/2)+(platform_t)])cube([platform_l+10,platform_w-(platform_wt*2),platform_h+10], center = true);
translate([0,0,platform_h/2])cube([platform_l-20,platform_w-30,platform_h], center = true);
#translate([(platform_l/2)-((screw_n_d+3)/2),0,0])hexagon(screw_n_t+1,(screw_n_d+1)/2);
}
}



//**************************
module bar_holder(){
difference(){
translate([0,0,(16-(platform_t+5))/2])cube([platform_l,screw_n_d+3 , 16-(platform_t+5)], center = true);
translate([(platform_l-20)/-2,platform_w/2+5,screw_d+2])screw_slot((platform_l-60));
translate([(platform_l/2)-((screw_n_d+3)/2),0,0])cylinder(20,(screw_d+1)/2,(screw_d+1)/2);
translate([-(platform_l/2)+((screw_n_d+3)/2),0,0])cylinder(20,(screw_d+1)/2,(screw_d+1)/2);
}
}
