-- d = 2
-- h = 3
-- N = 3
restart
R = QQ[a1,a2,b1,b2,c1,c2,
s111,s112,s121,s122,s211,s212,s221,s222, 
t111,t121,t221,t112,t122,t222,
u111,u211,u112,u212,u122,u222, 
v111,v112,v122,v222,
Degrees => {6:1,24:1},
MonomialOrder => Eliminate 6];

vrbs = {a1, a1, b1, b2, c1, c2};


Q = QQ[S111,S112,S121,S122,S211,S212,S221,S222, 
T111,T121,T221, T112, T122, T222,
U111, U211, U112, U212, U122, U222, 
V111, V112, V122, V222,
Degrees => {24:1}];


mapFunction = map(Q, R, {a1 => 0, a2 => 0, b1 => 0, b2 => 0, c1 => 0, c2 => 0,
    s111 => S111, s112 => S112, s121 => S121, s122 => S122, 
    s211 => S211, s212 => S212, s221 => S221, s222 => S222, 
    t111 => T111, t121 => T121, t221 => T221, 
    t112 => T112, t122 => T122, t222 => T222,
    u111 => U111, u211 => U211, u112 => U112, 
    u212 => U212, u122 => U122, u222 => U222,
    v111 => V111, v112 => V112, v122 => V122, v222 => V222 
    });
varietyName = "V233";

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



-- auxiliary functions
isVar = var -> member(var, vrbs);

hasNoVar = p -> (
    0 == number(support p, isVar)
);

reduceAndMapGenerators = K -> (
    -- reduce the ideal K in the ring R and map it into Q
    g = groebnerBasis I;
    lenGroebnerBasis = numColumns g;
    L = for i from 0 to lenGroebnerBasis-1 list (g_i)_0;
    L = select(L, hasNoVar);
    len_subbasis = length L;
    LNew = for i from 0 to len_subbasis-1 list mapFunction(L_i); -- we map each value of L into the new ring Q
    return LNew;
);

-- main program
gensReducedIdeal = reduceAndMapGenerators(I);
numReducedGenerators = length gensReducedIdeal;
J = ideal(gensReducedIdeal);
dimJ = dim J;
degreeJ = degree J;
smplPoly = toString gensReducedIdeal_(numReducedGenerators - 1);

concatenate {"There are ", toString numReducedGenerators, " generators in ", varietyName}
concatenate {varietyName, " had dimension ", toString dimJ}
concatenate {varietyName, " had degree ", toString degreeJ}
concatenate {"A sample generator of ", varietyName, " is ", smplPoly}

-- There are ? generators in V233
-- V233 had dimension ?
-- V233 had degree ?
-- A sample generator of V233 is ?
