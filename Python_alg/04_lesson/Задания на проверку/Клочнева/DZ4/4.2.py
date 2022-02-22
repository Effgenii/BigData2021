import cProfile
import timeit


def with_eratosthenes(n):
    sieve = list(range(n + 1))
    sieve[1] = 0  # без этой строки итоговый список будет содержать единицу
    for i in sieve:
        if i > 1:
            for j in range(i + i, len(sieve), i):
                sieve[j] = 0
    return sieve


def not_eratosthenes(n):
    b = []
    for i in range(2, n):
        result = True
        for j in range(2, i):
            if i % j == 0:
                result = False
        if result:
            b.append(i)
    return b


print(timeit.timeit(with_eratosthenes(10)))

print(timeit.timeit(not_eratosthenes(10)))

cProfile.run('with_eratosthenes(1000)') #172 function calls in 0.000 seconds
cProfile.run('not_eratosthenes(1000)') # 172 function calls in 0.039 seconds

#без решета Эратосфена решение хуже