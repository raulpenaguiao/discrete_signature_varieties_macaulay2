-- d = 2
-- h = 2
-- N = 3

restart
R = QQ[a1,a2,b1,b2,c1,c2,s11,s12,s21,s22,t11,t22,t12,
Degrees => {6:1,7:1},
MonomialOrder => Eliminate 6];
vrbs = {a1, a1, b1, b2, c1, c2};

-- auxiliary functions
isVar = var -> member(var, vrbs);
hasNoVar = p -> (
    0 == number(support p, isVar)
);


I = ideal(
a1*b1+a1*c1+b1*c1-s11,
a1*b2+a1*c2+b1*c2-s12,
a2*b1+a2*c1+b2*c1-s21,
a2*b2+a2*c2+b2*c2-s22,
a1*a1+b1*b1+c1*c1-t11,
a2*a2+b2*b2+c2*c2-t22,
a1*a2+b1*b2+c1*c2-t12);

dim I -- dim = 6
degree I -- deg = 36 = 2**2 * 3**2
g = groebnerBasis I;
l = numColumns g; -- 70
L = for i from 0 to l-1 list (g_i)_0;
L = select(L, hasNoVar);
length L -- 1 generator of V133
toString L_0 -- s12^2+2*s12*s21+s21^2-4*s11*s22-2*s22*t11-2*s11*t22-t11*t22+2*s12*t12+2*s21*t12+t12^2
