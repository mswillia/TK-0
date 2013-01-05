/**********************************
	File: elextronicscablestrainrelief.scad
	Revision: 0.2 (10/7/2012)
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
width=130;
height=10;
thickness=10;

//Holes
radius=2.6;

/**********************************
		END CONFIGURATION
**********************************/

difference() {
	//Make our base unit
	cube([width,height,thickness]);

	//Drill the hole
	drill(5,height/2,radius,thickness+overdrill*2);
	drill(width/2,height/2,radius,thickness+overdrill*2);
	drill(width-5,height/2,radius,thickness+overdrill*2);

	//Make the strain reliefs
	translate([9.2,-overdrill,0])
		strain_relief();
	translate([75.2,-overdrill,0])
		strain_relief();
}

module strain_relief() {
	union() {
		translate([0,0,thickness])
			rotate([0,45,0])
				cube([6.6,height+overdrill*2,6.6]);
		translate([12,0,thickness])
			rotate([0,45,0])
				cube([6.6,height+overdrill*2,6.6]);
		translate([24,0,thickness])
			rotate([0,45,0])
				cube([6.6,height+overdrill*2,6.6]);
		translate([36,0,thickness])
			rotate([0,45,0])
				cube([6.6,height+overdrill*2,6.6]);
	}
}