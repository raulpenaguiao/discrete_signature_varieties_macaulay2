-- d = 1
-- h = 3
-- N = 3
restart
R = QQ[a1,b1,c1,
s00, s01, s10, s11,
Degrees => {3:1,4:3},
MonomialOrder => Eliminate 3];
vrbs = {a1, b1, c1};

-- auxiiary functions
isVar = var -> member(var, vrbs);
hasNoVar = p -> (
    0 == number(support p, isVar)
);


I = ideal(
s00-a1*b1*c1,
s10-a1*a1*b1-a1*a1*c1-b1*b1*c1,
s01-a1*b1*b1-a1*c1*c1-b1*c1*c1,
s11-a1*a1*a1-b1*b1*b1-c1*c1*c1);

dim I -- dim = 3
degree I -- deg = 81 = 3**4
g = groebnerBasis I;
l = numColumns g;
L = for i from 0 to l-1 list (g_i)_0;
L = select(L, hasNoVar);
length L -- 1 generator of V133
toString L_0

