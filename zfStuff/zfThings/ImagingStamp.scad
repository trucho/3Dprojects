/* linear_extrude(height = 2, center = true, convexity = 0,twist=0)
scale([.001, .001, .001]) {
	import("3layertemplate_Zebrafish Mounts Mrk3.dxf");
}


translate([0, 0, -2]) {
	linear_extrude(height = 2, center = true, convexity = 0,twist=0)
	scale([.001, .001, .001]) {
		import("3layertemplate_Zebrafish Mounts Mrk4.dxf");
	}
} */


/* linear_extrude(height = 2, center = true, convexity = 0,twist=0) */
/* scale([.001, .001, .001]) {
	import("MSA_2dpf_Dorsal.dxf");
} */

import("dorsal_stamp.stl");
