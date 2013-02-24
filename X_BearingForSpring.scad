/**********************************
	File: X_BearingForSpring.scad
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

/**********************************
		END CONFIGURATION
**********************************/
union() {
	x_axis_bearing_mount();

	difference() {
		union() {
			translate([bearing_mount_base[0]-20/2,0,0])
				rotate([90,0,-90]) {
					linear_extrude(height=bearing_mount_base[0]-20)
						polygon(points=[[-overdrill,0],[0,6],[10,21],[34.5,21],[34.5,0]],paths=[[0,1,2,3,4]]);
				}
			translate([bearing_mount_base[0]/2,-34.5+7.5,21])
				rotate([90,0,0]) 
					cylinder(r=12,h=7.5,$fn=100);
		}

		translate([bearing_mount_base[0]-20/2,-34.5,0])
			roundedcorner(bearing_mount_corner,27,-90);
		translate([20/2,-34.5,0])
			roundedcorner(bearing_mount_corner,27,180);
		translate([bearing_mount_base[0]/2-50/2,-27,-overdrill])
			cube([50,27,22]);
		drill(22,-17,smooth_rod_diameter/2,34.5+overdrill*2);
		drill(bearing_mount_base[0]-22,-17,smooth_rod_diameter/2,34.5+overdrill*2);
		translate([22,-34.5,10.5])
			rotate([-90,0,0]) {
				drill(0,0,4,4);
				drill(0,0,2.6,20);
			}
		translate([bearing_mount_base[0]-22,-34.5,10.5])
			rotate([-90,0,0]) {
				drill(0,0,4,4);
				drill(0,0,2.6,20);
			}

	translate([bearing_mount_base[0]/2,-34.5+7.5,21])
		rotate([90,0,0]) {


				translate([0,4.26-2.1,-overdrill])
					linear_extrude(height=7.5+overdrill*2)
						polygon(points=[[-(5.5/2),2.1],[(5.5/2),2.1],[(6.7/2),0],[-(6.7/2),0]],paths=[[0,1,2,3]]);
				translate([0,0,-overdrill])
					cylinder(r=4.15,h=7.5+overdrill*2,$fn=100);
		}
	}
}
