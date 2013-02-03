/**********************************
	File: NamePlate.scad
	Revision: 0.3 (2/2/2012)
	OpenSCAD version by:
	Michael Williams (gannon)
	mswillia@mtu.edu
**********************************/
include <config.scad>
use <functions.scad>
/**********************************
		CONFIGURATION
**********************************/
//Base size
base=[40,120,4];
corner_radius=20;

/**********************************
		END CONFIGURATION
**********************************/
difference() {
	cube(base);
	roundedcorner(corner_radius,base[2],180);
	translate([0,base[1],0])
		roundedcorner(corner_radius,base[2],90);
	drill(30,8.5,screw_c_diameter/2,base[2]+overdrill*2);
	drill(30,base[1]-8.5,screw_c_diameter/2,base[2]+overdrill*2);
}
