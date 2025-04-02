module honeycomb(x, y, z=1, size=5, spacing=1) {
    
    circumradius = size / sqrt(3);
    
    numx = (x / size) + 1;
    numy = (y / circumradius * 2/3) + 1;
        
    linear_extrude(z)
    difference() {
        square([x, y], center=false);
        for (ix = [0:1:numx-1]) {
            for (iy = [0:1:numy-1]) {
                trx = (ix * size) + (iy % 2 == 1 ? size/2 : 0);
                try = iy * circumradius * 1.5;
                
                translate([trx,try,0])
                offset(-spacing/2)
                rotate([0,0,30])
                circle(r=circumradius, $fn=6);
            }
        }
    }
    
    
}

honeycomb(x=218, y=50, size=5, spacing=1);