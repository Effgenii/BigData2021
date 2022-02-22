"""
Массив размером 2m + 1, где m — натуральное число, заполнен случайным образом. Найдите в массиве медиану.
Медианой называется элемент ряда, делящий его на две равные части: в одной находятся элементы,
которые не меньше медианы, в другой — не больше медианы.
"""
import random


def median_search(array):
    for i in range(len(array) - 1):
        median_count_left = len(array) // 2
        median_count_right = len(array) // 2

        for j in range(len(array)):
            if array[i] <= array[j] and i != j:
                median_count_left -= 1
            else:
                median_count_right -= 1

        if median_count_left == 0 or median_count_right == 0:
            break

    return array[i]


m = int(input("Введите натуральное число m: "))
numbers = [random.randrange(0, 50) for _ in range(2 * m + 1)]
print(numbers)
print(f'Медианным элементом является = {median_search(numbers)}')
print(sorted(numbers))