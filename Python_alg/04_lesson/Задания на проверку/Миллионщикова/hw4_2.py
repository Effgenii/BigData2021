# 2. Написать два алгоритма нахождения i-го по счёту простого числа. Функция нахождения простого числа должна принимать на вход натуральное и возвращать соответствующее простое число. Проанализировать скорость и сложность алгоритмов.
# Первый — с помощью алгоритма «Решето Эратосфена».

import cProfile

def era(n):
    sieve = [i for i in range(n)]
    sieve[1] = 0
    for i in range(2, n):
        if sieve[i] != 0:
            j = i * 2
            while j < n:
                sieve[j] = 0
                j += i
    result = [i for i in sieve if i != 0]

# era(3) 100 loops, best of 5: 4.8 usec per loop
# era(10) 100 loops, best of 5: 17.1 usec per loop
# era(30) 100 loops, best of 5: 23.6 usec per loop
# era(50) 100 loops, best of 5: 39.5 usec per loop
# era(100) 100 loops, best of 5: 81.2 usec per loop

# cProfile.run('era(10)')
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    0.000    0.000 <string>:1(<module>)
#         1    0.000    0.000    0.000    0.000 hw4_2.py:16(<listcomp>)
#         1    0.000    0.000    0.000    0.000 hw4_2.py:7(era)
#         1    0.000    0.000    0.000    0.000 hw4_2.py:8(<listcomp>)
#         1    0.001    0.001    0.001    0.001 {built-in method builtins.exec}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}

# Второй — без использования «Решета Эратосфена».

def without_sieve(n):
    num_list = [i for i in range(n * n)]
    num_list[1] = 0
    s_nums = []
    for i in range(2, len(num_list)):
        for num in s_nums:
            if num_list[i] % num == 0:
                break
        else:
            s_nums.append(num_list[i])
        if len(s_nums) == n:
            return s_nums[-1]

# without_sieve(3) 100 loops, best of 5: 7.41 usec per loop
# without_sieve(10) 100 loops, best of 5: 41.1 usec per loop
# without_sieve(30) 100 loops, best of 5: 288 usec per loop
# without_sieve(50) 100 loops, best of 5: 744 usec per loop
# without_sieve(100) loops, best of 5: 3.05 msec per loop

#cProfile.run('without_sieve(10)')
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    0.000    0.000 <string>:1(<module>)
#         1    0.000    0.000    0.000    0.000 hw4_2.py:32(without_sieve)
#         1    0.000    0.000    0.000    0.000 hw4_2.py:33(<listcomp>)
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.exec}
#        29    0.000    0.000    0.000    0.000 {built-in method builtins.len}
#        10    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}

# Алгоритм без использования «Решета Эратосфена» выполняется сильно дольше. В первом случае 6 функций вызываются по 1 разу,
# во втором случае 7 функций, В cProfile видно значительную разницу в количестве вызовов метода len (29 раз) и 10 раз вызывается append.
# По-видимому из-за этого такая разница в скорости