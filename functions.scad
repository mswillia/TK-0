/**********************************
	File: functions.scad
	Revision: 0.2 (2/3/2012)
	OpenSCAD version by:
	Michael Williams (gannon)
	mswillia@mtu.edu
**********************************/
include <config.scad>

//Drill a hole the given depth at the given location
module drill(x,y,radius,depth) {
	translate([x,y,-overdrill])
		cylinder(r=radius,h=depth,$fn=100);
}

module roundedcorner(radius,thickness,angle) {
	rotate([0,0,angle])
		translate([-radius+overdrill,-radius+overdrill,-overdrill])
			difference() {
				translate([-overdrill,-overdrill,0])
					cube([radius+overdrill,radius+overdrill,thickness+overdrill*2]);
				cylinder(r=radius,h=thickness+overdrill*2, $fn=100);
			}
}

module Lbracket(height,width,length,thickness) {
	difference() {
		cube([height+thickness,width+thickness,length]);
		translate([thickness,thickness,-overdrill])
			cube([width+thickness,height+thickness,length+overdrill*2]);
	}
}

//Usage: points is an array consisting of elements
//[x,y,r] for each point of the polygon
//Please note that x and y will be the centers
//of the rounded edges! Outside wall will be
//r away at some angle.
//Ideally I will make a function that will find
//the place to put the circle of a given radius
//based off of the points in the polygon.
module multiradiusroundedpoly(points,height) {
	linear_extrude(height=height)
		hull()
			for (p = points) {
				translate([p[0],p[1],0])
					circle(r=p[2],$fn=100);
			}
}