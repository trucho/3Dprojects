screw_d=3;
screw_n_d=6;
screw_n_t=3;
rod_d=8;
openrail_lw=15;

translate([0,0,(rod_d+10)/2])optics_rail();

module optics_rail(){
difference(){
translate([(openrail_lw+5)/2,-5.5,0])cube([(rod_d+11)+(openrail_lw+1),(screw_n_t+7)+(openrail_lw+1),rod_d+11],center = true);
openrail_model();
translate([0,((openrail_lw+1)/-2)-screw_n_t+1,0])rotate([0,0,00])nuttrap();
rotate([90,0,0])cylinder(100,(screw_d+1)/2,(screw_d+1)/2);
#translate([((openrail_lw+1)/2)+((rod_d+1)),0,0])rotate([90,0,0])cylinder(30,(rod_d+1)/2,(rod_d+1)/2);
}
}


module openrail_model(){
difference(){
cube([openrail_lw, openrail_lw, rod_d+11], center = true);
translate([5,0,0])cube([5,screw_d,rod_d+12], center = true);
}
}


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
module nuttrap(){
translate([0, screw_n_t/-1,10])cube([screw_n_d,screw_n_t*2,20],center =true);
rotate([90,0,0])hexagon(screw_n_d,screw_n_t);
}