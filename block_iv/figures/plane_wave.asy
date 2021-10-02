import three;
import labelpath3;
import graph3;

defaultpen(fontsize(8pt));

size(10cm,0);

// currentprojection=perspective(1.0*(6.0*cos(291*pi/180),6.0*sin(291*pi/180),4), up=X);
currentprojection=perspective((2,4,6), up=X);

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
draw((0,0,0) -- (4,0,0), arrow=Arrow3(TeXHead2), L=Label("$x$", position=EndPoint));
draw((0,0,0) -- (0,4,0), arrow=Arrow3(TeXHead2), L=Label("$y$", position=EndPoint));
draw((0,0,0) -- (0,0,9), arrow=Arrow3(TeXHead2), L=Label("$z$", position=EndPoint));

// Define parametric curve for E
triple e(real t) {
	return (2.0*cos(t - pi/2), 0, t);
}

// draw planes (fields are uniform over all planes)
real[] qq = {2, 4, 6, 8};
for (real q : qq)
{
    draw(surface((-3,-3,q) -- (-3,3,q) -- (3,3,q) -- (3,-3,q) -- cycle), surfacepen=paleblue+opacity(0.6));
}

// draw E field vectors
draw((-3,2,2) -- (-1,2,2), blue+linewidth(0.8), arrow=Arrow3(), L=Label("$\vec{E}$", blue, position=MidPoint, align=E));
draw((-2,2,4) -- (-1,2,4), blue+linewidth(0.8), arrow=Arrow3(), L=Label("$\vec{E}$", blue, position=MidPoint, align=E));
draw((-1,2,6) -- (-2,2,6), blue+linewidth(0.8), arrow=Arrow3(), L=Label("$\vec{E}$", blue, position=MidPoint, align=E));
draw((-1,2,8) -- (-3,2,8), blue+linewidth(0.8), arrow=Arrow3(), L=Label("$\vec{E}$", blue, position=MidPoint, align=E));

// v arrow
draw((2,-2,8.2) -- (2,-2,9.2), black+linewidth(0.4), arrow=Arrow3(), L=Label("$v$", position=MidPoint, align=N));
