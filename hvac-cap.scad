include <BOSL2/std.scad>

$fn=16;

width = 59;
height = 40;
depth = 30;
hole = 6;
wall = 5;
rounding = 4;


difference() {
    // outer box
    cuboid([wall+width+wall, wall+depth, wall+height+wall], rounding=rounding);
    
    // inside
    translate([0,wall,0])
    cube([width, depth, height], center=true);
    
    // washer inset
    translate([0,0,height/2+wall-1])
    cylinder(h=2, r=(depth-5)/2);
    
    // hole for screw
    cylinder(h=height, r=hole/2);
}