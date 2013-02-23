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

module bearing_block_holes() {
	make_4_holes(bearing_block_base[0]-11, bearing_block_base[1]-9, bearing_block_base[2],screw_b_diameter/2);
}

module make_4_holes(width,height,depth,radius) {
	translate([width/2, height/2,0])
		for (i=[-1,1],j=[-1,1]) {
			translate([i*width/2, j*height/2, 0])
				drill(0,0, radius, depth+overdrill*2);
		}
}

module x_axis_bearing_mount() {
	difference() {
		cube(bearing_mount_base);
		
		//Rounded corners
		for (i=[0,1],j=[0,1]) {
			translate([i*bearing_mount_base[0],j*bearing_mount_base[1],0])
				if (i==1 && j==1)
					roundedcorner(bearing_mount_corner,bearing_mount_base[2],0);
				else
					roundedcorner(bearing_mount_corner,bearing_mount_base[2],180+i*90-j*90);
		}
		

		//Middle cutout
		translate([(bearing_mount_base[0]-bearing_mount_hole[0])/2,(bearing_mount_base[1]-bearing_mount_hole[1])/2,-overdrill])
			cube(bearing_mount_hole);
			
		//Bearing mounts
		translate([bearing_mount_base[0]-bearing_block_base[0]+10.5+screw_b_diameter/2,bearing_block_base[0]-4.5+screw_b_diameter/2,0])
			rotate([0,0,-90])
				bearing_block_holes();

		translate([6,bearing_block_base[0]-4.5+screw_b_diameter/2,0])
			rotate([0,0,-90])
				bearing_block_holes();
		
		//Middle 4 holes
		translate([44.5,4,0])
			make_4_holes(bearing_mount_base[0]-89,bearing_mount_base[1]-8,bearing_mount_base[2],screw_b_diameter/2);

	}
}