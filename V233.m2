-- d = 2
-- h = 3
-- N = 3
restart
R = QQ[a1,a2,b1,b2,c1,c2,
s111,s112,s121,s122,s211,s212,s221,s222, 
t111,t121,t221,t112,t122,t222,
u111,u211,u112,u212,u122,u222, 
v111,v112,v122,v222,
Degrees => {6:1,24:3},
MonomialOrder => Eliminate 6];

I = ideal(
a1*b1*c1-s111,
a1*b1*c2-s112,
a1*b2*c1-s121,
a1*b2*c2-s122,
a2*b1*c1-s211,
a2*b1*c2-s212,
a2*b2*c1-s221,
a2*b2*c2-s222,
a1*a1*b1+a1*a1*c1+b1*b1*c1-t111,
a1*a1*b2+a1*a1*c2+b1*b1*c2-t112,
a1*a2*b1+a1*a2*c1+b1*b2*c1-t121,
a1*a2*b2+a1*a2*c2+b1*b2*c2-t122,
a2*a2*b1+a2*a2*c1+b2*b2*c1-t221,
a2*a2*b2+a2*a2*c2+b2*b2*c2-t222,
a1*b1*b1+a1*c1*c1+b1*c1*c1-u111,
a1*b1*b2+a1*c1*c2+b1*c1*c2-u112,
a1*b2*b2+a1*c2*c2+b1*c2*c2-u122,
a2*b1*b1+a2*c1*c1+b2*c1*c1-u211,
a2*b1*b2+a2*c1*c2+b2*c1*c2-u212,
a2*b2*b2+a2*c2*c2+b2*c2*c2-u222,
a1*a1*a1+b1*b1*b1+c1*c1*c1-v111,
a1*a1*a2+b1*b1*b2+c1*c1*c2-v112,
a1*a2*a2+b1*b2*b2+c1*c2*c2-v122,
a2*a2*a2+b2*b2*b2+c2*c2*c2-v222
);

dim I -- dim =
degree I -- deg =
mingens radical I; -- 
g = groebnerBasis I; -- 
J = eliminate({a1, a2, b1, b2, c1, c2}, I);
minGensJ = mingens J; -- 
sizeMinGens = length minGensJ
toString (minGensJ)_(0, sizeMinGens) -- 
dim J -- 
degree J -- 

T = QQ[s111,s112,s121,s122,s211,s212,s221,s222, 
t111,t121,t221,t112,t122,t222,
u111,u211,u112,u212,u122,u222, 
v111,v112,v122,v222]
L = for i from 0 to sizeMinGens list substitute(minGensJ_(0, i), T);
J = ideal(L);
dim J -- dim 4
degree J -- degree 27
