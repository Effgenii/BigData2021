# В одномерном массиве целых чисел определить два наименьших элемента. Они могут быть как равны между собой
# (оба минимальны), так и различаться.

from random import random

n = 10
my_list = []
for i in range(n):
    my_list.append(int(random() * 100))
    print(f' {my_list[i]}', end='')
print()

if my_list[0] > my_list[1]:
    min1 = 0
    min2 = 1
else:
    min1 = 1
    min2 = 0

for i in range(2, n):
    if my_list[i] < my_list[min1]:
        a = min1
        min1 = i
        if my_list[a] < my_list[min2]:
            min2 = a
    elif my_list[i] < my_list[min2]:
        min2 = i

print(f' № {min1 + 1} : {my_list[min1]}')
print(f' № {min2 + 1} : {my_list[min2]}')