/**********************************
	File: Y_FrameConnectorB.scad
	Revision: 0.1 (2/2/2012)
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
base=[44,20,4];

/**********************************
		END CONFIGURATION
**********************************/
difference() {
	union() {
		cube(base);
		translate([base[0]/2-smooth_rod_diameter,0,0]) {
			cube([smooth_rod_diameter*2,base[1],smooth_rod_diameter]);
			translate([smooth_rod_diameter,0,smooth_rod_diameter])
				rotate([-90,0,0])
					cylinder(r=smooth_rod_diameter,h=base[1],$fn=100);

		}
	}
	translate([base[0]/2,-overdrill,smooth_rod_diameter])
		rotate([-90,0,0])
			cylinder(r=screw_d_diameter/2,h=17+overdrill,$fn=100);
	drill(6,base[1]/2,screw_c_diameter/2,base[2]+overdrill*2);
	drill(base[0]-6,base[1]/2,screw_c_diameter/2,base[2]+overdrill*2);
}