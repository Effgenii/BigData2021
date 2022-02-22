"""
2. Написать программу сложения и умножения двух шестнадцатеричных чисел.
При этом каждое число представляется как массив,
элементы которого — цифры числа.
Например, пользователь ввёл A2 и C4F.
Нужно сохранить их как [‘A’, ‘2’] и [‘C’, ‘4’, ‘F’] соответственно.
Сумма чисел из примера: [‘C’, ‘F’, ‘1’],
произведение - [‘7’, ‘C’, ‘9’, ‘F’, ‘E’].
"""

from collections import deque


print('\nВы вводите два шестнадцатеричных числа, '
      'программа находит их сумму и произведение.\n')


def conv(n, ri, ro):
    digs = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    acc = 0
    for a in n:
        k = digs.find(a)
        acc = acc * ri + k
    res = ""
    while acc > 0:
        k = acc % ro
        res = digs[k] + res
        acc = acc // ro
    return res


n_1 = deque()
n_2 = deque()

num1 = input('Введите первое число: ').upper()
num2 = input('Введите второе число: ').upper()

for i in num1:
    n_1.append(i)

for i in num2:
    n_2.append(i)


print(n_1, n_2, sep='\n')


a = conv(n_1, 16, 10)
b = conv(n_2, 16, 10)
print(f'Число {num1} = {a}\n'
      f'Число {num2} = {b}')


num_sum = int(a) + int(b)  # тут int используется не для перевода в десятичную систему,
num_mul = int(a) * int(b)  # а для преобразования str в int


print(f'Сумма двух чисел = {num_sum}\n'
      f'Произведение = {num_mul}')


a = deque(conv(str(num_sum), 10, 16))
b = deque(conv(str(num_mul), 10, 16))

print(f'Сумма чисел равна {list(a)}')
print(f'Произведение числе равно {list(b)}')
