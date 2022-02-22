# 1. Проанализировать скорость и сложность одного любого алгоритма из разработанных в рамках домашнего задания первых трех уроков.
# Примечание. Идеальным решением будет:
# a. выбрать хорошую задачу, которую имеет смысл оценивать,
# b. написать 3 варианта кода (один у вас уже есть),
# c. проанализировать 3 варианта и выбрать оптимальный,
# d. результаты анализа вставить в виде комментариев в файл с кодом (не забудьте указать, для каких N вы проводили замеры),
# e. написать общий вывод: какой из трёх вариантов лучше и почему.

# Задача 5 из 3 дз. В массиве найти максимальный отрицательный элемент. Вывести на экран его значение и позицию в массиве.

import cProfile
import random
import math
array = [random.randint(-100, 100) for _ in range(5)]
def func(array):

    min_el = -float('inf')

    for i, item in enumerate(array):
        if min_el < item < 0:
            min_el = item
            min_index = i
    return min_el, min_index

cProfile.run('func(array)')
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    0.000    0.000 <string>:1(<module>)
#         1    0.000    0.000    0.000    0.000 hw4_task1.py:15(func)
#         1    0.001    0.001    0.001    0.001 {built-in method builtins.exec}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}

#print(f'{array} \n Максимальный отрицательный элемент = {func(array)[0]} \nего индекс = {func(array)[1]}')

# python -m timeit -n 100 -s "import random" "x = [random.randint(-100, 0) for _ in range(10)]" "import hw4_task1" "hw4_task1.fu
# nc(x)"
#range(5) 100 loops, best of 5: 21.2 usec per loop
#range(10) 100 loops, best of 5: 37.4 usec per loop
#range(50) 100 loops, best of 5: 177 usec per loop


# Вариант 2
array = [random.randint(-100, 100) for _ in range(5)]

def func1(array):
    i = 0
    min_ind = -1

    while i < 5:
        if array[i] < 0 and min_ind == -1:
            min_ind = i
        elif array[i] < 0 and array[i] > array[min_ind]:
            min_ind = i
        i += 1

#range(5) 100 loops, best of 5: 21.3 usec per loop
#range(10) 100 loops, best of 5: 35.6 usec per loop
#range(50) 100 loops, best of 5: 157 usec per loop
cProfile.run('func1(array)')
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    0.000    0.000 <string>:1(<module>)
#         1    0.000    0.000    0.000    0.000 hw4_task1.py:38(func1)
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.exec}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
# Вариант 3
def func_2(array):
    new_array = [i for i in array if i < 0]
    maximum = max(new_array)
    min_index = new_array.index(maximum)
    return maximum, min_index
#print(f'{array} \n Максимальный отрицательный элемент = {func_2(array)[0]} \nего индекс = {func_2(array)[1]}')
#range(5) 100 loops, best of 5: 21.1 usec per loop
#range(10) 100 loops, best of 5: 37 usec per loop
#range(50) 100 loops, best of 5: 173 usec per loop

cProfile.run('func_2(array)')
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    0.000    0.000 <string>:1(<module>)
#         1    0.000    0.000    0.000    0.000 hw4_task1.py:54(func_2)
#         1    0.000    0.000    0.000    0.000 hw4_task1.py:55(<listcomp>)
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.exec}
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.max}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
#         1    0.000    0.000    0.000    0.000 {method 'index' of 'list' objects}

#по скорости все 3 варианта примерно  одинаковы, но при этом у первых 2 вариантов было вызвано 4 функции (у 3 варианта 7 функции)
# в данном случае 2 вариант самый оптимальный, т.к. percall везде равен 0.00, в отличие от 1 варианта