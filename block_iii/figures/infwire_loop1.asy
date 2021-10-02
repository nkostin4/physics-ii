import graph3;
import three;
import solids;

size(8cm,0);

currentprojection=perspective(0,0,24);

triple bn(real rho, real phi, real z) {
    return (rho*cos(phi)-1.8*sin(phi), rho*sin(phi)+1.8*cos(phi), z);
}

triple bf(real rho, real phi, real z) {
    return (rho*cos(phi)-1*sin(phi), rho*sin(phi)+1*cos(phi), z);
}

triple h(real rho, real phi, real z) {
    return (rho*cos(phi), rho*sin(phi), z);
}

// define some angles
real[] phi1 = {0, pi/4, pi/2, 3*pi/4, pi, 5*pi/4, 3*pi/2, 7*pi/4};

// define some z
real[] zz = {0, 2, 4, 6, 8, 10, 12, 14, 16};

for (real u : phi1)
{
    for (real w : zz)
    {
        draw(h(2,u,w) -- bn(2,u,w), blue+linewidth(0.4), arrow=Arrow3());
    }
}

// define some more angles
real[] phi2 = {0, pi/8, 2*pi/8, 3*pi/8, 4*pi/8, 5*pi/8, 6*pi/8, 7*pi/8, pi, 9*pi/8, 10*pi/8, 11*pi/8, 12*pi/8, 13*pi/8, 14*pi/8, 15*pi/8};

for (real u : phi2)
{
    for (real w : zz)
    {
        draw(h(4,u,w) -- bf(4,u,w), blue+linewidth(0.4), arrow=Arrow3());
    }
}

// draw infinite wire
// draw((0,0,0) -- (0,0,16), black+linewidth(0.6));

// label current
draw((0,0,0) -- (0,0,8), red+linewidth(0.8), arrow=Arrow3());
draw((0,0,8) -- (0,0,17), red+linewidth(0.8), arrow=Arrow3(), L=Label("$I$", position=1.00), align=W);

// draw Amperian loop
draw((3.8,3.8,8) -- (3.8,-3.8,8) -- (-3.8,-3.8,8) -- (-3.8,3.8,8) -- (3.8,3.8,8), black+linewidth(2.4));
