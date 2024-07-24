-- d = 1
-- h = 4
-- N = 3
restart
R = QQ[a1,b1,c1,
s000, s001, s010, s011, s100, s101, s110, s111,
Degrees => {3:1,8:4},
MonomialOrder => Eliminate 3];
vrbs = {a1, b1, c1};

-- auxiliary functions
isVar = var -> member(var, vrbs);
hasNoVar = p -> (
    0 == number(support p, isVar)
);


I = ideal(
    s000-0,
    s001-a1*b1*c1*c1,
    s010-a1*b1*b1*c1,
    s011-a1*b1*b1*b1-a1*c1*c1*c1-b1*c1*c1*c1,
    s100-a1*a1*b1*c1,
    s101-a1*a1*b1*b1-a1*a1*c1*c1-b1*b1*c1*c1,
    s110-a1*a1*a1*b1-a1*a1*a1*c1-b1*b1*b1*c1,
    s111-a1*a1*a1*a1-b1*b1*b1*b1-c1*c1*c1*c1
);


dim I -- dim = 3
degree I -- deg = 65536 = 4**8
g = groebnerBasis I;
l = numColumns g;
L = for i from 0 to l-1 list (g_i)_0;
L = select(L, hasNoVar);
length L -- 20 generators of V143
toString L_19
