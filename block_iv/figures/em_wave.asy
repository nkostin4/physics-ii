import three;
import labelpath3;
import graph3;

defaultpen(fontsize(8pt));

size(10cm,0);

// currentprojection=perspective(1.0*(6.0*cos(291*pi/180),6.0*sin(291*pi/180),4), up=X);
currentprojection=perspective((2,4,3.2*pi), up=X);

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
draw((0,0,0) -- (0,0,14), arrow=Arrow3(TeXHead2), L=Label("$z$", position=EndPoint));

// This is how one executes a brace
// path3 brace = shift(-0.2,R*sin(pi/4)*sin(0),0)*rotate(90,X)*path3(brace((R*sin(pi/4)*cos(0),R*cos(pi/4)), (R*sin(pi/4)*cos(0),R*cos(pi/4)+E0)));
// draw(brace);
// label("$E_o$", position=midpoint(brace), align=W);

// Now onto the good stuff.
// This pretty much has a lot of good stuff
// lmao

// Define parametric curve for E
triple e(real t) {
	return (2.0*cos(t - pi/2), 0, t);
}

// draw E and it's vectors
real[] uu = {0, 1, 2, 3};
real[] ss = {1/4, 1/2, 3/4};
for (real u : uu)
{
    path3 e_wave = graph(e, u*pi, (u+1)*pi, operator ..);
    draw(e_wave, blue);
    path3 e_fillregion = (0,0,u*pi) -- e_wave -- (0,0,(u+1)*pi) -- cycle;
    draw(surface(e_fillregion), surfacepen=blue+opacity(0.4));
    for (real s : ss)
    {
        draw((0,0,(u+1)*pi - s*pi) -- (2.0*cos(((u+1)*pi - s*pi) - pi/2),0,(u+1)*pi - s*pi), blue+linewidth(0.4), arrow=Arrow3());
    }
}

// E_o dotted line
draw((2.0,0,0) -- (2.0,0,4*pi), dashed+black, L=Label("$E_o$", position=BeginPoint));

// label E
label(Label("$\vec{E}$", blue, position=EndPoint), p=fontsize(28pt), (0,0,pi/2) -- (2,0,pi/2));

// Define parametric curve for B
triple b(real t) {
	return (0, 1.5*cos(t - pi/2), t);
}

// draw B
real[] vv = {0, 1, 2, 3};
real[] rr = {1/4, 1/2, 3/4};
for (real v : vv)
{
    path3 b_wave = graph(b, v*pi, (v+1)*pi, operator ..);
    draw(b_wave, red);
    path3 b_fillregion = (0,0,v*pi) -- b_wave -- (0,0,(v+1)*pi) -- cycle;
    draw(surface(b_fillregion), surfacepen=red+opacity(0.4));
    for (real r : rr)
    {
        draw((0,0,(v+1)*pi - r*pi) -- (0,1.5*cos(((v+1)*pi - r*pi) - pi/2),(v+1)*pi - r*pi), red+linewidth(0.4), arrow=Arrow3());
    }
}

// B_o dotted line
draw((0,1.5,0) -- (0,1.5,4*pi), dashed+black, L=Label("$E_o/c$", position=BeginPoint, align=N));

// label B
label(Label("$\vec{B}$", red, position=EndPoint, align=S), p=fontsize(18pt), (0,0,pi/2) -- (0,1.5,pi/2));

// c arrow
draw((3,0,9) -- (3,0,12), black+linewidth(0.4), arrow=Arrow3(), L=Label("$c$", position=MidPoint, align=N));
