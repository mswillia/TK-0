/**********************************
	File: FilamentGuide.scad
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
base = [40,135,4];
mount = [base[0]+20,base[2],20];
support_thickness = 8;

/**********************************
		END CONFIGURATION
**********************************/
union() {

difference() {
	union() {
		difference() {
			cube(base);
			difference() {
				translate([0,base[1]-40,0])
					cube([40,40,10]);
				translate([20,base[1]-29,0])
					cylinder(r=29,h=10, $fn=100);
			}
		}
		
		translate([20,base[1]-29,0]) 
			intersection() {
				union() {
					difference() {
						cylinder(r=29,h=10, $fn=100);
						cylinder(r=26,h=10+overdrill, $fn=100);
					}
					difference() {
						cylinder(r=23,h=10, $fn=100);
						cylinder(r=20,h=10+overdrill, $fn=100);
					}
				}
				translate([-20,0,0])
					cube([40,40,10]);
			}
			
	}
	translate([-125,base[1]/2 - 3.5,-overdrill])
		cylinder(r=base[1],h=10+overdrill*2,$fn=100);
	translate([125+base[0],base[1]/2 - 3.5,-overdrill])
		cylinder(r=base[1],h=10+overdrill*2,$fn=100);
}

difference() {
	translate([-((mount[0] - base[0]) / 2), 0, 0 ])
		cube(mount);
	rotate([-90,0,0]) drill(0, -mount[2]/2+overdrill, screw_c_diameter/2, mount[1]+overdrill*2);
	rotate([-90,0,0]) drill(mount[0]-20, -mount[2]/2+overdrill, screw_c_diameter/2, mount[1]+overdrill*2);
}

translate([(base[0]+support_thickness)/2,0,0])
	rotate([0,-90,0])
		linear_extrude(height = support_thickness)
			polygon(points=[[base[2]-overdrill,mount[1]],[base[2],mount[1]],[mount[2],mount[1]],[base[2],base[1]-mount[2]],[base[2]-overdrill,base[1]-mount[2]]],paths=[[0,1,2,3,4]]);


}

