

bPx = 40;
bPy = 66;
bPz = 3;


lb = 1.5;
lh = 1.0;
lw = 50;
ld = 8;
basePlate();


module basePlate() {
   cube(size=[bPx, bPy, bPz], center=true);
   translate([0, 0, bPz/2]) {lanes();}
   translate([0, 0, -bPz/2+.2]) {handle();}
   %translate([0, bPy/2-8, -bPz/2+.5]) {lablabel();}
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
   rotate([0, 180, 0]) {
      scale([.05, .05, 0.05]){surface(file = "KindtLabBanner.png", center = true);}
   }
}
