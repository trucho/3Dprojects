include <involute_gears.scad>

// projection ring ~ 80 mm in diameter
// petri dish lid ~ 90 mm in diameter
// 12-well plate well is 25 mm in diameter and plate is ~125 x 85

/* translate ([0,0,-20])
cylinder(r=90, h=5, center=true); */

/* translate ([0,0,-40])
difference() {
   {cube(size=[125, 85, 1], center=true);}
   {cylinder(r=12.5, h=10, center=true);}
} */

makeDoubleHelixGear();

mirror ([0,1,0])
translate ([58.33333333,0,0])
makeDoubleHelixGear (teeth=13,circles=6);

module makeDoubleHelixGear (teeth=17,circles=8) {
	//double helical gear
	{
		twist=200;
		height=5;
		pressure_angle=0;
      gearPitch = 700;

		gear (number_of_teeth=teeth,
			circular_pitch=gearPitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness = height/2*0.5,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2*1.2,
			hub_diameter=15*(gearPitch/700),
			bore_diameter=5*(gearPitch/700),
			circles=circles,
			twist=twist/teeth);
		mirror([0,0,1])
		gear (number_of_teeth=teeth,
			circular_pitch=gearPitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness = height/2,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2,
         hub_diameter=15*(gearPitch/700),
			bore_diameter=5*(gearPitch/700),
			circles=circles,
			twist=twist/teeth);
	}
}
