import three;
import solids;
import graph3;

size(8cm,0);

currentprojection=perspective(6,4,3);

// draw the conducting bar
draw(shift(O)*align(unit(X))*scale(0.25,0.25,8)*unitcylinder, surfacepen=white+opacity(0.4));
draw(shift((8,0,0))*align(unit(X))*scale3(0.25)*unitdisk, surfacepen=white+opacity(0.4));
draw(shift((0,0,0))*align(unit(X))*scale3(0.25)*unitdisk, surfacepen=white+opacity(0.4));

// draw velocity vector
draw((4,0,0) -- (4,4,0), arrow=Arrow3(), heavygreen, L=Label("$\vec{v}$", position=EndPoint));

// draw b field
draw((4,0,0) -- (4,0,-2), blue, arrow=Arrow3(), L=Label("$\vec{B}$", position=EndPoint));

// draw force vector
draw((4,0,0) -- (2,0,0), red, arrow=Arrow3(), L=Label("$\vec{F}_B$", position=EndPoint));

// charges
path3 p = (0.5,0,0) -- (7.5,0,0);
Label PosCharge = Label("+", red, position=BeginPoint, align=(1,-0.5,0.25));
label(PosCharge,p);
Label NegCharge = Label("$-$", blue, position=EndPoint, align=(-1,-0.5,0));
label(NegCharge,p);
