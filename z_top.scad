/**********************************
	File: Z_Top.scad
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
base=[extrusion_width+0.1,60,4];
middle=[122,20,10];

/**********************************
		END CONFIGURATION
**********************************/

difference() { 
	union() {
		cube(middle);
		translate([middle[0]/2,middle[1],0]) 
			difference() {
				cylinder(r=13.1,h=middle[2],$fn=100);
				translate([-10,12.65,-overdrill])
					cube([20,5,middle[2]+overdrill*2]);
			}
	}
	translate([middle[0]/2,middle[1],-overdrill]) 
		cylinder(r=smooth_rod_diameter/2,h=middle[2]+overdrill*2,$fn=100);
		
	translate([base[0]/2+((middle[1]/2-base[2])), (middle[1]-2*((middle[1]/2-base[2])))/2, middle[2]*0.3]) {
		cube([(middle[0]/3)-(middle[1]/2-base[2]),2*((middle[1]/2-base[2])),middle[2]]);
		translate([0,(middle[1]/2-base[2]),0])
			cylinder(r=((middle[1]/2-base[2])),h=middle[2],$fn=100);
		translate([(middle[0]/3)-(middle[1]/2-base[2]),(middle[1]/2-base[2]),0])
			cylinder(r=((middle[1]/2-base[2])),h=middle[2],$fn=100);
	}
	
	translate([middle[0]-((middle[0]/3)-(middle[1]/2-base[2])+base[0]/2+((middle[1]/2-base[2]))), (middle[1]-2*((middle[1]/2-base[2])))/2, middle[2]*0.3]) {
		cube([(middle[0]/3)-(middle[1]/2-base[2]),2*((middle[1]/2-base[2])),middle[2]]);
		translate([0,(middle[1]/2-base[2]),0])
			cylinder(r=((middle[1]/2-base[2])),h=middle[2],$fn=100);
		translate([(middle[0]/3)-(middle[1]/2-base[2]),(middle[1]/2-base[2]),0])
			cylinder(r=((middle[1]/2-base[2])),h=middle[2],$fn=100);
	}
	
	translate([0,middle[1]+smooth_rod_diameter*2,0])
		rotate([90,0,0])
			drill(middle[0]/2,middle[2]/2,screw_c_diameter/2,smooth_rod_diameter*2);
}

translate([0,(middle[1]-screw_c_diameter)/4,0])
	rotate([90,0,0])
		linear_extrude(height=(middle[1]-screw_c_diameter)/4)
			polygon(points=[[0,middle[2]],[0,middle[2]+base[0]/2],[base[0]/2,middle[2]]],paths=[[0,1,2]]);
			
translate([0,middle[1],0])
	rotate([90,0,0])
		linear_extrude(height=(middle[1]-screw_c_diameter)/4)
			polygon(points=[[0,middle[2]],[0,middle[2]+base[0]/2],[base[0]/2,middle[2]]],paths=[[0,1,2]]);

translate([middle[0]+base[0]/2,(middle[1]-screw_c_diameter)/4,middle[2]])
	rotate([0,-90,90])
		linear_extrude(height=(middle[1]-screw_c_diameter)/4)
			polygon(points=[[0,middle[2]],[0,middle[2]+base[0]/2],[base[0]/2,middle[2]]],paths=[[0,1,2]]);
			
translate([middle[0]+base[0]/2,middle[1],middle[2]])
	rotate([0,-90,90])
		linear_extrude(height=(middle[1]-screw_c_diameter)/4)
			polygon(points=[[0,middle[2]],[0,middle[2]+base[0]/2],[base[0]/2,middle[2]]],paths=[[0,1,2]]);

translate([0,base[1],0]) {
	rotate([90,-90,0])
		difference() { 
			Lbracket(base[0],base[0],base[1],base[2]);
			rotate([-90,0,-90]) {
				drill(-(base[0]-extrusion_width/2+base[2]),-extrusion_width/2,screw_c_diameter/2,base[2]+overdrill*2);
				drill(-(base[0]-extrusion_width/2+base[2]),-base[1]+extrusion_width/2,screw_c_diameter/2,base[2]+overdrill*2);
				translate([-base[2],0,0])
					rotate([0,90,0]){
						drill(-(base[0]-extrusion_width/2+base[2]), -extrusion_width/2, screw_c_diameter/2 ,base[2]+overdrill*2);					
						drill(-(base[0]-extrusion_width/2+base[2]),-base[1]+extrusion_width/2,screw_c_diameter/2,base[2]+overdrill*2);
					}
			}
		}

	translate([middle[0],0,0])
		rotate([90,0,0])
			difference() { 
				Lbracket(base[0],base[0],base[1],base[2]);
				rotate([-90,0,-90]) {
					drill(-(base[0]-extrusion_width/2+base[2]),-extrusion_width/2,screw_c_diameter/2,base[2]+overdrill*2);
					drill(-(base[0]-extrusion_width/2+base[2]),-base[1]+extrusion_width/2,screw_c_diameter/2,base[2]+overdrill*2);
					translate([-base[2],0,0])
						rotate([0,90,0]){
							drill(-(base[0]-extrusion_width/2+base[2]), -extrusion_width/2, screw_c_diameter/2 ,base[2]+overdrill*2);					
							drill(-(base[0]-extrusion_width/2+base[2]),-base[1]+extrusion_width/2,screw_c_diameter/2,base[2]+overdrill*2);
						}
				}
			}
}