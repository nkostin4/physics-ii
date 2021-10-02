import three;
import solids;
import graph3;

size(8cm,0);

currentprojection=perspective(4,4,9);

// helix
triple h(real t) {
    return (6*cos(t), 6*sin(t), t);
}

// parallel component of velocity
triple vpar(real t) {
    return (6*cos(t), 6*sin(t), t+1);
}

// perp component of velocity
triple vperp(real t) {
    return (6*cos(t)-2*sin(t), 6*sin(t)+2*cos(t), t);
}

// force is centripetal
triple f(real t) {
    return (4*cos(t), 4*sin(t), t);
}

// draw helical path
path3 helix = graph(h, 0, 4pi);
draw(helix);

// define some parametric values and call it tau
real[] tau = {0, pi/2, pi, 3*pi/2, 5*pi/2, 3*pi, 7*pi/2, 4*pi};

// draw the centripetal force
for (real t : tau)
{
    draw(h(t) -- f(t), red, arrow=Arrow3());
}

// draw the parallel velocity
for (real t : tau)
{
    draw(h(t) -- vpar(t), orange, arrow=Arrow3());
}

// draw the perp velocity
for (real t : tau)
{
    draw(h(t) -- vperp(t), heavygreen, arrow=Arrow3());
}

// labeled vectors
draw(h(2*pi) -- f(2*pi), red, arrow=Arrow3(), L=Label("$\vec{F}$", position=0.9, align=E));
draw(h(2*pi) -- vpar(2*pi), orange, arrow=Arrow3(), L=Label("$\vec{v}_{\parallel}$", position=0.9, align=N));
draw(h(2*pi) -- vperp(2*pi), heavygreen, arrow=Arrow3(), L=Label("$\vec{v}_{\perp}$", position=0.9));

// draw b field
draw(4*pi*Z -- -2*Z, blue, arrow=Arrow3(), L=Label("$\vec{B}$", position=1.0, align=S));
