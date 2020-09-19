// Lens Holder for 50mm plano-convex collimator / projector lens
// Lens: http://www.ebay.com/itm/161126916191
// by John Beale, April 2014

// Lens OD: 50mm
// Lens Rim diameter: 46.2
// Rim edge thickness: 3mm
// Lens Height: 22mm
// Focal Length: 24mm (for reference only)

// lens outer edge diameter
diam = 50.4;  // at 50.4, measured print: 50.40

// lens mounting rim diameter
lrdiam = 46.5;  // at 46.5, measured print: 46.59

// lens edge thickness
thick = 3.0;  // at 3.0, measured print: 2.58 - 2.76

// ==================================================
// measured print width = 60.17 mm base, 61.17 mm top
// across lens, outside thick: 10.11 - 10.28
// thick at foot: 25.24 - 25.35 mm
// height at foot: 5.49 - 5.57 mm
// diam of screw hole: 3.55 - 3.78 mm
// ==================================================

// overall thickness
lh = 20;

eps=0.05*1;
$fa=5*1;
$fs=0.2*1;

rotate([90,0,0])
lensbracket(diam, thick, lh);

wthick = 5;  // wall thickness of lens support

module lensbracket(d, t, lh) // f=0.85
{
  translate([0,0,1]) scale([1,1,1])
  difference()
  {
    // rotate(0,[0,0,0]) 
    // translate([0,0,-1]) scale([1,1,1])
    union()
    { 
     // square base
     translate([-d/2-wthick,-(d/2)-wthick,2]) cube([d+(wthick*2),d,d/2]);
    } 
	 translate([0,0,5])
    lenscutter(d,t);
  }
}

csize = 80;
sdiam = 4.0;  // diameter of mounting screw
fdepth = 5;  // depth of mounting foot
fthick = 7;  // forward extension of mounting foot

module lenscutter(d,t)
{  union()
   {
         // cut off porch leaving mounting foot
     translate([-(csize/2),fdepth-30,fthick]) cube([csize+2, csize+2, csize+2]);  

		 // cut off top half
     translate([-49,0,-50]) cube([csize+eps, csize+eps, csize+eps]);

     cylinder(h=t,r=(d/2),$fn=40);  // lens rim

     translate([0,0,-25])
      cylinder(h=100,r=((lrdiam)/2),$fn=80);  // optical path through-clearance

     translate([23,0,15])  rotate([90,0,0]) 
        cylinder(h=100,r=((sdiam)/2),$fn=40);  // mounting screw
     translate([-23,0,15]) rotate([90,0,0])
        cylinder(h=100,r=((sdiam)/2),$fn=40);  // mounting screw

   }
}
