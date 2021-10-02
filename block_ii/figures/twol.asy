import three;
import labelpath3;
import graph3;

defaultpen(fontsize(8pt));

size(6cm,0);

currentprojection=perspective(2*(0.995,0.098,0), up=Z);

surface inner_conductor = scale3(1.0)*unitsphere;
surface outer_conductor = scale3(2.0)*unitsphere;

draw(inner_conductor, red+opacity(.3));
draw(outer_conductor, blue+opacity(.2));

draw((0,0,0) -- (0,0,1), arrow=Arrow3, black, L=Label("$a$", position=0.5));
draw((0,0,0) -- (0,2*cos(45),2*sin(45)), arrow=Arrow3, black, L=Label("$b$", position=0.9));

// Draw big sigma
real R = 1;
real R_big = 2;
triple f1(pair t) {return (R*cos(t.x),R*sin(t.x),t.y);}
triple f2(pair t) {return (R_big*cos(t.x),R_big*sin(t.x),t.y);}
surface s=surface(f1,(0,0),(2pi,2),8,8,Spline);
surface s_big=surface(f2,(0,0),(2pi,2),8,8,Spline);
string lo="$+Q$";
string hi="$-Q$";
real h=0.0125;
draw(surface(rotate(2)*xscale(0.1)*yscale(0.2)*lo,s,-pi/4-1.5*pi/20,0.5,h), red);
draw(surface(rotate(2)*xscale(0.07)*yscale(0.2)*hi,s_big,-pi/4-1.5*pi/20,0.5,h), blue);
