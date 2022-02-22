# Определить, какое число в массиве встречается чаще всего.
from random import random
n = 15
my_list = [0] * n
for i in range(n):
    my_list[i] = int(random() * 10)
print(my_list)

num = my_list[0]
max_f = 1
for i in range(n - 1):
    frq = 1
    for k in range(i + 1, n):
        if my_list[i] == my_list[k]:
            frq += 1
    if frq > max_f:
        max_f = frq
        num = my_list[i]

if max_f > 1:
    print(max_f, 'раз(а) встречается число', num)
else:
    print('Одинаковых чисел нет')