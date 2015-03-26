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
rotate([90,180,180]){
difference(){
union(){
// rod panel
translate([0,sol_plate_y-sol_plate_z/2,-sol_plate_x*1.2+sol_plate_z])
difference(){
			{cube([sol_plate_x,sol_plate_z,sol_plate_y*.8]);}

	union(){
		translate([sol_plate_x/2,sol_plate_z*2,sol_plate_z*3])
			{rotate([90,90,0]){cylinder(h=sol_radius*4+groove_x/2+2,r=rod_hole,$fn=cyl_faces);}}
		translate([sol_plate_x/2,sol_plate_z*2,sol_plate_z*10])
			{rotate([90,90,0]){cylinder(h=sol_radius*4+groove_x/2+2,r=rod_hole,$fn=cyl_faces);}}
	}
}

//pinch plate
difference(){
	translate([0,0,-pinch_plate_z+sol_plate_z])
			{cube([pinch_plate_x,pinch_plate_y,pinch_plate_z]);}
	
	union(){for (i=[3,7.5,12]){
	translate([-sol_plate_z,sol_radius*(i-1.5),-sol_plate_x/2.5]){
			translate([0,0,pinch_delta])
				{rotate([0,90,0]){cylinder(h=sol_radius*4+groove_x/2,r=pinch_hole,$fn=cyl_faces);}}
			translate([0,0,-pinch_delta])
				{rotate([0,90,0]){cylinder(h=sol_radius*4+groove_x/2,r=pinch_hole,$fn=cyl_faces);}}
			translate([0,sol_radius*1.5,-pinch_delta*2.6])
				{rotate([0,90,0]){cylinder(h=sol_radius*4+groove_x/2,r=pinch_hole,$fn=cyl_faces);}}
		}}
	}
}

// solenoid plate
		translate([0,0,0])
			{cube([sol_plate_x,sol_plate_y,sol_plate_z]);}
}

// solenoid cylinder grooves
	union(){
		//holder plate
		translate([sol_radius*4,sol_radius,sol_plate_z/2])
					{cube([groove_x,groove_y*1.5,groove_z*2.8]);}
		//holder holes
		for (i=[3.5,8,12.5]){
			translate([-2,sol_radius*(i),sol_plate_z-.5]){
				union(){
					// right rod
					translate([0,sol_delta,0])
						{rotate([0,90,0]){cylinder(h=sol_radius*4+groove_x/2+2,r=sol_hole,$fn=cyl_faces);}}
					//left rod
					translate([0,-sol_delta,0])
						{rotate([0,90,0]){cylinder(h=sol_radius*4+groove_x/2+2,r=sol_hole,$fn=cyl_faces);}}
				}}}
				union(){
					for (i=[3.5,8,12.5]){
					translate([sol_radius*2,sol_radius*i,-24.5+sol_plate_z*2-.5])
						union(){
						//valve hole
						{cylinder(h=24+4,r=sol_radius+1,$fn=cyl_faces);}
						//square groove
						translate([-(10.62+2)/2,-12.96/2,sol_plate_z*1.5+9.9]){cube([10.62+3,11.96+1,3.92]);}
						}
					}
				}
}
}}