/**********************************
	File: bedfanmount.scad
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
thickness=3;
width=172;
height=112;

//Fan configuration
hole_spacing=72;
hole_radius=2;
fan_hole_radius=38.5;

//Plastic saving hole size
ps_width=29;
ps_height=92;

/**********************************
		END CONFIGURATION
**********************************/

difference() {

	//Make our base unit
	union() {
		cube([width,height,thickness]);
		tabs();
		translate([width,height,0])
			rotate([0,0,180])
				tabs();
	}

	//Drill the fan holes
	drill(((width-hole_spacing)/2),((height-hole_spacing)/2),hole_radius,thickness+overdrill*2);
	drill(((width-hole_spacing)/2),height-((height-hole_spacing)/2),hole_radius,thickness+overdrill*2);
	drill(width-((width-hole_spacing)/2),((height-hole_spacing)/2),hole_radius,thickness+overdrill*2);
	drill(width-((width-hole_spacing)/2),height-((height-hole_spacing)/2),hole_radius,thickness+overdrill*2);
	translate([width/2,height/2,-overdrill])
		cylinder(r=fan_hole_radius,h=thickness+overdrill*2,$fn=100);
		
	//Save some plastic?
	translate([11,((height-ps_height)/2),-overdrill])
		holes();
	translate([width-(11+ps_width),((height-ps_height)/2),-overdrill])
		holes();
}

//The small tabs on the board
module tabs() {
	translate([0,0,thickness])
		cube([5,10,thickness]);
	translate([0,((height-10)/2),thickness])
		cube([5,10,thickness]);
	translate([0,(height-10),thickness])
		cube([5,10,thickness]);
	translate([5,((height-10)/2),thickness])
		difference() {
			union() {
				cube([6,10,4.9]);
				translate([0,5,5])
					rotate([0,90,0])
						cylinder(r=5, h=6,$fn=100);
			}
			translate([0,5,5])
				rotate([0,90,0])
					drill(0,0,1.8,6+overdrill*2);
		}
}

//Make a filled arc
module arc(height, width, thickness) {
	radius=(height/2) + (width*width/(8*height));
	translate([0,height-radius,0]) difference() {
		cylinder(r=radius,h=thickness,$fn=100);
		translate([-radius-overdrill,-radius-overdrill,-overdrill])
			cube([radius*2+overdrill*2,(radius*2)-height,thickness+overdrill*2]);
	}
}

//The round ended rectangular holes
module holes() {
	hw_ratio=10/29; //ratio for rounded edge
	translate([0,ps_width*hw_ratio,0])
		union() {
			translate([ps_width/2,ps_height-(2*hw_ratio*ps_width),0])
				arc(ps_width*hw_ratio,ps_width,thickness+overdrill*2);
			cube([ps_width,ps_height-(2*hw_ratio*ps_width),thickness+overdrill*2]);
			translate([ps_width/2,0,0])
				rotate([0,0,180])
					arc(ps_width*hw_ratio,ps_width,thickness+overdrill*2);
		}
}