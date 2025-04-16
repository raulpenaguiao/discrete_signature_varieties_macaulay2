-- d = 1
-- h = 4
-- N = 3
restart
R = QQ[a1,b1,c1,
s000, s001, s010, s011, s100, s101, s110, s111,
Degrees => {3:1,8:1},
MonomialOrder => Eliminate 3];
vrbs = {a1, b1, c1};

Q = QQ[S000, S001, S010, S011, S100, S101, S110, S111,
Degrees => {8:1}];

mapFunction = map(Q, R, {a1 => 0, b1 => 0, c1 => 0, 
    s000 => S000, s001 => S001, s010 => S010, s011 => S011, 
    s100 => S100, s101 => S101, s110 => S110, s111 => S111});
varietyName = "V143";


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

-- There are 20 generators in V143
-- V143 had dimension 3
-- V143 had degree 16
-- A sample generator of V143 is 22050*S001*S100^3+28284*S011*S100^2*S101+257246*S100^3*S101+110804*S001*S010*S101^2+89216*S010^2*S101^2-165868*S001*S011*S101^2-129102*S010*S011*S101^2-75540*S011^2*S101^2-132088*S001*S100*S101^2 + ...
 