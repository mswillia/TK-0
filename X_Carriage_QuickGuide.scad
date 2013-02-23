/**********************************
	File: X_Carriage_QuickGuide.scad
	Revision: 0.2(2/3/2013)
	OpenSCAD version by:
	Michael Williams (gannon)
	mswillia@mtu.edu
**********************************/
include <config.scad>
use <functions.scad>
/**********************************
		CONFIGURATION
**********************************/
base=[100,27,6];
corner=5.72;
offset=16;
/**********************************
		END CONFIGURATION
**********************************/

difference() {
	cube(base);
	translate([corner,base[1],0])
		roundedcorner(corner,base[2],0);
	translate([base[0]-corner,base[1],0])
		roundedcorner(corner,base[2],90);
	translate([corner,base[1]-corner,-overdrill])
		cube(base[0]-2*corner,corner,base[2]+overdrill*2);
	polyhedron(points=[[corner,base[1]-corner-base[2],base[2]+overdrill],[corner,base[1]-corner,-overdrill],[corner,base[1],base[2]+overdrill],[base[0]/2,offset-base[2],base[2]+overdrill],[base[0]/2,offset,-overdrill],[base[0]/2,base[1],base[2]+overdrill],[base[0]-corner,base[1]-corner-base[2],base[2]+overdrill],[base[0]-corner,base[1]-corner,-overdrill],[base[0]-corner,base[1],base[2]+overdrill],[corner,base[1],-overdrill],[base[0]/2,base[1],-overdrill],[base[0]-corner,base[1],-overdrill]],triangles = [[0,2,5],   [0,1,2],  [0,5,3],  [0,4,1],   [0,3,4],[3,5,6],   [6,5,8],  [3,6,4],  [4,6,7],   [6,8,7],[1,9,2],   [2,9,10],  [2,10,5],  [7,8,11],  [8,5,10],  [11,8,10],[1,10,9],   [1,4,10],  [4,7,10],  [7,11,10]]);

	drill(4.5,5,screw_a_diameter/2,base[2]+overdrill*2);
	drill(30.5,5,screw_a_diameter/2,base[2]+overdrill*2);
	drill(base[0]-4.5,5,screw_a_diameter/2,base[2]+overdrill*2);
	drill(base[0]-30.5,5,screw_a_diameter/2,base[2]+overdrill*2);
}