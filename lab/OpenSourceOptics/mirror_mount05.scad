include <../../MCAD/nuts_and_bolts.scad>;

body_w = 40;
body_h = 40;
body_d = 9;
standoff = 5;

m_plate_w = 26;
m_plate_h = 26;
m_plate_d = 2;

m_plate_gap_to_body_w = 2;
m_plate_gap_to_body_h = 2;

m_plate_hole_radius = 3;

magnet_h = 3;
magnet_w = 3;
magnet_d = 3;
magnet_edge_offset = 2;

spring_w = 2;spring_h=8;spring_d=1;

screw_adust_r = 3;

mounting_screw_r = (0.25*25.4)/2;	// Imperial mounting
//mounting_screw_r = 6/2;				// Metric mounting

union(){

	difference(){
		translate([-(body_w/2),-(body_h/2+standoff),0]) cube([body_w,(body_h+standoff),body_d]);
		translate([-(m_plate_w + m_plate_gap_to_body_w)/2,-(m_plate_h + m_plate_gap_to_body_h)/2,-0.5]) cube([(m_plate_w + m_plate_gap_to_body_w),(m_plate_h + m_plate_gap_to_body_h),(body_d+1)]);
		translate([0,-m_plate_h/2,body_d/2]) rotate([90,0,0]) cylinder(r=mounting_screw_r,h=(body_h/2-m_plate_h/2+m_plate_gap_to_body_h+standoff));

	}

	// mirror plate
	difference(){
		translate([-(m_plate_w/2),-(m_plate_h/2),0]) cube([m_plate_w,m_plate_h,m_plate_d]);
		//rotate([0,45,0]) translate([0,0,-8]) cylinder(r=m_plate_hole_radius,h=19);		// diagonal hole for 45 deg mirror
		rotate([0,0,0]) translate([0,0,-8]) cylinder(r=m_plate_hole_radius,h=19);		// straight hole for lens
		translate([-(m_plate_w/2 - magnet_edge_offset),(m_plate_h/2-magnet_edge_offset-magnet_h),-0.5]) cube([magnet_w, magnet_h, magnet_d]);
		translate([(m_plate_w/2-magnet_edge_offset-magnet_w),-(m_plate_h/2-magnet_edge_offset),-0.5]) cube([magnet_w, magnet_h, magnet_d]);
	}

	//spring
	translate([-m_plate_w/2,-m_plate_h/2,0]) rotate(-45) translate([-(spring_w/2),-(spring_h/2),0]) cube([spring_w,spring_h,spring_d]);

	//bottom screw adjust
	difference(){
		translate([(m_plate_w + m_plate_gap_to_body_w)/2-14,-(m_plate_h + m_plate_gap_to_body_h)/2,body_d]) rotate([0,90,0]) polyhedron(points=[[0,0,0],[0,0,14],[6,0,14],[0,14,14]], triangles=[[0,1,2],[1,3,2],[0,3,1],[2,3,0]]);
		translate([(m_plate_w/2-magnet_edge_offset-magnet_w+screw_adust_r/2),-(m_plate_h/2-magnet_edge_offset-magnet_h+screw_adust_r/2),5]) cylinder(r=screw_adust_r/2,h=10);
	}
	difference(){
		translate([(m_plate_w/2-magnet_edge_offset-magnet_w+screw_adust_r/2),-(m_plate_h/2-magnet_edge_offset-magnet_h+screw_adust_r/2),body_d]) rotate(45) scale([2,1.2,0.98]) nutHole(3);
		translate([(m_plate_w/2-magnet_edge_offset-magnet_w+screw_adust_r/2),-(m_plate_h/2-magnet_edge_offset-magnet_h+screw_adust_r/2),body_d]) rotate(45) nutHole(3);
	}

	//top screw adjust
	difference(){
		translate([-((m_plate_w + m_plate_gap_to_body_w)/2-14),(m_plate_h + m_plate_gap_to_body_h)/2,body_d]) rotate([0,90,180]) polyhedron(points=[[0,0,0],[0,0,14],[6,0,14],[0,14,14]], triangles=[[0,1,2],[1,3,2],[0,3,1],[2,3,0]]);
		translate([-(m_plate_w/2-magnet_edge_offset-magnet_w+screw_adust_r/2),(m_plate_h/2-magnet_edge_offset-magnet_h+screw_adust_r/2),5]) cylinder(r=screw_adust_r/2,h=10);
	}

	difference(){
		translate([-(m_plate_w/2-magnet_edge_offset-magnet_w+screw_adust_r/2),(m_plate_h/2-magnet_edge_offset-magnet_h+screw_adust_r/2),body_d]) rotate(45) scale([2,1.2,0.98]) nutHole(3);
		translate([-(m_plate_w/2-magnet_edge_offset-magnet_w+screw_adust_r/2),(m_plate_h/2-magnet_edge_offset-magnet_h+screw_adust_r/2),body_d]) rotate(45) nutHole(3);
	}

}