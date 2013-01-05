/**********************************
	File: X_SingleExtruderMount.scad
	Revision: 0.1 (10/23/2012)
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
thickness=6;
width=100;
height=77;

/**********************************
		END CONFIGURATION
**********************************/

difference() {
	union() {
		cube([36,thickness,height]);
		translate([0,width-thickness,0])
			cube([36,thickness,32]);
	}
	rotate([-90,0,0])
		translate([36+83.5,-96,-1])
			cylinder(r=115,h=102,$fn=100);
}
translate([thickness,0,0])
	rotate([0,-90,0])
		difference() {
			cube([height,width,thickness]);
			drill(27,(width/2),2,thickness+overdrill*2);
			drill(47,(width/2),2,thickness+overdrill*2);
			drill(67,(width/2),2,thickness+overdrill*2);
			drill(47,10,2,thickness+overdrill*2);
			drill(47,width-10,2,thickness+overdrill*2);
			drill(27,(width/2),3.5,3.6+overdrill);
			drill(47,(width/2),3.5,3.6+overdrill);
			drill(67,(width/2),3.5,3.6+overdrill);
			drill(47,10,3.5,3.6+overdrill);
			drill(47,width-10,3.5,3.6+overdrill);
		}

intersection() {
	difference() {
		cube([66,width,thickness]);
		drill(40,(width/2),21,thickness+overdrill*2);
		drill(40,(width/2)-26,2.2,thickness+overdrill*2);
		drill(40,(width/2)+26,2.2,thickness+overdrill*2);
	}
	intersection() {
		translate([5.1,(width/2)+5,0])
			cylinder(r=63.1,h=thickness,$fn=100);
		translate([5.1,(width/2)-5,0])
			cylinder(r=63.1,h=thickness,$fn=100);
	}
}