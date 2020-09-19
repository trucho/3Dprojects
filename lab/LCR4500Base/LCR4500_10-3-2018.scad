
// color([0.92,0.85,0.85]) translate([50,-6.55,10+4.9]) ti_lcr4500(throw_lens=false);



//translate([0,25.4/2*1,0]) mount_plate();
translate([0,-55,0]) mounting_bracket();
//translate([0,80,0]) rotate([0,0,180]) mounting_bracket();
//translate([40,-3*25.4+16.5,-4.95]) mount_bracket();
//translate([0, 4*25.4-16.5,-4.95]) scale([1,-1,1]) mount_bracket();

//translate([0,0,-50*1]) imperial_breadboard(width=10, length=14);
//hex_cutout();

//mount_end_cutout();
//leg_cutout();


//-----------------modules------------------------------------------------------



module hex_cutout() {
    intersection() {
        translate([15,-61.5,0]) cube([15,20,50],center=true);
        mount_plate();
    }
}


module leg_cutout() {
    intersection() {
        translate([0,0,20]) cube([50,20,20],center=true);
        mounting_bracket();
    }
}


module imperial_breadboard(width=10,length=15) {
    
    color("gray") difference() {
        translate([0,0,-1]) cube([25.4*width,25.4*length,2],center=true);
        
        for(xx = [-width/2.0:1:width/2.0]) {
            for(yy = [-(length/2.0):1:(length/2.0)]) {
                translate([25.4*xx,25.4*yy,0]) cylinder(h=100,d=25.4/4, $fn=10,center=true);
            }
        }
    }
      
}


module mount_plate() {
    difference() {
        union() {
            difference() {
                translate([0,0,-1.5+7]) cube([55,153.5-17,19],center=true);

                //Main LCR cutout
                translate([  0,0,9]) cube([100,122.5+7,20],center=true);
            }
            
            translate([  15, 129.5/2,0]) rotate([0,0,180]) {   
                translate([0, -0.5,0]) scale([1,2.5,1]) hull() {
                    translate([0,0,7]) rotate([-90,0,0]) cylinder(h=1,d=11,$fn=50);
                    translate([-11/2,0,-1]) cube([11,1,2]);
                }
            }
            
            translate([ -15, 129.5/2,0]) rotate([0,0,180]) {   
                translate([0, -0.5,0]) scale([1,2.5,1]) hull() {
                    translate([0,0,7]) rotate([-90,0,0]) cylinder(h=1,d=11,$fn=50);
                    translate([-11/2,0,-1]) cube([11,1,2]);
                }
            }
            
            translate([  15, -129.5/2,0]) rotate([0,0,0]) {   
                translate([0, -0.5,0]) scale([1,2.5,1]) hull() {
                    translate([0,0,7]) rotate([-90,0,0]) cylinder(h=1,d=11,$fn=50);
                    translate([-11/2,0,-1]) cube([11,1,2]);
                }
            }
            
            translate([ -15, -129.5/2,0]) rotate([0,0,0]) {   
                translate([0, -0.5,0]) scale([1,2.5,1]) hull() {
                    translate([0,0,7]) rotate([-90,0,0]) cylinder(h=1,d=11,$fn=50);
                    translate([-11/2,0,-1]) cube([11,1,2]);
                }
            }
            
            
        }
        
        translate([16,-121.5/2+2.5,0]) {
            cylinder(h=20,d=3.5,$fn=50,center=true);
            translate([-6.5,94,0]) cylinder(h=20,d=3.5,$fn=50,center=true);
            translate([-29.5,94,0]) cylinder(h=20,d=3.5,$fn=50,center=true);
        }
        
        
        //Side cutouts for brackets
        translate([  0, 77,0]) cube([48,20,50],center=true);
        translate([  0,-77,0]) cube([48,20,50],center=true);


        //Hex nut slots    
        translate([ 15,57.75+4,7]) rotate([90,30,0]) cylinder(h=8,d=6.5,$fn=6,center=true);
        translate([-15,57.75+4,7]) rotate([90,30,0]) cylinder(h=8,d=6.5,$fn=6,center=true);
        
        translate([ 15,-(57.75+4),7]) rotate([90,30,0]) cylinder(h=8,d=6.5,$fn=6,center=true);
        translate([-15,-(57.75+4),7]) rotate([90,30,0]) cylinder(h=8,d=6.5,$fn=6,center=true);
        
        //Screw through-holes
        translate([ 15,57.75+4,7]) rotate([90,30,0]) cylinder(h=20,d=3.25,$fn=50,center=true);
        translate([-15,57.75+4,7]) rotate([90,30,0]) cylinder(h=20,d=3.25,$fn=50,center=true);
        
        translate([ 15,-(57.75+4),7]) rotate([90,30,0]) cylinder(h=20,d=3.25,$fn=50,center=true);
        translate([-15,-(57.75+4),7]) rotate([90,30,0]) cylinder(h=20,d=3.25,$fn=50,center=true);

    }
}



