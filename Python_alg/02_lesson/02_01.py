# 1. Написать программу, которая будет складывать, вычитать, умножать или делить два числа.
# Числа и знак операции вводятся пользователем. После выполнения вычисления программа не
# завершается, а запрашивает новые данные для вычислений. Завершение программы должно выполняться
# при вводе символа '0' в качестве знака операции. Если пользователь вводит неверный знак
# (не '0', '+', '-', '', '/'), программа должна сообщать об ошибке и снова запрашивать знак
# операции. Также она должна сообщать пользователю о невозможности деления на ноль, если он
# ввел его в качестве делителя.

x = None

while x != '0':
    a = float(input('Введите первое число:  '))
    b = float(input('Введите второе число:  '))
    x = input('Введите оператор (введите 0 для выхода):  ')

    if x == '+':
        print(f'{a} + {b} = {a + b}')
    elif x == '-':
        print(f'{a} - {b} = {a - b}')
    elif x == '*':
        print(f'{a} * {b} = {a * b}')
    elif x == '/':
        if b != 0:
            print(f'{a} / {b} = {a / b}')
        else:
            print(f'На 0 делить нельзя')
    elif x == '0':
        break
    else:
        print('Введен не верный оператор.')

print('Программа завершена!')