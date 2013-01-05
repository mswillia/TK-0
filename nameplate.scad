/**********************************
	File: NamePlate.scad
	Revision: 0.2 (1/5/2012)
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
length=120;
height=40;
thickness=4;

corner_radius=20;

//Holes
radius=3;

/**********************************
		END CONFIGURATION
**********************************/
difference() {
	cube([length,height,thickness]);
	roundedcorner(corner_radius,thickness,180);
	translate([length,0,0])
		roundedcorner(corner_radius,thickness,270);
	drill(8.5,30,radius,thickness+overdrill*2);
	drill(length-8.5,30,radius,thickness+overdrill*2);
}
