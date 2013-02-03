/**********************************
	File: config.scad
	Revision: 0.2 (1/5/2013)
	OpenSCAD version by:
	Michael Williams (gannon)
	mswillia@mtu.edu
**********************************/

/**********************************
		CONFIGURATION
**********************************/
//This is for the depth of holes so OpenSCAD renders correctly.
overdrill=0.1;

//LM10UU
linear_bearing_length=29;
linear_bearing_ID=10;
linear_bearing_OD=19.4;//19

//HFSB5-2020 extrusions
extrusion_height=20;
extrusion_width=20;
extrusion_wall=3.2;
extrusion_opening=5.4;

//Large rods
smooth_rod_diameter=10;
threaded_rod_diameter=8;

//608zz
skate_bearings_length=7;
skate_bearings_ID=8;
skate_bearings_OD=22;

//Belt configuration
belt_width=8;
belt_depth=1;

/*
3/8"-12 acme rod
m8 threaded rod
*/

spring_OD=6;

screw_a_diameter=3;
screw_b_diameter=4;
screw_c_diameter=5;
screw_d_diameter=8;

/**********************************
		END CONFIGURATION
**********************************/