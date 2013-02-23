/**********************************
	File: Bearing_Holder.scad
	Revision: 0.3(2/3/2013)
	OpenSCAD version by:
	Michael Williams (gannon)
	mswillia@mtu.edu
**********************************/
include <config.scad>
use <functions.scad>
/**********************************
		CONFIGURATION
**********************************/
bearing_hole_OD = linear_bearing_OD+6.92;
bearing_hole_ID = linear_bearing_ID+7;

/**********************************
		END CONFIGURATION
**********************************/

difference() {
	union() {
		cube(bearing_block_base, center=true);
		translate([0,bearing_block_base[1]/2,(bearing_hole_OD/2 - 0.96)-bearing_block_base[2]/2])
			rotate([90,0,0])
				cylinder(r=bearing_hole_OD/2,h=bearing_block_base[1], $fn=100);
	}
	translate([0,bearing_block_base[1]/2+overdrill,(bearing_hole_OD/2 - 0.96)-bearing_block_base[2]/2])
		rotate([90,0,0])
			union() {
				cylinder(r=bearing_hole_ID/2,h=bearing_block_base[1]+overdrill, $fn=100);
				translate([0,0,2])
					cylinder(r=linear_bearing_OD/2,h=bearing_block_base[1]+overdrill, $fn=100);
			}
	
	translate([-5.63/2,-bearing_block_base[1]/2-overdrill,bearing_hole_OD/2])
		cube([5.63,bearing_block_base[1]+overdrill*2,linear_bearing_OD]);
	translate([0,0,-bearing_block_base[2]])
		cube([bearing_block_base[0]+overdrill*2,bearing_block_base[1]+overdrill*2,bearing_block_base[2]], center=true);

	translate([-bearing_block_base[0]/2+5.5,-bearing_block_base[1]/2+4.5,-bearing_block_base[2]/2])
		bearing_block_holes();

}