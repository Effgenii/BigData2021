#task_3

def find_mediana(lst):
    size = len(lst)
    mediana = lst[0]
    for i in range(size):
        low_idx, high_idx = 0, 0
        for j in range(size):
            if mediana < lst[j]:
                low_idx += 1
            elif mediana > lst[j]:
                high_idx += 1
        if low_idx == high_idx:
            break
        mediana = lst[i+1] if i+1 < size else mediana
    return mediana

from random import randint
from random import shuffle

size = 2*int(input('Введите m: ')) + 1
a, b = -100, 100
lst = [randint(a,b) for _ in range(size)]
print(lst)
print(f'Медиана = {find_mediana(lst)}')
lst.sort()
print(lst)
