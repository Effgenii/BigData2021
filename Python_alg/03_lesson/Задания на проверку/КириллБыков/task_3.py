# В массиве случайных целых чисел поменять местами минимальный и максимальный элементы.
from random import random
n = 10
my_list = [0] * n
for i in range(n):
    my_list[i] = int(random() * 100)
    print(my_list[i], end=' ')
print()
minimum = 0
maximum = 0
for i in range(n):
    if my_list[i] < my_list[minimum]:
        minimum = i
    elif my_list[i] > my_list[maximum]:
        maximum = i
print(f'Минимальный элемент в позиции {minimum + 1} равен {my_list[minimum]} Максимальный элемент в позиции '
      f'{maximum + 1} равен {my_list[maximum]} ')
my_list[minimum], my_list[maximum] = my_list[maximum], my_list[minimum]
for i in range(n):
    print(my_list[i], end=' ')
print()
