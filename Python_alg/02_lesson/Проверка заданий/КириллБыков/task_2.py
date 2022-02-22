# Посчитать четные и нечетные цифры введенного натурального числа. Например, если введено число 34560,
# в нем 3 четные цифры (4, 6 и 0) и 2 нечетные (3 и 5).

n = int(input('Ведите число: '))
i = 0 # четные числа
j = 0 # нечетные числа
while n > 0:
    if n % 2 == 0:
        i += 1
    else:
        j += 1
    n = n // 10
print(f'Четных чисел {i}, нечетных чисел {j}')