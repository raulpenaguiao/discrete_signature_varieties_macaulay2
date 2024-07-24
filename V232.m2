-- d = 2
-- h = 3
-- N = 2
restart
R = QQ[a1,a2,b1,b2,
s111,s112,s121,s122,s211,s212,s221,s222, 
t111,t121,t221, t112, t122, t222,
u111, u211, u112, u212, u122, u222, 
v111, v112, v122, v222,
Degrees => {4:1,24:3},
MonomialOrder => Eliminate 4];

I = ideal(
0-s111,a1*a1*b1-t111,a1*b1*b1-u111,a1*a1*a1+b1*b1*b1-v111,
0-s112,a1*a2*b1-t121,a2*b1*b1-u211,a1*a1*a2+b1*b1*b2-v112,
0-s121,a2*a2*b1-t221,a1*b1*b2-u112,a1*a2*a2+b1*b2*b2-v122,
0-s122,a1*a1*b2-t112,a2*b1*b2-u212,a2*a2*a2+b2*b2*b2-v222,
0-s211,a1*a2*b2-t122,a1*b2*b2-u122,
0-s212,a2*a2*b2-t222,a2*b2*b2-u222,
0-s221,
0-s222
);

dim I -- dim = 4
degree I -- deg = 282_429_536_481
mingens radical I; -- 24 minimal generators
g = groebnerBasis I; -- 107 elements in the groebner basis
J = eliminate({a1, a2, b1, b2}, I);
minGensJ = mingens J; -- 77 minimal generators
toString (minGensJ)_(0, 76) -- example of a minimal generator
dim J -- 8 dimension and degree depend on embeded space
degree J -- 94_143_178_827

T = QQ[s111,s112,s121,s122,s211,s212,s221,s222, 
t111,t121,t221, t112, t122, t222,
u111, u211, u112, u212, u122, u222, 
v111, v112, v122, v222]
L = for i from 0 to 76 list substitute(minGensJ_(0, i), T);
J = ideal(L);
dim J -- dim 4
degree J -- degree 27
