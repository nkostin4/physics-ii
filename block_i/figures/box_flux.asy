import three;
import solids;
import graph3;

size(8cm,0);

currentprojection=perspective(7,6,3);

draw(-1X -- 4X, black+linewidth(1.5), arrow=Arrow3(TeXHead2), L=Label("$x$", position=EndPoint));
draw(-1Y -- 6Y, black+linewidth(1.5), arrow=Arrow3(TeXHead2), L=Label("$y$", position=EndPoint));
draw(-1Z -- 4Z, black+linewidth(1.5), arrow=Arrow3(TeXHead2), L=Label("$z$", position=EndPoint, align=N));

draw(box(O, (2.5,4.5,2.5)), blue+linewidth(1.2pt));
Label a = Label("$a$", position=MidPoint, filltype=Fill(white));
draw ((2.5,4.7,0) -- (0,4.7,0), L=a, arrow=Arrows3(TeXHead2));
Label b = Label("$b$", position=MidPoint, filltype=Fill(white), align=N);
draw ((0,0,2.7) -- (0,4.5,2.7), L=b, arrow=Arrows3(TeXHead2));
Label c = Label("$c$", position=MidPoint, filltype=Fill(white), align=W);
draw ((2.7,0,0) -- (2.7,0,2.5), L=c, arrow=Arrows3(TeXHead2));

draw(surface((0,4.5,0) -- (2.5,4.5,0) -- (2.5,4.5,2.5) -- (0,4.5,2.5) -- cycle), palegray+opacity(0.7));
