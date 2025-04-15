-- d = 2
-- h = 3
-- N = 2
restart
R = QQ[a1,a2,b1,b2,
s111,s112,s121,s122,s211,s212,s221,s222, 
t111,t121,t221, t112, t122, t222,
u111, u211, u112, u212, u122, u222, 
v111, v112, v122, v222,
Degrees => {4:1,24:1},
MonomialOrder => Eliminate 4];
vrbs = {a1, a1, b1, b2};

-- auxiliary functions
isVar = var -> member(var, vrbs);
hasNoVar = p -> (
    0 == number(support p, isVar)
);

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
degree I -- deg = 81
g = groebnerBasis I; -- 207 generators in the groebner basis
l = numColumns g; -- 207 generators
L = for i from 0 to l-1 list (g_i)_0;
L = select(L, hasNoVar);
len_gen = length L -- 97 generator of V232
toString L_(len_gen-1) -- 4*t111^2*u112*v112^2-t112*v111^2*v112^2+2*u111^2*v112^3-t111*v111*v112^3-4*t111^2*u112*v111*v122+t112*v111^3*v122-2*t111^2*u111*v112*v122-3*u111^2*v111*v112*v122+2*t111*v111^2*v112*v122+2*t111^2*u111*v111*v222+u111^2*v111^2*v222-t111*v111^3*v222
