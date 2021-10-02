import three;
import solids;
import graph3;

size(8cm,0);

currentprojection=perspective(6,4,3);

// draw the conducting bar
draw(shift(O)*align(unit(X))*scale(0.25,0.25,8)*unitcylinder, surfacepen=white);
draw(shift((8,0,0))*align(unit(X))*scale3(0.25)*unitdisk, surfacepen=white);
draw(shift((0,0,0))*align(unit(X))*scale3(0.25)*unitdisk, surfacepen=white);

// draw(scale3(0.2)*unitsphere, blue);

// draw velocity vector
draw((4,0,0) -- (4,4,0), arrow=Arrow3(), heavygreen, L=Label("$\vec{v}$", position=EndPoint));

real[] uu = {-0.1, 1.95, 4, 6.05, 8.1};
real[] vv = {-2, -1, 0, 1};

for (real u : uu)
{
    for (real v : vv)
    {
        draw((u,v,2) -- (u,v,-2), blue, arrow=Arrow3());
    }
}

draw((8.1,1,2) -- (8.1,1,-2), blue, arrow=Arrow3(), L=Label("$\vec{B}$", position=EndPoint));
