# 4. Найти сумму n элементов следующего ряда чисел: 1, -0.5, 0.25, -0.125,… Количество элементов (n) вводится
# с клавиатуры.

n = int(input('Введите количество элементов следующего ряда чисел: 1, -0.5, 0.25, -0.125,…:  '))

def   my_sum (n, m=1):
    if n == 1:
        return (m)
    else:
        m = m + my_sum(n-1, m/-2)
        return (m)

print(my_sum(n))