"""
9. Найти максимальный элемент среди минимальных элементов столбцов матрицы.
"""

from random import randint
class Matrix:
    def __init__(self, rows):
        self.matr = rows

    def __str__(self):  # представление матрицы в виде набора строк
        row = '\n'
        for l in self.matr:
            for i in l:
                row += str(f'{i:>4}')
            row += '\n'
        return row


mx = [[randint(-50, 50) for _ in range(5)] for _ in range(7)]

num_col = len(mx[0])
min_val = [0] * num_col
for line in mx:
    for i in range(num_col):
        if line[i] < min_val[i]:
            min_val[i] = line[i]

max_num = min_val[0]
for i in range(1, num_col):
    if min_val[i] > max_num:
        max_num = min_val[i]

print(f'В матрице {Matrix(mx)} min элементы столбцов: {min_val} \n среди них max: {max_num}')