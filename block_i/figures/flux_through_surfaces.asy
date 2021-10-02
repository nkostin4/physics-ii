defaultpen(fontsize(10pt));

import three;
import solids;
import graph3;
import labelpath3;

size(12cm,0);

currentprojection=perspective(2.5,0,8);

path3 edge = (0,0,0) -- (2,1,0) -- (3.5,1,0) -- (4.8,-0.5,0);

surface sides = extrude(edge, axis=2Z);
draw(sides, palegray+opacity(.5));

path3 gx = (0,0,1) -- (2,1,1);
draw(labelpath("X",subpath(gx,0.45,0.55),angle=270));

path3 gy = (2,1,1) --- (3.5,1,1);
draw(labelpath("Y", subpath(gy,0.4,0.6),angle=270));

path3 gz = (3.5,1,1) -- (4.8,-0.5,1);
draw(labelpath("Z", subpath(gz,0.47,0.53),angle=270));

real[] hard = {-1, 0, 1, 2, 3, 4, 5};

real[] soft = {-1, 0, 1, 2, 3};

for(real i : hard)
{
    for(real j : soft)
    {
        draw((i,-1,j) -- (i,2,j), red, arrow=Arrow3());
    }
}
