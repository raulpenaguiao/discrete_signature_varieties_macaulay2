-- auxiliary functions
isVar = var -> member(var, vrbs);

hasNoVar = p -> (
    0 == number(support p, isVar)
);

listifyGroebnerBasis = (g) -> (
    -- convert a grobner basis list into a string
    lenGroebnerBasis = numColumns g;
    return for i from 0 to lenGroebnerBasis-1 list (g_i)_0;
);


reduceAndMapGenerators = K -> (
    -- reduce the ideal K in the ring R and map it into Q
    L = listifyGroebnerBasis groebnerBasis I;
    L = select(L, hasNoVar);
    len_subbasis = length L;
    LNew = for i from 0 to len_subbasis-1 list mapFunction(L_i); -- we map each value of L into the new ring Q
    J = ideal(LNew);
    return listifyGroebnerBasis groebnerBasis J;
);