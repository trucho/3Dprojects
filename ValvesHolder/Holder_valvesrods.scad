// in mm (no need for conversions)

// in mm (no need for conversions)

cyl_faces=25;

sol_radius=10.45/2;
//sol_radius=12/2;
sol_hole=(2.45/2)+.2;
sol_delta=(5.33/2)+sol_radius/4;

sol_plate_x=sol_radius*5.5;
sol_plate_y=sol_radius*2*8;
sol_plate_z=5;

pinch_plate_x=sol_plate_z;
pinch_plate_y=sol_plate_y;
pinch_plate_z=sol_plate_x*1.2;

groove_x=sol_radius/1.5;
groove_y=sol_radius*10;
groove_z=sol_plate_z*3;

pinch_hole=3.84/2;
pinch_delta=(5.84+sol_radius)/2;

rod_hole=5.2/2;

//rotate([0,0,0]){
rotate([0,90,0]){
translate([1,0,0]){
color("SteelBlue",.5){
	difference(){
	// solenoid holder
		union(){
			//holder plate
			translate([sol_radius*4,sol_radius,sol_plate_z/2])
						{cube([groove_x/1.2,groove_y*1.4,groove_z]);}
			//holder rods
			for (i=[3.5,8,12.5]){
				translate([-2,sol_radius*(i),sol_plate_z-.5]){
					union(){
						// right rod
						translate([0,sol_delta,0])
							{rotate([0,90,0]){cylinder(h=sol_radius*4+groove_x/2+2,r=sol_hole-.2,$fn=cyl_faces);}}
						//left rod
						translate([0,-sol_delta,0])
							{rotate([0,90,0]){cylinder(h=sol_radius*4+groove_x/2+2,r=sol_hole-.2,$fn=cyl_faces);}}
					}}}
				
				//holder holes
//				for (i=[3.5,8,12.5]){
//					translate([-2,sol_radius*(i),sol_plate_z-.5]){
//						union(){
							// right rod
//							translate([sol_radius*3.5,sol_delta,0])
//								{rotate([0,90,0]){cylinder(h=5,r=sol_hole*2,$fn=cyl_faces);}}
							//left rod
//							translate([sol_radius*3.5,-sol_delta,0])
//								{rotate([0,90,0]){cylinder(h=5,r=sol_hole*2,$fn=cyl_faces);}}
//						}}}
			
			}

		//cleaver plate
		translate([0,sol_radius,-groove_z+sol_plate_z/2])
					{cube([groove_x*20,groove_y*1.5,groove_z]);}
		}

}}}

