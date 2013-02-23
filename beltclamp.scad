/**********************************
	File: BeltClamp.scad
	Revision: 0.5 (2/2/2013)
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
thickness=2.5+belt_depth;
width=20+belt_width;
height=10;

//Hole configuration
hole_spacing=width-(screw_b_diameter*2);

/**********************************
		END CONFIGURATION
**********************************/

difference() {

	//Make our base unit
	cube([width,height,thickness]);

	//Drill the holes
	drill(((width-hole_spacing)/2),(height/2),screw_b_diameter/2,thickness+overdrill*2);
	drill(width-((width-hole_spacing)/2),(height/2),screw_b_diameter/2,thickness+overdrill*2);

	//Make the belt cutout
	translate([((width-belt_width)/2),-overdrill,thickness-belt_depth])
		cube([belt_width,height+overdrill*2,belt_depth+overdrill]);

}