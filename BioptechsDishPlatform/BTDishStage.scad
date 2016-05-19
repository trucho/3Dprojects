rotate([0,0,0]) tilting_stage();




module tilting_stage() {
    difference() {
        cube([70,52,5],center=true);
        translate([0,0,3]) cylinder(h=5,d=35,$fn=50,center=true);
        translate([0,0,12]) cylinder(h=20,d=33,$fn=50,center=true);
        translate([0,0,9]) tabs_notch();
    }
}

module tabs_notch() {
    rotate([0,0,10]) cube([16,45,15],center=true);
    cube([10,45,15],center=true);
}




module tilting_stage_John() {
    difference() {
        union() { 
            cube([70,52,5],center=true);
            rotate([0,90,0]) cylinder(h=80,d=5,$fn=25,center=true);
            translate([0,-25,0]) intersection() {
              %rotate([0,90+10,0]) cylinder(h=30,d=4,$fn=25,center=true);
              cube([25,8,5],center=true);
            }
        }
        translate([0,0,3]) cylinder(h=5,d=35,$fn=50,center=true);
        translate([0,0,0]) cylinder(h=20,d=33,$fn=50,center=true);
        tabs_notch();
    }
    
}
