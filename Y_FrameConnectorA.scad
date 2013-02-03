/**********************************
	File: Y_FrameConnector.scad
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
base=[30,20,4];
tab=[base[2],base[1],base[0]+base[2]+1];

/**********************************
		END CONFIGURATION
**********************************/

difference() {
	union() {
		cube(base);
		translate([base[0],base[1]/2,0])
			cylinder(r=base[1]/2,h=base[2]);
		cube(tab);
		translate([-1,(base[1]-5)/2,0])
			cube([1,5,15]);
	}
	translate([-overdrill,base[1]/2,20])
		rotate([0,90,0]) {
			intersection() {
				cylinder(r=screw_c_diameter/2,h=tab[0]+overdrill*2,$fn=100);
				translate([-screw_c_diameter/2+0.4,-screw_c_diameter/2,0]) cube([screw_c_diameter-0.4,screw_c_diameter,tab[0]+overdrill*2]);
			}
		}
	translate([base[0]-screw_c_diameter,base[1]/2,-overdrill]) {
		cylinder(r=screw_c_diameter/2,h=base[2]+overdrill*2,$fn=100);
		translate([0,-screw_c_diameter/2,0]) cube([5,screw_c_diameter,base[2]+overdrill*2]);
		translate([5,0,0]) cylinder(r=screw_c_diameter/2,h=base[2]+overdrill*2,$fn=100);
	}
}
