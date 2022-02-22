"""
2. Отсортируйте по возрастанию методом слияния одномерный вещественный массив,
заданный случайными числами на промежутке [0; 50).
Выведите на экран исходный иотсортированный массивы.
"""

import random


size = 10
array = [random.randint(0, 50) for i in range(size)]
print(f'Исходный массив - {array}')


def merge_sort(array, start, end):

    if end - start > 1:
        middle = (start + end) // 2
        merge_sort(array, start, middle)
        merge_sort(array, middle, end)
        merge(array, start, middle, end)


def merge(array, start, middle, end):

    left = array[start:middle]
    right = array[middle:end]
    left_idx = right_idx = 0
    sorted_idx = start

    while left_idx < len(left) and right_idx < len(right):
        if left[left_idx] <= right[right_idx]:
            array[sorted_idx] = left[left_idx]
            left_idx += 1
        else:
            array[sorted_idx] = right[right_idx]
            right_idx += 1
        sorted_idx += 1

    while left_idx < len(left):
        array[sorted_idx] = left[left_idx]
        left_idx += 1
        sorted_idx += 1

    while right_idx < len(right):
        array[sorted_idx] = right[right_idx]
        right_idx += 1
        sorted_idx += 1


merge_sort(array, 0, len(array))
print(f'Отсортированный массив - {array}')
