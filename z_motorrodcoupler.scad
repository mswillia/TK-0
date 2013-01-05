/**********************************
	File: z_motorrodcoupler.scad
	Revision: 0.1 (10/7/2012)
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
		cube([20,12.9,30]);
		translate([10,12.9,0])
			cylinder(r=10,h=30,$fn=100);
		translate([10,22.9-overdrill,0])
			linear_extrude(height=30)
				polygon(points=[[-0.75,0],[0,1+overdrill],[.75,0]]);
	}
	difference() {
		translate([10,12.2,-overdrill])
			cylinder(r=5.5/2,h=30+overdrill*2,$fn=100);
		translate([10-5.5/2,14.5,-overdrill])
			cube([5.5,5.5,30+overdrill*4]);
	}
	translate([9,-overdrill,-overdrill])
			cube([2,12.9+overdrill,30+overdrill*2]);
	translate([10,12.2,-overdrill])
			cylinder(r=4.9,h=15+overdrill,$fn=100);
	rotate([90,0,90]) union() {
		translate([4.7,7.5,-overdrill])
				cylinder(r=2.6,h=9+overdrill*2,$fn=100);
		translate([4.7,22.5,-overdrill])
				cylinder(r=2.6,h=9+overdrill*2,$fn=100);
		translate([4.7,7.5,0])
				cylinder(r=1.9,h=20+overdrill,$fn=100);
		translate([4.7,22.5,0])
				cylinder(r=1.9,h=20+overdrill,$fn=100);
		translate([4.7,7.5,15])
				cylinder(r=4,h=5+overdrill,$fn=100);
		translate([4.7,22.5,15])
				cylinder(r=4,h=5+overdrill,$fn=100);
	}
}