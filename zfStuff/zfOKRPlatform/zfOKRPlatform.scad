include <gears_v5.1.scad>

// projection ring ~ 80 mm in diameter
// petri dish lid ~ 90 mm in diameter
// 12-well plate well is 25 mm in diameter and plate is ~125 x 85

/* #translate ([0,0,-20])cylinder(r=90, h=5, center=true); */

gear (number_of_teeth=27,
	circular_pitch=500,
	circles=6,
	hub_diameter=2*8.88888889,
	rim_width=2,
	rim_thickness=3,
	gear_thickness=2,
	hub_thickness=2);

 rotate ([0,0,360*-5/17-1])
translate ([58,0,0])
gear (number_of_teeth=15,
	circular_pitch=500,
	hub_diameter=10,
	rim_width=2,
	rim_thickness=3,
	gear_thickness=2,
	hub_thickness=2,
	circles=9); 




/* module all_gears()
{
	translate([17,-15])
	{
		rotate ([0,0,360*4/17])
		translate ([39.088888,0,0])
		{
			gear (number_of_teeth=11,
				circular_pitch=500,
				hub_diameter=0,
				rim_width=65);
			translate ([0,0,8])
			{
				gear (number_of_teeth=6,
					circular_pitch=300,
					hub_diameter=0,
					rim_width=5,
					rim_thickness=6,
					pressure_angle=31);
				rotate ([0,0,360*5/6])
				translate ([22.5,0,1])
				gear (number_of_teeth=21,
					circular_pitch=300,
					bore_diameter=2,
					hub_diameter=4,
					rim_width=1,
					hub_thickness=4,
					rim_thickness=4,
					gear_thickness=3,
					pressure_angle=31);
			}
		}

		translate ([-61.1111111,0,0])
		{
			gear (number_of_teeth=27,
				circular_pitch=500,
				circles=5,
				hub_diameter=2*8.88888889);

			translate ([0,0,10])
			{
				gear (
					number_of_teeth=14,
					circular_pitch=200,
					pressure_angle=5,
					clearance = 0.2,
					gear_thickness = 10,
					rim_thickness = 10,
					rim_width = 15,
					bore_diameter=5,
					circles=0);
				translate ([13.8888888,0,1])
				gear (
					number_of_teeth=11,
					circular_pitch=200,
					pressure_angle=5,
					clearance = 0.2,
					gear_thickness = 10,
					rim_thickness = 10,
					rim_width = 15,
					hub_thickness = 20,
					hub_diameter=2*7.222222,
					bore_diameter=5,
					circles=0);
			}
		}

		rotate ([0,0,360*-5/17])
		translate ([44.444444444,0,0])
		gear (number_of_teeth=15,
			circular_pitch=500,
			hub_diameter=10,
			rim_width=5,
			rim_thickness=5,
			gear_thickness=4,
			hub_thickness=6,
			circles=9);


	}
} */
