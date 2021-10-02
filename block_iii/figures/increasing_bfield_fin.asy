import three;
import labelpath3;
import graph3;

defaultpen(fontsize(8pt));

size(6cm,0);

currentprojection=perspective(1.0*(6.0*cos(291*pi/180),6.0*sin(291*pi/180),4), up=-Z);


// draw loop at initial time
draw(circle(c=O, r=1, normal=Z), black+linewidth(1.2));

// draw B field at initial time
draw((0.6*sin(157.5)*cos(0),0.6*sin(157.5)*sin(0),0.6*cos(157.5)) -- (0.6*sin(22.5)*cos(0),0.6*sin(22.5)*sin(0),0.6*cos(22.5)), blue+linewidth(0.7), arrow=Arrow3(), L=Label("$\vec{B}$", position=EndPoint, align=N));
draw((0.6*sin(157.5)*cos(0),0.6*sin(157.5)*sin(0)-0.2,0.6*cos(157.5)) -- (0.6*sin(22.5)*cos(0),0.6*sin(22.5)*sin(0)-0.2,0.6*cos(22.5)), blue+linewidth(0.7), arrow=Arrow3());
draw((0.6*sin(157.5)*cos(0),0.6*sin(157.5)*sin(0)+0.2,0.6*cos(157.5)) -- (0.6*sin(22.5)*cos(0),0.6*sin(22.5)*sin(0)+0.2,0.6*cos(22.5)), blue+linewidth(0.7), arrow=Arrow3());
draw((0.6*sin(157.5)*cos(0)-0.2,0.6*sin(157.5)*sin(0),0.6*cos(157.5)) -- (0.6*sin(22.5)*cos(0)-0.2,0.6*sin(22.5)*sin(0),0.6*cos(22.5)), blue+linewidth(0.7), arrow=Arrow3());
draw((0.6*sin(157.5)*cos(0)+0.2,0.6*sin(157.5)*sin(0),0.6*cos(157.5)) -- (0.6*sin(22.5)*cos(0)+0.2,0.6*sin(22.5)*sin(0),0.6*cos(22.5)), blue+linewidth(0.7), arrow=Arrow3());
