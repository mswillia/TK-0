/**********************************
	File: Y_FrameConnector.scad
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
width=40;
height=19;
thickness=4;

//Back size
t_width=20;
t_height=20;

//Holes
radius=2.6;

/**********************************
		END CONFIGURATION
**********************************/
union() {
	//Make our base unit
	difference() {
		cube([width,height,thickness]);

		//Drill the hole
		drill(8.5,10,radius,thickness+overdrill*2);
		drill(width-8.5,10,radius,thickness+overdrill*2);
	}

	//Back unit
	translate([0,height,thickness])
		rotate([90,0,0])
			difference() {
				linear_extrude(height=thickness)
					polygon(points=[[0,0],[((width-t_width)/2),t_height],[t_width+((width-t_width)/2),t_height],[width,0]]);
				drill(width/2,11.5,radius,thickness+overdrill*2);

			}
}