defaultpen(fontsize(8pt));

import three;
import solids;
import graph3;

size(8cm,0);

currentprojection=perspective(6,-6,9);

draw(-7X -- 7X, arrow=Arrow3(TeXHead2), L=Label("$x$", position=EndPoint, align=N));
draw(-7Y -- 7Y, arrow=Arrow3(TeXHead2), L=Label("$y$", position=EndPoint));
draw(-2Z -- 10Z, arrow=Arrow3(TeXHead2), L=Label("$z$", position=EndPoint));

// Cross section for ring of charge
real radius = 0.1;
path3 cross_section = Circle(r = radius, c=(5,0,0), normal=Y);

// Red ring of charge
surface ring_of_charge = surface(cross_section, c=O, axis=Z);
draw(ring_of_charge, red);

// Draw r vector
// draw((5/sqrt(2),5/sqrt(2),0) -- (0,0,8), arrow=Arrow3, blue, L=Label("$\vec{r}$", position=0.5));

// Label the point P
label("$P$", (0, 0, 8), align=W);
surface pointp = scale3(0.1)*unitsphere;
draw(shift((0,0,8))*pointp, black);

// Label the point (Rcos(theta), Rsin(theta), 0)
// label("$(R\cos{\theta}, R\sin{\theta}, 0)$", (5/sqrt(2),5/sqrt(2),0), red, align=E);
// label("$N$ turns", (5/sqrt(2),5/sqrt(2),0), red, align=E);

// R and theta
draw(O -- (5/sqrt(2), 5/sqrt(2), 0), black, L=Label("$R$", position=0.75, align=N));
// draw(arc(c=O, (3,0,0), (3/sqrt(2),3/sqrt(2),0)), dashed, L=Label("$\theta$", position=0.5));

// Current arcs
draw(arc(c=O, (-5.4/2,5.4*sqrt(3)/2,0), (-5.4*sqrt(3)/2,5.4/2,0)), red, arrow=Arrow3(), L=Label("$I$", position=0.75, align=N));
draw(arc(c=O, (-5.4*sqrt(3)/2,-5.4/2,0), (-5.4/2,-5.4*sqrt(3)/2,0)), red, arrow=Arrow3(), L=Label("$I$", position=0.75, align=W));
draw(arc(c=O, (5.4/2,-5.4*sqrt(3)/2,0), (5.4*sqrt(3)/2,-5.4/2,0)), red, arrow=Arrow3(), L=Label("$I$", position=0.5));
draw(arc(c=O, (5.4*sqrt(3)/2,5.4/2,0), (5.4/2,5.4*sqrt(3)/2,0)), red, arrow=Arrow3(), L=Label("$I$", position=0.75, align=E));
