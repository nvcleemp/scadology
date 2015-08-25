/**
 *  Create a vertex at the specified coordinate p.
 */
module vertex(p, r=2, $fa=30, $fs=0.5) {
    translate(p) sphere(r=r);
}

/**
 *  Create an edge between the specified coordinates p1 and p2.
 */
module edge(p1, p2, r=1, $fa=30, $fs=0.5) {
    edge_length = sqrt(pow(p2[0]-p1[0], 2) + pow(p2[1]-p1[1], 2) + pow(p2[2]-p1[2], 2));
    b = acos((p2[2]-p1[2])/edge_length);
    c = (p2[0]==p1[0]) ? sign(p2[1]-p1[1])*90 : ((p2[0]>p1[0]) ? atan((p2[1]-p1[1])/(p2[0]-p1[0])) : atan((p2[1]-p1[1])/(p2[0]-p1[0]))+180);
    translate(p1) rotate([0, b, c]) cylinder(h=edge_length, r=r);
}

//============ Usage ============//

vertex([0, 0, 0]);
vertex([0, 0, 10]);
edge([0, 0, 0], [0, 0, 10]);

vertex([10, 0, 0], r=3);
vertex([10, 0, 10], r=3);
edge([10, 0, 0], [10, 0, 10], r=3);
