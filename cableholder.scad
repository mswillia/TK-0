/**********************************
	File: CableHolder.scad
	Revision: 0.2 (1/5/2013)
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
thickness=10;
wall_thickness=3.4;
radius=4.8;
opening=4.8;

/**********************************
		END CONFIGURATION
**********************************/

difference() {
	//Make our base unit
	union() {
		cylinder(r=radius+wall_thickness,h=thickness,$fn=100);
		translate([-2.7,radius+5,0])
			cube([5.4,2.2,thickness]);
		translate([0,radius+7.2,0])
			linear_extrude(height=thickness)
				polygon(points=[[-5,0],[-3,3],[3,3],[5,0]]);
		translate([0,radius-0.7,0])
			linear_extrude(height=thickness)
				polygon(points=[[-7.1,0],[-10,2.9],[-10,5.7],[10,5.7],[10,2.9],[7.1,0]]);
	}

	//Drill the hole
	drill(0,0,radius,thickness+overdrill*2);

	//This is actually slightly trapezoidal in the sketchup
	//4.8mm inside and 5.0mm outside...leaving it square for now
	translate([-opening/2,-(radius+wall_thickness+overdrill),-overdrill])
		cube([opening,radius+wall_thickness+overdrill,thickness+overdrill*2]);
}