import three;
import labelpath3;
import graph3;

defaultpen(fontsize(8pt));

size(6cm,0);

currentprojection=perspective((6.0,2.8,6.0), up=Y);

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

// draw coordinate axis
// draw(-1X -- 4X, arrow=Arrow3(TeXHead2), L=Label("$x$", position=EndPoint));
// draw(-1Y -- 4Y, arrow=Arrow3(TeXHead2), L=Label("$y$", position=EndPoint));
// draw(-1Z -- 4Z, arrow=Arrow3(TeXHead2), L=Label("$z$", position=EndPoint, align=N));

real h = 4.0;   // height of the cone
real radius = 2.0;  // base radius of the cone

// parametric equations for a cone lol
triple G(pair uv) {
    real u = uv.x;
    real phi = uv.y;
    return (((h-u)/h)*radius*cos(phi),((h-u)/h)*radius*sin(phi),u);
}

// I'm a stupid brainlet
// Here's how I actually draw the cone
surface cone = surface(G, (0,0), (h,2*pi), Spline);
draw(cone, surfacepen=white+opacity(0.36));
// and the base of the cone
draw(scale3(radius)*unitdisk, surfacepen=white+opacity(0.36));

// draw the wire on either end of the cone
draw(h*Z -- h*Z+(0,0,1), brown+linewidth(2.0pt));
draw(O -- O+(0,0,-3), brown+linewidth(2.0pt));

// draw brace to indicate height
// note that the first transformations to be applied
// should always be closest to the path3 routine
path3 hbrace = shift(radius*X)*rotate(180,Z)*rotate(90,X)*path3(brace((0,0), (0,h)));
draw(hbrace);
label("$h$", position=midpoint(hbrace), align=E);

// draw brace to indicate base radius
path3 bbrace = path3(brace((0,0), (0,radius)));
draw(bbrace);
label("$a$", position=midpoint(bbrace), align=W);
