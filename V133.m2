-- d = 1
-- h = 3
-- N = 3
restart
R = QQ[a1,b1,c1,
s00, s01, s10, s11,
Degrees => {3:1,4:1},
MonomialOrder => Eliminate 3];
vrbs = {a1, b1, c1};

Q = QQ[S00, S01, S10, S11,
Degrees => {4:1}];

mapFunction = map(Q, R, {a1 => 0, b1 => 0, c1 => 0, s00 => S00, s01 => S01, s10 => S10, s11 => S11});
varietyName = "V133";

I = ideal(
s00-a1*b1*c1,
s10-a1*a1*b1-a1*a1*c1-b1*b1*c1,
s01-a1*b1*b1-a1*c1*c1-b1*c1*c1,
s11-a1*a1*a1-b1*b1*b1-c1*c1*c1);

load "aux_functions.m2";

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

-- There are 1 generators in V133
-- V133 had dimension 3
-- V133 had degree 9
-- A sample generator of V133 is 81*s00^9+162*s00^8*s01+351*s00^7*s01^2+333*s00^6*s01^3+72*s00^5*s01^4-63*s00^4*s01^5-30*s00^3*s01^6+6*s00^2*s01^7+6*s00*s01^8+s01^9+162*s00^8*s10 + ...
 