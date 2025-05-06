def initialize_arithmetic_functions(LIM=500):
    """
    Initialize arithmetic functions for binomial coefficients and the Möbius function.
    """

    # Initialize a 2D list `binom` to store binomial coefficients
    binom = [[0 for i in range(LIM)] for j in range(LIM)]
    binom[0][0] = 1

    # Compute binomial coefficients using Pascal's triangle
    for i in range(1, LIM-1):
        binom[i][0] = 1
        for j in range(1, i+1):
            binom[i][j] = binom[i-1][j] + binom[i-1][j-1]

    # Initialize the Möbius function `mu` and a list `primeQ` to track prime numbers
    mu = [1 for _ in range(LIM+1)]
    primeQ = [True for _ in range(LIM+1)]

    # Set initial values for `mu` and `primeQ`
    mu[0] = 0
    primeQ[0] = False
    primeQ[1] = False

    # Compute the Möbius function and mark non-prime numbers
    for i in range(2, LIM+1):
        if primeQ[i]:
            # Mark multiples of `i` as non-prime and update `mu`
            for j in range(i, LIM+1, i):
                primeQ[j] = False
                mu[j] *= -1
            # Set `mu[j]` to 0 for multiples of `i^2`
            for j in range(i*i, LIM+1, i*i):
                mu[j] = 0
    
    return mu, primeQ, binom

def initialize_compositions(lim = 15):
    """
    Initialize compositions of integers.
    """
    # Initialize a list to store compositions
    compositions = []

    # Start with compositions of 0
    new_compositions = [[]]  # Compositions of 0
    compositions.append(new_compositions[:])

    # Add compositions of 1
    new_compositions = [[1]]  # Compositions of 1
    compositions.append(new_compositions[:])

    # Generate compositions for integers up to `lim`
    for i in range(2, lim):
        old_compositions = new_compositions[:]
        new_compositions = []
        for alpha in old_compositions:
            # Add a new part of size 1 to the composition
            new_alpha = alpha[:]
            new_compositions.append(new_alpha[:] + [1])
            # Increment the last part of the composition
            new_alpha[-1] += 1
            new_compositions.append(new_alpha[:])
        compositions.append(new_compositions[:])
    
    return compositions

def lbd(d, h, verbose=False):
    """
    Compute the lambda function λ_{d, h}.

    Args:
        d (int): The degree parameter.
        h (int): The height parameter.
        verbose (bool): If True, print intermediate calculations.

    Returns:
        int: The computed value of λ_{d, h}.
    """
    sum_part_1 = 0
    for k in range(1, h+1):
        if h % k == 0:
            sum_part_2 = 0
            for alpha in compositions[h//k]:
                prod_part = 1
                for a in alpha:
                    # Compute the product of binomial coefficients
                    prod_part *= binom[a+d-1][d-1]
                if verbose:
                    print(d, h, k, alpha, "=", prod_part)
                # Divide by the length of the composition
                prod_part /= len(alpha)
                sum_part_2 += prod_part
            # Multiply by the Möbius function and divide by `k`
            sum_part_1 += round(mu[k] * sum_part_2 / k)
    return sum_part_1

if __name__ == "__main__":
    mu, primeQ, binom = initialize_arithmetic_functions()
    compositions = initialize_compositions()
    
    # Limit for lambda function calculations
    lim = 10
    
    # Compute and print λ_{d, h} for all d, h in the range [1, lim)
    for d in range(1, lim):
        for h in range(1, lim):
            print("lambda_{", d, ", ", h, "} =  ", lbd(d, h))