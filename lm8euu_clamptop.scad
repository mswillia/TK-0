/**********************************
	File: lm8euu_clamptop.scad
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
radius=1.8;
cutout=3;
cutout_depth=6;

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
			translate([width/2,0,0])
				cylinder(r=5,h=thickness);
			translate([width/2,height,0])
				cylinder(r=5,h=thickness);
		}

		//Drill the hole
		drill(width/2,0,radius,thickness+overdrill*2);
		drill(width/2,height,radius,thickness+overdrill*2);
		//Drill the hole
		drill(width/2,0,cutout,cutout_depth+overdrill);
		drill(width/2,height,cutout,cutout_depth+overdrill);
		translate([(width-bearing_length)/2,height/2,thickness])
			rotate([0,90,0])
				cylinder(r=bearing_radius,h=bearing_length,$fn=100);

		translate([-overdrill,height/2,thickness])
			rotate([0,90,0])
				cylinder(r=bearing_opening,h=width+overdrill*2,$fn=100);
	}
}