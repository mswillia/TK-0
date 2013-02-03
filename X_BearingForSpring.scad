/**********************************
	File: X_BearingForSpring.scad
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
bearing_block_base = [linear_bearing_OD*2+5,linear_bearing_length+5,7];

corner = 6;
base = [114,bearing_block_base[0]+3.7,6];
hole = [base[0]-12,base[1]-27.5,base[2]+overdrill*2];
/**********************************
		END CONFIGURATION
**********************************/
difference() {
	cube(base);
	translate([base[0],base[1],0])
		roundedcorner(corner,base[2],0);
	translate([base[0],0,0])
		roundedcorner(corner,base[2],-90);
	translate([0,base[1],0])
		roundedcorner(corner,base[2],90);
	translate([0,0,0])
		roundedcorner(corner,base[2],180);
	translate([0,0,0])
		roundedcorner(corner,base[2],180);
		
	translate([screw_b_diameter/2-0.5,screw_b_diameter/2+1,0]) {
		drill(4.5, 5.5, screw_c_diameter/2, bearing_block_base[2]+overdrill*2);
		drill(bearing_block_base[1]-4.5, 5.5, screw_c_diameter/2, bearing_block_base[2]+overdrill*2);
		drill(4.5, bearing_block_base[0]-5.5, screw_c_diameter/2, bearing_block_base[2]+overdrill*2);
		drill(bearing_block_base[1]-4.5, bearing_block_base[0]-5.5, screw_c_diameter/2, bearing_block_base[2]+overdrill*2);
	}
	
	translate([base[0]-bearing_block_base[0]+screw_b_diameter*2,screw_b_diameter/2+1,0]) {
		drill(4.5, 5.5, screw_c_diameter/2, bearing_block_base[2]+overdrill*2);
		drill(bearing_block_base[1]-4.5, 5.5, screw_c_diameter/2, bearing_block_base[2]+overdrill*2);
		drill(4.5, bearing_block_base[0]-5.5, screw_c_diameter/2, bearing_block_base[2]+overdrill*2);
		drill(bearing_block_base[1]-4.5, bearing_block_base[0]-5.5, screw_c_diameter/2, bearing_block_base[2]+overdrill*2);
	}
	translate([(base[0]-hole[0])/2,(base[1]-hole[1])/2,-overdrill]) cube(hole);
	
	drill(44.5,4,screw_b_diameter/2,base[2]+overdrill*2);
	drill(base[0]-44.5,4,screw_b_diameter/2,base[2]+overdrill*2);
	drill(44.5,base[1]-4,screw_b_diameter/2,base[2]+overdrill*2);
	drill(base[0]-44.5,base[1]-4,screw_b_diameter/2,base[2]+overdrill*2);
}
difference() {
	union() {
		translate([base[0]-20/2,0,0])
			rotate([90,0,-90]) {
				linear_extrude(height=base[0]-20)
					polygon(points=[[0,0],[0,6],[10,21],[34.5,21],[34.5,0]],paths=[[0,1,2,3,4]]);
			}
		translate([base[0]/2,-34.5+7.5,21])
			rotate([90,0,0]) 
				cylinder(r=12,h=7.5,$fn=100);
	}

	translate([base[0]-20/2,-34.5,0])
		roundedcorner(corner,27,-90);
	translate([20/2,-34.5,0])
		roundedcorner(corner,27,180);
	translate([base[0]/2-50/2,-27,-overdrill])
		cube([50,27,22]);
	drill(22,-17,smooth_rod_diameter/2,34.5+overdrill*2);
	drill(base[0]-22,-17,smooth_rod_diameter/2,34.5+overdrill*2);
	translate([22,-34.5,10.5])
		rotate([-90,0,0]) {
			drill(0,0,4,4);
			drill(0,0,2.6,20);
		}
	translate([base[0]-22,-34.5,10.5])
		rotate([-90,0,0]) {
			drill(0,0,4,4);
			drill(0,0,2.6,20);
		}

translate([base[0]/2,-34.5+7.5,21])
	rotate([90,0,0]) {


			translate([0,4.26-2.1,-overdrill])
				linear_extrude(height=7.5+overdrill*2)
					polygon(points=[[-(5.5/2),2.1],[(5.5/2),2.1],[(6.7/2),0],[-(6.7/2),0]],paths=[[0,1,2,3]]);
			translate([0,0,-overdrill])
				cylinder(r=4.15,h=7.5+overdrill*2,$fn=100);
	}
}

