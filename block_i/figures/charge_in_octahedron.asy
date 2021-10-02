import three;
import graph3;

size(6cm,0);

currentprojection=perspective(2*(0.995,0.098,0), up=Z);

surface pointcharge = scale3(0.1)*unitsphere;
draw(pointcharge, surfacepen = red);
draw(O -- 0.1*X, red, L=Label("$+q$", position=EndPoint,
align=NE));

triple f(pair uv) {
	real u = uv.x; real v = uv.y;
	return (sqrt(1)*sin(u)*cos(v), sqrt(1)*sin(u)*sin(v), sqrt(1)*cos(u));
}

path3 vector(pair z) {
	triple v = f(z);
	return O -- (v.x, v.y, v.z);
}

add(vectorfield(vector, f, (0,0), (pi, 2pi), 16, 0.25, red, render(merge=true)));

draw(surface((0,0,1.6) -- (1,1,0) -- (-1,1,0) -- cycle), palegray+opacity(.5));
draw(surface((0,0,1.6) -- (1,1,0) -- (1,-1,0) -- cycle), palegray+opacity(.5));
draw(surface((0,0,1.6) -- (1,-1,0) -- (-1,-1,0) -- cycle), palegray+opacity(.5));
draw(surface((0,0,1.6) -- (-1,-1,0) -- (-1,1,0) -- cycle), palegray+opacity(.5));

draw(surface((0,0,-1.6) -- (1,1,0) -- (-1,1,0) -- cycle), palegray+opacity(.5));
draw(surface((0,0,-1.6) -- (1,1,0) -- (1,-1,0) -- cycle), palegray+opacity(.5));
draw(surface((0,0,-1.6) -- (1,-1,0) -- (-1,-1,0) -- cycle), palegray+opacity(.5));
draw(surface((0,0,-1.6) -- (-1,-1,0) -- (-1,1,0) -- cycle), palegray+opacity(.5));

draw((1,1,0) -- (1,-1,0) -- (-1,-1,0) -- (-1,1,0) -- cycle);
draw((0,0,1.6) -- (1,1,0));
draw((0,0,1.6) -- (1,-1,0));
draw((0,0,1.6) -- (-1,-1,0));
draw((0,0,1.6) -- (-1,1,0));

draw((0,0,-1.6) -- (1,1,0));
draw((0,0,-1.6) -- (1,-1,0));
draw((0,0,-1.6) -- (-1,-1,0));
draw((0,0,-1.6) -- (-1,1,0));
