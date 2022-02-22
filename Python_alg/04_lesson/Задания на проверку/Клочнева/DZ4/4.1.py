import cProfile
import timeit
from random import random


def myArr():
    N = 14
    array = []
    for i in range(N):
        array.append(int(random() * 100))

    index_min = array.index(min(array))
    index_max = array.index(max(array))
    min_my = min(array)
    max_my = max(array)

    array[index_min] = max_my
    array[index_max] = min_my
    return array

def myArr2():
    N = 14
    array = []
    for i in range(N):
        array.append(int(random() * 100))
    array.sort()

    min_my = array[0]
    max_my = array[-1]

    array[0] = max_my
    array[-1] = min_my
    return array

print(timeit.timeit(myArr)) # 6.9505347

print(timeit.timeit(myArr2)) # 5.236333300000001

cProfile.run('myArr()') # 38 function calls in 0.002 seconds
cProfile.run('myArr2()') # 33 function calls in 0.000 seconds

