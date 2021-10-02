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

draw((0,0,0) -- (0,1,0), arrow=Arrow3, black, L=Label("$a$", position=0.5));
draw((0,0,0) -- (0,2*cos(45),2*sin(45)), arrow=Arrow3, black, L=Label("$b$", position=0.75));
