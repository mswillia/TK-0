/**********************************
	File: Bearing_Holder.scad
	Revision: 0.2(2/2/2013)
	OpenSCAD version by:
	Michael Williams (gannon)
	mswillia@mtu.edu
**********************************/
include <config.scad>
use <functions.scad>
/**********************************
		CONFIGURATION
**********************************/
base = [linear_bearing_OD*2+5,linear_bearing_length+5,7];

bearing_hole_OD = linear_bearing_OD+6.92;
bearing_hole_ID = linear_bearing_ID+7;

/**********************************
		END CONFIGURATION
**********************************/
difference() {
	union() {
		cube(base, center=true);
		translate([0,base[1]/2,(bearing_hole_OD/2 - 0.96)-base[2]/2])
			rotate([90,0,0])
				cylinder(r=bearing_hole_OD/2,h=base[1], $fn=100);
	}
	translate([0,base[1]/2+overdrill,(bearing_hole_OD/2 - 0.96)-base[2]/2])
		rotate([90,0,0])
			union() {
				cylinder(r=bearing_hole_ID/2,h=base[1]+overdrill, $fn=100);
				translate([0,0,2])
					cylinder(r=linear_bearing_OD/2,h=base[1]+overdrill, $fn=100);
			}
	
	translate([-5.63/2,-base[1]/2-overdrill,bearing_hole_OD/2])
		cube([5.63,base[1]+overdrill*2,linear_bearing_OD]);
	translate([0,0,-base[2]])
		cube(base, center=true);

	translate([-base[0]/2,-base[1]/2,-base[2]/2]) {
		drill(5.5, 4.5, screw_b_diameter/2, base[2]+overdrill*2);
		drill(5.5, base[1]-4.5, screw_b_diameter/2, base[2]+overdrill*2);
		drill(base[0]-5.5, 4.5, screw_b_diameter/2, base[2]+overdrill*2);
		drill(base[0]-5.5, base[1]-4.5, screw_b_diameter/2, base[2]+overdrill*2);
	}
}
