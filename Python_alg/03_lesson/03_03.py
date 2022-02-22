# 3. В массиве случайных целых чисел поменять местами минимальный и максимальный элементы.

from random import randint

array_my = [randint(-10, 10) for _ in range(5)]

max_i = 0
min_i = 0
max_item = array_my[0]
min_item = array_my[0]

print(f"Исходный массив: {array_my}")

for i, item in enumerate(array_my):
    if max_item < item:
        max_item = item
        max_i = i

    if min_item > item:
        min_item = item
        min_i = i

array_my[max_i] = min_item
array_my[min_i] = max_item

print(f"Обработанный массив: {array_my}")