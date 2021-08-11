//Excellent resource: https://rawgit.com/ryancalme/svg-to-stl/master/SVGtoSTL.html

bPx = 40;
bPy = 66;
bPz = 3;


lb = 1.5;
lh = 1.0;
lw = 50;
ld = 8;
/* lablabel(); */
basePlate();
translate([10, bPy/2-10, -bPz/2-.8]) {lablabel();}


module basePlate() {
   difference() {
      union() {
         cube(size=[bPx, bPy, bPz], center=true);
         translate([0, 0, bPz/2]) {lanes();}
         translate([0, 0, -bPz/2+.2]) {handle();}
      }
      union() {
         /* translate([10, bPy/2-10, -bPz/2-.8]) {lablabel();} */
         translate([0, -bPy/2+8, -bPz/2+.5]) {lablabel2();}
      }
   }
}

module lanes() {
   translate([lb*7.5,0,0]) {lane();}
   translate([lb*4.5,0,0]) {lane();}
   translate([lb*1.5,0,0]) {lane();}
   translate([-lb*7.5,0,0]) {lane();}
   translate([-lb*4.5,0,0]) {lane();}
   translate([-lb*1.5,0,0]) {lane();}
}

module lane() {
   rotate([90, -90, 0]) {
      linear_extrude(height=lw, center=true, convexity=10, twist=0) {
         polygon(points=[[0,0],[lh,0],[0,lb]], paths=[[0,1,2]]);

      }
   }
}

module handle() {
   rotate([00, -90, 0]) {
      difference() {
         cylinder(r=25/2, h=3, center=true);
         translate([20, 0, 0]) {cube(size=[40,60,6], center=true);}
      }
   }
}

module lablabel() {
   rotate([0, 0, 0]) {
      /* scale([.01, .01, 0.01]){surface(file = "Celestia.png", center = true);} */
      scale([.25,.25,.25]){import(file = "Celestia3.stl", center = true);}
   }
}

module lablabel2() {
   rotate([0, 180, 0]) {
      scale([.5,.5, 1]){import(file = "KindtLabBanner.stl", center = true);}
   }
}
