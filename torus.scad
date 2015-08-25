module basic_torus(radius, thickness, $fa=30, $fs=0.5, $fn1=36, $fn2=12){
    rotate_extrude(convexity = 10, $fn = $fn1)
    translate([radius, 0, 0])
    circle(r = thickness, $fn=$fn2);
}

module torus(center, normal, radius, thickness, $fa=30, $fs=0.5, $fn1=36, $fn2=12){
    normal_length = sqrt(pow(normal[0], 2) + pow(normal[1], 2) + pow(normal[2], 2));
    b = acos(normal[2]/normal_length);
    c = (normal[0]==0) ? sign(normal[1])*90 : ((normal[0]>0) ? atan(normal[1]/normal[0]) : atan(normal[1]/normal[0])+180);
    translate(center) rotate([0, b, c]) basic_torus(radius, thickness, $fa, $fs, $fn1, $fn2);
}

module torus_through_point(center, p, normal_rotation, thickness, $fa=30, $fs=0.5, $fn1=36, $fn2=12){
    radius = distance(center, p);
    z = 0;
    x = 1;
    y = -x*(center[0]-p[0])/(center[1]-p[1]);
    torus(center, [x,y,z], radius, thickness, $fa, $fs, $fn1, $fn2);
}

//============ Usage ============//

torus([0, 0, 0], [0, 0, 1], 10, 1);
torus([10, 0, 0], [0, 1, 0], 10, 1);
