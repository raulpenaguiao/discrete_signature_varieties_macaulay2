# discrete_signature_varieties_macaulay2

This repository has code and documentation on computations of discrete signature varieties.
We use the ``mingens`` to guarantee that we get the minimal number of generators 

## Authors:

Carlo Bellingeri
and
Raul Penaguiao



## V 133

The variety $V_{1, 3, 3}$ has dimension two, degree 27 and the only generator can be obtained by running the code in ```V133.m2``` in Macaulay2 (runs almost instantaneously in typical laptop)

## V 143

The variety $V_{1, 4, 3}$ has dimension two, degree 16 and can be generated by 20 generators.
One of them can be displayed by running the code in ```V143.m2``` in Macaulay2 (runs almost instantaneously in typical laptop), and any other such generator can be seen by running similar code.

## V 223

The variety $V_{2, 2, 3}$ has dimension five, degree two and can be generated by one generator $s_{12}^2+2 s_{12} s_{21}+s_{21}^2-4 s_{11} s_{22}-2 s_{22} t_{11}-2 s_{11} t_{22}-t_{11} t_{22}+2 s_{12} t_{12}+2 s_{21} t_{12}+t_{12}^2$.
This can be show by running the code in ```V223.m2``` in Macaulay2 (runs in less that five seconds in typical laptop).

Note that the same polynomial generates an ideal with different dimension and degree in a different ring, for these characteristics depend on the ambient space.

## V 224

The variety $V_{2, 2, 4}$ has dimension five, degree two and can be generated by one generator $s_{12}^2+2 s_{12} s_{21}+s_{21}^2-4 s_{11} s_{22}-2 s_{22} t_{11}-2 s_{11} t_{22}-t_{11} t_{22}+2 s_{12} t_{12}+2 s_{21} t_{12}+t_{12}^2$, showing that it is the same variety as $V_{2, 2, 3}$.
This can be show by running the code in ```V224.m2``` in Macaulay2 (runs in less that 5 seconds in typical laptop).

## V 232

The variety $V_{2, 3, 2}$ has dimension four and degree 27. It is generated by 97 polynomials, one of which is $t_{111}^3+u_{111}^3-t_{111} u_{111} v_{111}$.
This can be show by running the code in ```V232.m2``` in Macaulay2 (runs almost instantaneously in typical laptop).

## V 322

The variety $V_{3, 2, 2}$ has dimension five and degree 32. It is generated by 45 polynomials, one of which is $s_{12}^2-s_{11} s_{22}+t_{12}^2+t_{21}^2-2 t_{11} t_{22}$.
This can be show by running the code in ```V322.m2``` in Macaulay2 (runs almost instantaneously in typical laptop).

## V 232

The code to comute the variety $V_{2, 3, 2}$ is in the file ```V232.m2``` in Macaulay2.
However, on a typical laptop, the computation does not terminate in useful time.


# Dimension of associated lie algebras
In degree_moebius.py there is a script that one can run to get the dimension of the successive lie groups, as in Theorem 4.3 from [arxiv.org/abs/2303.13377](Discrete Signature Varieties)



