import three;
import labelpath3;
import graph3;

defaultpen(fontsize(8pt));

size(6cm,0);

currentprojection=perspective((12.0,0.14,4.0), up=Y);

// this is the routine for drawing braces
real innerangle = radians(60);
real outerangle = radians(70);
real midangle = radians(0);
path brace(pair a, pair b, real amplitude = 0.14*length(b-a)) {
    transform t = identity();
    real length = length(b-a);
    real sign = 1;
    if (amplitude < 0) {
        sign=-1;
    }
    path brace = (0,0){expi(sign*outerangle)} :: {expi(sign*midangle)} (length/4, amplitude/2) :: {expi(sign*innerangle)} (length/2, amplitude) {expi(-sign*innerangle)} :: {expi(-sign*midangle)}(3*length/4, amplitude/2) :: {expi(-sign*outerangle)} (length,0);
    real angle = degrees(atan2((b-a).y, (b-a).x));
    t = rotate(angle)*t;
    t = shift(a)*t;
    return t*brace;	
}

real h = 4.0;   // height of the full cone
real radius = 2.0;  // base radius of the cone

// draw coordinate axis
draw((h/2)*Z -- -2*Z, arrow=Arrow3(TeXHead2), L=Label("$x$", position=EndPoint, align=N));

// Here's how I actually draw the half cone thingy
path3 oink = (radius*cos(0), radius*sin(0), 0) -- ((radius/2)*cos(0), (radius/2)*sin(0), h/2);
surface lampshade = surface(oink, c=O, axis=Z);
draw(lampshade, surfacepen=white+opacity(0.36));
// and the base of the cone
draw(scale3(radius)*unitdisk, surfacepen=white+opacity(0.36));
draw(circle(c=O, r=radius, normal=Z), black+linewidth(0.4pt));
draw(scale3(radius/2)*shift((h/2)*Z)*unitdisk, surfacepen=white+opacity(0.36));
draw(circle(c=(h/2)*Z, r=(radius/2), normal=Z), black+linewidth(0.4pt));

// draw the wire on either end of the cone
// draw((h/2)*Z -- (h/2)*Z+(0,0,1), brown+linewidth(2.0pt));
// draw(O -- O+(0,0,-3), brown+linewidth(2.0pt));

// draw brace to indicate height
// note that the first transformations to be applied
// should always be closest to the path3 routine
path3 hbrace = shift(radius*X)*rotate(90,Z)*rotate(90,X)*path3(brace((0,0), (0,h/2)));
draw(hbrace);
label("$h$", position=midpoint(hbrace), align=S);
draw((radius,0,h/2) -- (radius/2,0,h/2), black+dashed);

// draw brace to indicate base radius
path3 bbrace = rotate(270,Y)*path3(brace((0,0), (0,radius)));
draw(bbrace);
label("$a$", position=midpoint(bbrace), align=E);

// draw brace to indicate other base radius
path3 obrace = shift((h/2)*Z)*rotate(90,Y)*path3(brace((0,0), (0,radius/2)));
draw(obrace);
label("$\frac{a}{2}$", position=midpoint(obrace), align=W);
