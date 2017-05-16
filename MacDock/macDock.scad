shell_x=100;
shell_y=60;
shell_z=40;

// Box
shell();

module shell() {
	cube(size=[shell_x,shell_y,shell_z], center=true);
}

