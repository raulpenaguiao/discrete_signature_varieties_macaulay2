-- d = 3
-- h = 2
-- N = 2
restart
R = QQ[a1,a2,a3,b1,b2,b3,
s11, s12, s13, s21, s22, s23, s31, s32, s33,
t11, t12, t13, t22, t23, t33,
Degrees => {6:1,15:1},
MonomialOrder => Eliminate 6];

vrbs = {a1, a2, a3, b1, b2, b3};


Q = QQ[S11, S12, S13, S21, S22, S23, S31, S32, S33,
T11, T12, T13, T22, T23, T33,
Degrees => {15:1}];



mapFunction = map(Q, R, {a1 => 0, a2 => 0, a3 => 0, b1 => 0, b2 => 0, b3 => 0,
    s11 => S11, s12 => S12, s13 => S13, 
    s21 => S21, s22 => S22, s23 => S23,
    s31 => S31, s32 => S32, s33 => S33, 
    t11 => T11, t12 => T12, t13 => T13, 
    t22 => T22, t23 => T23, t33 => T33
    });
varietyName = "V322";


I = ideal(
t11-a1*a1-b1*b1,
t12-a1*a2-b1*b2,
t13-a1*a3-b1*b3,
t22-a2*a2-b2*b2,
t23-a2*a3-b2*b3,
t33-a3*a3-b3*b3,
s11-a1*b1,
s12-a1*b2,
s13-a1*b3,
s21-a2*b1,
s22-a2*b2,
s23-a2*b3,
s31-a3*b1,
s32-a3*b2,
s33-a3*b3
);

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

-- There are 45 generators in V322
-- V322 had dimension 6
-- V322 had degree 32
-- A sample generator of V322 is S21^2*S32^2-S11*S22*S32^2-S21^2*S22*S33+S11*S22^2*S33+S21*S22*T13*T23-S11*S22*T23^2-S21*S22*T12*T33+S11*S22*T22*T33
