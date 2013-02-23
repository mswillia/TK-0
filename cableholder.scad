/**********************************
	File: CableHolder.scad
	Revision: 0.4 (2/2/2013)
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
thickness=10;
wall_thickness=3.4;
radius=4.8;
opening=4.8;

ratio = (extrusion_width/20);

/**********************************
		END CONFIGURATION
**********************************/

difference() {
	//Make our base unit
	union() {
		cylinder(r=radius+wall_thickness,h=thickness,$fn=100);
		translate([-2.7*ratio,radius+(4),0])
			cube([extrusion_opening,extrusion_wall,thickness]);
		translate([0,radius+extrusion_wall+3,0])
			linear_extrude(height=thickness)
				polygon(points=[[-extrusion_width/4,0],[-(extrusion_width/2)*0.3,3],[(extrusion_width/2)*0.3,3],[extrusion_width/4,0]]);
		translate([0,radius-(0.7),0])
			linear_extrude(height=thickness)
				polygon(points=[[-7.1,0],[-extrusion_width/2,2.9],[-extrusion_width/2,4.7],[extrusion_width/2,4.7],[extrusion_width/2,2.9],[7.1,0]]);
	
	}

	//Drill the hole
	drill(0,0,radius,thickness+overdrill*2);

	//This is actually slightly trapezoidal in the sketchup
	//4.8mm inside and 5.0mm outside...leaving it square for now
	translate([-opening/2,-(radius+wall_thickness+overdrill),-overdrill])
		union() {
			cube([opening,radius+wall_thickness+overdrill,thickness+overdrill*2]);

			translate([-1.5,2.5,-overdrill]) difference() {
				translate([0,-3,overdrill])
					cube([3,3,thickness+overdrill*2]);
				cylinder(r=1.5,h=thickness+overdrill*4,$fn=100);
			}
			translate([opening+1.5,2.5,-overdrill]) difference() {
				translate([-3,-3,overdrill])
					cube([3,3,thickness+overdrill*2]);
				cylinder(r=1.5,h=thickness+overdrill*4,$fn=100);
			}
		}
}
