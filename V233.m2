
R = QQ[a1,a2,b1,b2,c1,c2,
s111,s112,s121,s122,s211,s212,s221,s222, 
t111,t121,t221,t112,t122,t222,
u111,u211,u112,u212,u122,u222, 
v111,v112,v122,v222,
Degrees => {6:1,24:1},
MonomialOrder => Eliminate 6];

vrbs = {a1, a1, b1, b2, c1, c2};

-- auxiliary functions
isVar = var -> member(var, vrbs);
hasNoVar = p -> (
    0 == number(support p, isVar)
);


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


dim I -- dim = ??
degree I -- deg = ??
g = groebnerBasis I; -- ??? generators in the groebner basis
l = numColumns g; -- ??? generators
L = for i from 0 to l-1 list (g_i)_0;
L = select(L, hasNoVar);
len_gen = length L -- ?? generator of V233
toString L_(len_gen-1) -- ???
