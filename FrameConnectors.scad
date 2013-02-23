/**********************************
	File: FrameConnecters.scad
	Revision: 0.3 (2/2/2013)
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
ratio = (extrusion_width/20);
side = extrusion_width * 3.5;
outer_radius = 67.5 * ratio;

//For aligning the curved edge...probably a better way to do this
fudge_factor = 4.36 * ratio;

inner_radius = 72.5 * ratio;
inner_radius_bottom_left = 5 * ratio;
inner_radius_top_right = 0.5 * ratio;
inner_side = 28 * ratio;

thickness = 4;

/**********************************
		END CONFIGURATION
**********************************/
union() {
	difference() {
		cube([side, side, thickness]);
		translate([-(extrusion_width-fudge_factor),-(extrusion_width-fudge_factor),-overdrill])
			cylinder(r=outer_radius, h=thickness+overdrill*2, $fn=100);
			
		//Drill the holes
		drill(side-extrusion_width/2,side-(extrusion_width+8.5),screw_c_diameter/2,thickness+overdrill*2);
		drill(side-extrusion_width/2,8.5,screw_c_diameter/2,thickness+overdrill*2);
		drill(side-(extrusion_width+8.5),side-extrusion_width/2,screw_c_diameter/2,thickness+overdrill*2);
		drill(8.5,side-extrusion_width/2,screw_c_diameter/2,thickness+overdrill*2);
		
		//Make our cutout
		difference() {
			hull() {
				translate([side-extrusion_width-inner_radius_bottom_left,side-extrusion_width-inner_radius_bottom_left,-overdrill])
					cylinder(r=inner_radius_bottom_left, h=thickness+overdrill*2, $fn=100);
				translate([side-extrusion_width-(inner_side+inner_radius_bottom_left)-(inner_radius_top_right / 2),side-extrusion_width-(inner_radius_top_right / 2),-overdrill])
					cylinder(r=inner_radius_top_right, h=thickness+overdrill*2, $fn=100);
				translate([side-extrusion_width-(inner_radius_top_right / 2),side-extrusion_width-(inner_side+inner_radius_bottom_left)-(inner_radius_top_right / 2),-overdrill])
					cylinder(r=inner_radius_top_right, h=thickness+overdrill*2, $fn=100);
			}
			translate([-(extrusion_width-fudge_factor),-(extrusion_width-fudge_factor),-overdrill])
				cylinder(r=inner_radius, h=thickness+overdrill, $fn=100);
		}
	}
}


