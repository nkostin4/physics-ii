import three;
import solids;
import graph3;

size(8cm,0);

currentprojection=perspective(0,-9,6);

// solenoid
triple h(real t) {
    return (cos(t), sin(t), 0.09*t);
}

// draw solenoid
guide3 solenoid = graph(h, 0, 20pi, 900);
draw(solenoid);

// draw b field
draw((0,0,0) -- (0,0,5.655), blue, arrow=Arrow3(), L=Label("$\vec{B}$", position=EndPoint, align=N));

// draw vector potential
draw(arc(c=(0,0,2.5), (-1.5*sqrt(3)/2,-1.5/2,2.5), (1.5*sqrt(3)/2,-1.5/2,2.5), normal=Z), red, arrow=Arrow3(), L=Label("$A$", position=0.9, align=N));

// draw paths
path3 p1 = (-4,0,2) --- (-3,0,2) .. (-2*sqrt(3)/2,2/2,2) .. (-2/2,2*sqrt(3)/2,2) .. (0,2,2) .. (2/2,2*sqrt(3)/2,2) .. (2*sqrt(3)/2,2/2,2) .. (3,0,2) --- (4,0,2);
draw(p1, Arrow3(Relative(0.3)));
draw(p1, Arrow3(Relative(0.6)));
draw(p1, Arrow3(Relative(0.9)));
path3 p2 = (-4,0,2) --- (-3,0,2) .. (-2*sqrt(3)/2,-2/2,2) .. (-2/2,-2*sqrt(3)/2,2) .. (0,-2,2) .. (2/2,-2*sqrt(3)/2,2) .. (2*sqrt(3)/2,-2/2,2) .. (3,0,2) --- (4,0,2);
draw(p2, Arrow3(Relative(0.2)));
draw(p2, Arrow3(Relative(0.5)));
draw(p2, Arrow3(Relative(0.8)));
