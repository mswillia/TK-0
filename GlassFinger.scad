/**********************************
	File: GlassFinger.scad
	Revision: 0.1(2/2/2013)
	OpenSCAD version by:
	Michael Williams (gannon)
	mswillia@mtu.edu
**********************************/
include <config.scad>
use <functions.scad>
/**********************************
		CONFIGURATION
**********************************/
width = 10;
height = 10;
/**********************************
		END CONFIGURATION
**********************************/
union() {
	difference() {
		rotate([90,0,0])
			linear_extrude(height = 10)
				polygon(points=[[0,0],
								[0,4],
								[12,7],
								[12,0]],paths=[[0,1,2,3]]);
		difference() {
			translate([-overdrill,-width-overdrill,-overdrill])
				cube([width/2+overdrill*2,width+overdrill*2,height]);
			translate([width/2,-width/2,-overdrill])
				cylinder(r=width/2,h=height+overdrill*2, $fn=100);
		}
	}
	translate([12,-10,0])
		difference() {
			cube([10,10,7]);
			drill(5,5,screw_b_diameter/2,7+overdrill*2);
			translate([10,0,0])
				roundedcorner(2,7,-90);
			translate([10,10,0])
				roundedcorner(2,7,0);
		}
}
