-- d = 2
-- h = 2
-- N = 4

restart
R = QQ[a1,a2,b1,b2,c1,c2,d1,d2,s11,s12,s21,s22,t11,t22,t12,
Degrees => {8:1,7:2},
MonomialOrder => Eliminate 8];

I = ideal(
a1*b1+a1*c1+b1*c1+a1*d1+b1*d1+c1*d1-s11,
a1*b2+a1*c2+b1*c2+a1*d2+b1*d2+c1*d2-s12,
a2*b1+a2*c1+b2*c1+a2*d1+b2*d1+c2*d1-s21,
a2*b2+a2*c2+b2*c2+a2*d2+b2*d2+c2*d2-s22,
a1*a1+b1*b1+c1*c1+d1*d1-t11,
a2*a2+b2*b2+c2*c2+d2*d2-t22,
a1*a2+b1*b2+c1*c2+d1*d2-t12);

dim I -- dim = 8
degree I -- deg = 128
mingens radical I;
g = groebnerBasis I; -- 71 generators in groebner base
J = eliminate({a1, a2, b1, b2, c1, c2, d1, d2}, I);
minGens = mingens J; -- unique generator in the elimination ring
toString (mingens J)_(0, 0)
dim J -- dim 14 dimension and degree depend on embedded space
degree J -- degree 4


restart
R = QQ[s11, s12, s21, s22, t11, t12, t22]
J = ideal(s12*s12  + 2*s12*s21 + s21*s21  - 4*s11*s22 - 2*s22*t11 - 2*s11*t22 - t11*t22 + 2*s12*t12 + 2*s21*t12 + t12*t12)
degree J -- degree 2
dim J -- dim 6