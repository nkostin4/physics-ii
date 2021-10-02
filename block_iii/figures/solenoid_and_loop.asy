import three;
import solids;
import graph3;

size(8cm,0);

currentprojection=perspective(1.0*(6.0*cos(291*pi/180),6.0*sin(291*pi/180),4), up=Z);

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

// solenoid
triple h(real t) {
    return (cos(t), sin(t), 0.09*t);
}

// draw solenoid
guide3 solenoid = graph(h, 0, 20pi, 900);
draw(solenoid, black+linewidth(1.0));
draw((0,0,10*0.09*pi) -- (1*cos(pi/4),1*sin(pi/4),10*0.09*pi), blue, arrow=Arrow3(), L=Label("$a$", position=0.8, align=N));

// label its length
path3 bracey = shift(0,1,0)*rotate(270,Z)*rotate(90,X)*path3(brace((0,0), (0, 0.09*20*pi)));
draw(bracey, blue);
label("$L$", position=midpoint(bracey), align=N, blue);

// draw loop
draw(circle(c=(0,0,10*0.09*pi), r=2.2, normal=Z), black+linewidth(1.0));
draw((0,0,10*0.09*pi) -- (2.2*cos(0),2.2*sin(0),10*0.09*pi), blue, arrow=Arrow3(), L=Label("$b$", position=0.8, align=N));
