defaultpen(fontsize(10pt));

import three;
import solids;
import graph3;

size(8cm,0);

currentprojection=perspective(2,2,2);

draw(surface((-1,-1,0) -- (-1,1,0) -- (1,1,0) -- (1,-1,0) -- cycle), palegray+opacity(.5));

draw(O -- Z, arrow=Arrow3(), L=Label("$\vec{A}$", position=EndPoint));
