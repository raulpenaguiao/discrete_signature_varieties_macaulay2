-- d = 3
-- h = 2
-- N = 2
restart
R = QQ[a1,a2,a3,b1,b2,b3,
s11, s12, s13, s22, s23, s33,
t11, t12, t13, t21, t22, t23, t31, t32, t33,
Degrees => {6:1,15:2},
MonomialOrder => Eliminate 6];

I = ideal(
s11-a1*a1-b1*b1,
s12-a1*a2-b1*b2,
s13-a1*a3-b1*b3,
s22-a2*a2-b2*b2,
s23-a2*a3-b2*b3,
s33-a3*a3-b3*b3,
t11-a1*b1,
t12-a1*b2,
t13-a1*b3,
t21-a2*b1,
t22-a2*b2,
t23-a2*b3,
t31-a3*b1,
t32-a3*b2,
t33-a3*b3
);


dim I -- dim = 6
degree I -- deg = 32_768
mingens radical I;
g = groebnerBasis I; -- 143 generators in the groebner base
J = eliminate({a1, a2, a3, b1, b2, b3}, I);
minGensJ = mingens J; -- 24 minimal generators
toString (minGensJ)_(0, 23) -- example of a minimal generator
dim J -- 12 dimension and degree depend on embeded space
degree J -- 16384


T = QQ[s11, s12, s13, s22, s23, s33,
t11, t12, t13, t21, t22, t23, t31, t32, t33]
L = for i from 0 to 23 list substitute(minGensJ_(0, i), T);
J = ideal(L);
dim J -- dim 6
degree J -- degree 32

