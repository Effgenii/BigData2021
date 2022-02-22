"""
6. В одномерном массиве найти сумму элементов, находящихся между минимальным
и максимальным элементами. Сами минимальный и максимальный элементы в сумму не включать.
"""

from random import randint
my_list = [randint(-1000, 1000) for _ in range(30)]
min_val = 0
max_val = 0
for num in my_list:
    if num > max_val:
        max_val = num
    elif num < min_val:
        min_val = num

min_ind = my_list.index(min_val)
max_ind = my_list.index(max_val)

answer = 0
if min_ind < max_ind:
    for i in range(min_ind + 1, max_ind):
        answer += my_list[i]
else:
    for i in range(max_ind + 1, min_ind):
        answer += my_list[i]

print(f'В массиве {my_list} \n сумма элементов между max {max_val} и min {min_val} равна {answer}')
