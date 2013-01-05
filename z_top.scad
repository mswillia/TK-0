/**********************************
	File: z_top.scad
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

/**********************************
		END CONFIGURATION
**********************************/

difference() {

	//Make our base unit
	union() {
		tab();
		translate([20.1,0,0]) cube([130,20,10]);
		translate([170.2,20,0])
			rotate([0,0,180])
				tab();
		
	}

}

translate([55.1,20,0]) linear_extrude(height=10) polygon(points=[[0,0],[9,46.9],[51,46.9],[60,0]]);

module tab() {
	translate([20.1,20,10])
		rotate([90,0,0]) 
		difference() {
			union() {
				cube([4,13.5,20]);
				translate([4,0,0]) linear_extrude(height=3) polygon(points=[[0,0],[0,10],[10,0]]);
				translate([4,0,17]) linear_extrude(height=3) polygon(points=[[0,0],[0,10],[10,0]]);
		}
		translate([0,5,10]) rotate([0,90,0])drill(0,0,2.6,4+overdrill*2);
	}

	difference() {
		cube([20.1, 20, 4]);
		drill(10.5, 10, 2.6,4+overdrill*2);
	}
}