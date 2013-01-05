/**********************************
	File: lm8euu_clampbottom.scad
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
width=32;
height=24.2;
thickness=10;

//Holes
radius=2;
cutout=2.8;
cutout_depth=8;

bearing_radius=8;
bearing_length=26;
bearing_opening=7;

/**********************************
		END CONFIGURATION
**********************************/
union() {
	//Make our base unit
	difference() {
		union() {
			cube([width,height,thickness]);
			translate([(width-8)/2,-4,0])
				cube([8,8,thickness]);
			translate([(width-8)/2,height-4,0])
				cube([8,8,thickness]);
			translate([0,-7,0])
				difference() {
					cube([width,7,thickness/2]);
					translate([9,-overdrill,-overdrill])
						cube([14,3+overdrill,thickness/2+overdrill*2]);
				}
			translate([0,height-overdrill,0])
				difference() {
					cube([width,7,thickness/2]);
					translate([9,4+overdrill,-overdrill])
						cube([14,3+overdrill,thickness/2+overdrill*2]);
				}
		}

		//Drill the hole
		drill(3.5,-4,radius,thickness+overdrill*2);
		drill(width-3.5,-4,radius,thickness+overdrill*2);
		drill(3.5,height+4,radius,thickness+overdrill*2);
		drill(width-3.5,height+4,radius,thickness+overdrill*2);

		//Drill the hole
		translate([0,0,thickness-cutout_depth+overdrill])
 			drill(width/2,0,cutout,cutout_depth+overdrill);
		translate([0,0,thickness-cutout_depth+overdrill])
			drill(width/2,height,cutout,cutout_depth+overdrill);
		translate([(width-bearing_length)/2,height/2,thickness])
			rotate([0,90,0])
				cylinder(r=bearing_radius,h=bearing_length,$fn=100);

		translate([-overdrill,height/2,thickness])
			rotate([0,90,0])
				cylinder(r=bearing_opening,h=width+overdrill*2,$fn=100);
	}
}