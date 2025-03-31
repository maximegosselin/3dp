include <BOSL2/std.scad>

$fn=32;

monitor_x = 218;
monitor_y = 166;
monitor_z = 5;
bl_x = 103;
bl_y = 116;
bl_z = 40;
cr_x = 61;
cr_y = 96;
cr_z = 19;
thickness = 4;
height = 60;
corner_radius = 2;
gap = 0.2;

module enclosure() {
    difference() {
        // outer walls
        linear_extrude(height)
        difference() {
            shape_enclosure_base();
            offset(r=-thickness)
            shape_enclosure_base();
        }
        
        // beelink hole
        translate([-(monitor_x/2 - thickness/2),0,20])
        rotate([90,0,90])
        cuboid([80,22,thickness*2], rounding=corner_radius, edges="Z");
        
        // wires hole
        translate([70,monitor_y/2 + thickness/2,30])
        rotate([90,0,0])
        cylinder(thickness*2, r=20);
    }
}
 
enclosure();
 
module shape_enclosure_base() {
    rect([monitor_x, monitor_y], rounding=corner_radius);
}