import graph3;
import three;
import solids;

size(12cm,0);

currentprojection=perspective((5,11,5), up=X);
// currentprojection=perspective((8.0*cos(315*pi/180),8.0*sin(315*pi/180),0), up=Z);

// draw duracell battery
draw(extrude(circle(c=O, r=1/2, normal=Z), axis=2.4Z), black);
draw(extrude(circle(c=(0,0,2.4), r=1/2, normal=Z), axis=0.1Z), mediumgray);
draw(extrude(circle(c=(0,0,2.5), r=1/2, normal=Z), axis=1Z), orange);
draw(scale3(1/2)*unitdisk, surfacepen=lightgray);
draw(shift(0,0,3.5)*scale3(1/2)*unitdisk, surfacepen=lightgray);
draw(extrude(circle(c=(0,0,3.5), r=1/9, normal=Z), axis=0.1Z), lightgray);
draw(shift(0,0,3.6)*scale3(1/9)*unitdisk, surfacepen=lightgray);
// label the battery
// label(Label("Battery", black, position=EndPoint), p=fontsize(38pt),(0,0,0) -- (0.8,0,3.4));

// draw some freaking wires man
draw((0,0,3.6) -- (0,0,5), black+linewidth(1.8));
draw((0,0,5) -- (5,0,5), black+linewidth(1.8));
draw((0,0,0) -- (0,0,-3), black+linewidth(1.8));
draw((0,0,-3) -- (5,0,-3), black+linewidth(1.8));

// draw the capacitor lmao
draw(shift(5-0.6,-0.6,3)*scale3(1.2)*unitplane, surfacepen=lightgray);
draw(shift(5-0.6,-0.6,2)*scale3(1.2)*unitplane, surfacepen=lightgray);
// label the capacitor
// label(Label("Capacitor", black, position=EndPoint), p=fontsize(38pt),(0,0,0) -- (5.6,0,3));

// and some more wires
draw((5,0,3) -- (5,0,5), black+linewidth(1.8));
draw((5,0,2) -- (5,0,-3), black+linewidth(1.8));

// draw the amperian loop
draw(circle(c=(5,0,-0.5), r=1.0, normal=Z), blue+linewidth(2.2));
// label the amperian loop
// label(Label("Amperian loop", blue, position=EndPoint), p=fontsize(38pt),(0,0,0) -- (6,0,-0.5));

// draw surface
draw(shift(5,0,-0.5)*scale3(1.0)*unitdisk, surfacepen=blue+opacity(0.3));
