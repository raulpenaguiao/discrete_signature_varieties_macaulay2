f = [1]

LIM = 500
binom = [[0 for i in range(LIM)] for j in range(LIM)]
binom[0][0] = 1
for i in range(1, LIM-1):
    binom[i][0] = 1
    for j in range(1, i+1):
        binom[i][j] = binom[i-1][j] + binom[i-1][j-1]

mu = [1 for _ in range(LIM+1)]
primeQ = [True for _ in range(LIM+1)]

mu[0] = 0
primeQ[0] = False
primeQ[1] = False


for i in range(2, LIM+1):
    if primeQ[i]:
        for j in range(i, LIM+1, i):
            primeQ[j] = False
            mu[j] *= -1
        for j in range(i*i, LIM+1, i*i):
            mu[j] = 0

lim = 15

compositions = []
new_compositions = [[]]#compositions of 0
compositions.append(new_compositions[:])
new_compositions = [[1]]#compositions of 1
compositions.append(new_compositions[:])
for i in range(2, lim):
    old_compositions = new_compositions[:]
    new_compositions = []
    for alpha in old_compositions:
        new_alpha = alpha[:]
        new_compositions.append(new_alpha[:] + [1])
        new_alpha[-1] += 1
        new_compositions.append(new_alpha[:])
    compositions.append(new_compositions[:])

#print(compositions[5])

def lbd(d, h, verbose = False):
    sum_part_1 = 0
    for k in range(1, h+1):
        if h%k == 0:
            sum_part_2 = 0
            for alpha in compositions[h//k]:
                prod_part = 1
                for a in alpha:
                    prod_part *= binom[a+d-1][d-1]
                if verbose:
                    print(d, h, k, alpha, "=", prod_part)
                prod_part /= len(alpha)
                sum_part_2 += prod_part
            sum_part_1 += round(mu[k]* sum_part_2/k)
    return sum_part_1

lim = 10
for d in range(1, lim):
    for h in range(1, lim):
    	print("lambda_{", d, ", ", h, "} =  ", lbd(d, h))

lbd(2, 5, True)