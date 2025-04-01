module honeycomb(numx = 15, numy = 10, size = 5, gap = 1) {
    height = sqrt(size^2 - (size/2)^2);
    for (x = [0:1:numx]) {
        for (y = [0:1:numy]) {
            trx = x * size * 1.5;
            try = (y * height * 2) + (x % 2 == 1 ? height : 0);
            translate([trx,try,0])
            offset(-gap)
            circle(r=size, $fn=6);
        }
    }
}

honeycomb();