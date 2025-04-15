R = QQ[a1,a2,a3,b1,b2,b3,
s11, s12, s13, s22, s23, s33,
t11, t12, t13, t21, t22, t23, t31, t32, t33,
Degrees => {6:1,15:1},
MonomialOrder => Eliminate 6];

vrbs = {a1, a2, a3, b1, b2, b3};

-- auxiliary functions
isVar = var -> member(var, vrbs);
hasNoVar = p -> (
    0 == number(support p, isVar)
);
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
degree I -- deg = 64
g = groebnerBasis I; -- 143 generators in the groebner basis
l = numColumns g; -- 143 generators
L = for i from 0 to l-1 list (g_i)_0;
L = select(L, hasNoVar);
len_gen = length L -- 26 generator of V322
toString L_(len_gen-1) -- s13*t21^2-s13*t11*t22+s12*t11*t23-s11*t21*t23-s12*t21*t31+s11*t21*t32