module mount_bracket() {
    difference() {
        union() {
            hull() {
                translate([ 0,-20,-5]) cylinder(h=40,d=20,$fn=50,center=true);
                translate([-1, -9,-5]) cylinder(h=40,d=18,$fn=50,center=true);
            }
            hull() {
                translate([-1, -9,-5]) cylinder(h=40,d=18,$fn=50,center=true);
                translate([-5, 14,-5]) cylinder(h=40,d=10,$fn=50,center=true);
            }
            hull() {
                translate([-5, 14,-5]) cylinder(h=40,d=10,$fn=50,center=true);
                translate([-5, 25,-5]) cylinder(h=40,d=10,$fn=50,center=true);
            }
        }
        
//        translate([-0.15,-5,2.675]) cube([15,25,4],center=true);
        translate([-0.15-1,-5,2.675]) rotate([90,0,0]) hull() {
            translate([ 4,0,0]) cylinder(h=25,d=4,$fn=50,center=true);
            translate([-4,0,0]) cylinder(h=25,d=4,$fn=50,center=true);
        }
        
        
        translate([0,-17.5,18+5]) cube([30,25,50],center=true);
        translate([0,-30,-7.5+5]) scale([1,1,0.8]) rotate([0,90,0]) cylinder(h=40,d=50,$fn=100,center=true);
        
        translate([0,0,6]) {
            translate([0,12.5,-25]) cube([30,25,50],center=true);
            translate([0,20.5,-15-5.625]) cube([30,25,50],center=true);
            translate([0,8,0]) scale([1,1,0.55]) rotate([0,90,0]) cylinder(h=40,d=16,$fn=50,center=true);
        }
        
        translate([-4,7.75-1.5,0]) cylinder(h=40,d=5,$fn=50,center=true);
        translate([-4,7.75-1.5,17]) cylinder(h=10,d=7.5,$fn=50,center=true);
        
        hull() {
            translate([0,-12,-7.5]) cylinder(h=30,d=10,$fn=50,center=true);
            translate([0,-21,-7.5]) cylinder(h=30,d=10,$fn=50,center=true);
        }
        
        translate([0,-12,-18]) hull() {
            cylinder(h=30,d=1.25*25.4/4 - 0.75,$fn=50,center=true);
            translate([0,-9,0]) cylinder(h=30,d=1.25*25.4/4 - 0.75,$fn=50,center=true);
        }

    }
}




module mounting_bracket() {
    difference() {
        hull() {
            translate([0,0,-10]) cube([47.5,5,60],center=true);
            translate([0,-24,-10]) cylinder(h=60,d=47.5,center=true,$fn=50);
        }
        
        translate([0,2.25,5]) cube([55,5,40],center=true);
        
        translate([ 15,2,4]) hull() {
            translate([0,0,-11]) rotate([90,0,0]) cylinder(h=15,d=3.25,$fn=50);
            translate([0,0, 11]) rotate([90,0,0]) cylinder(h=15,d=3.25,$fn=50);
        }
        
        translate([-15,2,4]) hull() {
            translate([0,0,-11]) rotate([90,0,0]) cylinder(h=10,d=3.25,$fn=50);
            translate([0,0, 11]) rotate([90,0,0]) cylinder(h=10,d=3.25,$fn=50);
        }
        
        translate([0,-25,-34.5]) hull() {
            translate([ 15, 17.5,0]) rotate([0,0,0]) cylinder(h=24,d=10,$fn=50);
            translate([-15, 17.5,0]) rotate([0,0,0]) cylinder(h=24,d=10,$fn=50);
            translate([ 0,1,0]) rotate([0,0,0]) cylinder(h=24,d=40,$fn=50);
            
        }
        
        translate([0,-25,-45]) hull() {
            translate([0, 18,0]) rotate([0,0,0]) cylinder(h=20,d=7,$fn=50);
            translate([0,-15,0]) rotate([0,0,0]) cylinder(h=20,d=7,$fn=50);
        }
        
        translate([12.7,-25,-45]) hull() {
            translate([0, 18,0]) rotate([0,0,0]) cylinder(h=20,d=7,$fn=50);
            translate([0,-9,0]) rotate([0,0,0]) cylinder(h=20,d=7,$fn=50);
        }
        
        translate([-12.7,-25,-45]) hull() {
            translate([0, 18,0]) rotate([0,0,0]) cylinder(h=20,d=7,$fn=50);
            translate([0,-9,0]) rotate([0,0,0]) cylinder(h=20,d=7,$fn=50);
        }
        
        hull() {
            translate([0,-26,-11]) rotate([0,90,0]) cylinder(h=60,d=47,$fn=150,center=true);
            translate([0,-26,50]) rotate([0,90,0]) cylinder(h=60,d=47,$fn=150,center=true);
            translate([0,-56,-11]) rotate([0,90,0]) cylinder(h=60,d=47,$fn=150,center=true);
        }
    }
}




module ti_lcr4500(throw_lens=true) {
    
    translate([-67,20,-5-23.5/2+2]) {
        color("gold") {
            translate([-34,-59,2]) cylinder(h=36,d=6,$fn=6);
            translate([-34, 18,2]) cylinder(h=36,d=6,$fn=6);
            
            translate([34,-59,2]) cylinder(h=36,d=6,$fn=6);
            translate([34, 34,2]) cylinder(h=36,d=6,$fn=6);
        }
        
        
        color("green") translate([0,-1,35]) cube([77,122,2],center=true);
        
        color([0.2,0.2,0.2]) {
            translate([0,10,12]) cube([77,90,24],center=true);
            translate([14,12.5+15-1.5,12]) cube([105,70,24],center=true);
            translate([14,-1.75,2.5]) cube([105,121.5,5],center=true);
        }

        if(throw_lens) {
            color([0.2,0.2,0.2]) {
                translate([20,-20,23.5/2+5]) rotate([0,90,0]) cylinder(h=50,d=23.5,$fn=50);
            }
            color([1,1,1]) {
                translate([20.25,-20,23.5/2+5]) rotate([0,90,0]) cylinder(h=50,d=20,$fn=50);
            }
        } else {
            color([1,1,1]) {
                
                translate([18+20.25,-20,23.5/2+5-2]) cube([2,4/3*12,12],center=true);
            }
        }
    }
}