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
height = 50;
corner_radius = 2;

module beelink() {
    cube([bl_x, bl_y, bl_z], center=true);
}

module enclosure_base_shape() {
    d = 2 * corner_radius;
    minkowski() {
        square([monitor_x - d, monitor_y - d], center=true);

        circle(r=corner_radius);
    }
}

module enclosure_walls() {
    linear_extrude(height)
    difference() {
        enclosure_base_shape();
        offset(r=-thickness)
        enclosure_base_shape();
    }
}

enclosure_walls();