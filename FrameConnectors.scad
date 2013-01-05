/**********************************
	File: FrameConnecters.scad
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
side=60;
flat=20;
thickness=4;

//Holes
radius=2.6;

/**********************************
		END CONFIGURATION
**********************************/
union() {
	//Make our base unit
	difference() {
		linear_extrude(height=thickness)
			polygon(points=[[0,0],[side,0],[side,flat],[flat,side],[0,side]]);

		//Drill the hole
		drill(flat/2,8.5,radius,thickness+overdrill*2);
		drill(flat+8.5,flat/2,radius,thickness+overdrill*2);
		drill(side-8.5,flat/2,radius,thickness+overdrill*2);
		drill(flat/2,side-8.5,radius,thickness+overdrill*2);

		translate([flat+5.3,flat,-overdrill])
			multiradiusroundedpoly([[0,0,5.3],[2.5-5.3,21.7,2.5],[21.9,2.4-5.3,2.4]],thickness+overdrill*2);
	}
}