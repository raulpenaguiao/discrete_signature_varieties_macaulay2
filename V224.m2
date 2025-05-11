-- d = 2
-- h = 2
-- N = 4
restart
R = QQ[a1,a2,b1,b2,c1,c2,d1,d2,s11,s12,s21,s22,t11,t22,t12,
Degrees => {8:1,7:1},
MonomialOrder => Eliminate 8];
vrbs = {a1, a1, b1, b2, c1, c2, d1, d2};

Q = QQ[S11, S12, S21, S22, T11, T12, T22,
Degrees => {7:1}];


mapFunction = map(Q, R, {a1 => 0, a2 => 0, b1 => 0, b2 => 0, c1 => 0, c2 => 0, d1 => 0, d2 => 0, 
    s11 => S11, s12 => S12, s21 => S21, s22 => S22, 
    t11 => T11, t12 => T12, t22 => T22});
varietyName = "V224";


I = ideal(
a1*b1+a1*c1+b1*c1+a1*d1+b1*d1+c1*d1-s11,
a1*b2+a1*c2+b1*c2+a1*d2+b1*d2+c1*d2-s12,
a2*b1+a2*c1+b2*c1+a2*d1+b2*d1+c2*d1-s21,
a2*b2+a2*c2+b2*c2+a2*d2+b2*d2+c2*d2-s22,
a1*a1+b1*b1+c1*c1+d1*d1-t11,
a2*a2+b2*b2+c2*c2+d2*d2-t22,
a1*a2+b1*b2+c1*c2+d1*d2-t12);

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

-- There are 1 generators in V224
-- V224 had dimension 6
-- V224 had degree 2
-- A sample generator of V224 is S12^2+2*S12*S21+S21^2-4*S11*S22-2*S22*T11+2*S12*T12+2*S21*T12+T12^2-2*S11*T22-T11*T22
