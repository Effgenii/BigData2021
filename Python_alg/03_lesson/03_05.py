# 5. В массиве найти максимальный отрицательный элемент. Вывести на экран его значение и позицию в массиве.
# Примечание к задаче: пожалуйста не путайте «минимальный» и «максимальный отрицательный». Это два абсолютно
# разных значения.

from random import randint

array_my = [randint(-2, 10) for _ in range(10)]
max_i = 0
max_item = 0

for i, item in enumerate(array_my):
    if item < 0 and abs(item) > abs(max_item):
        max_item = item
        max_i = i

print(f" Исходный массив: {array_my}")
if max_item != 0:
    print(f"Максимальный отрицательный элемен {max_item} на позиции {max_i}")
else:
    print ("В массиве нет отрицатеьных элементов!")