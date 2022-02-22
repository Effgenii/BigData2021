# 5. Пользователь вводит номер буквы в алфавите. Определить, какая это буква.

import string
my_str = string.ascii_lowercase
a = (input('Введите номер буквы в латинском алфавите (от 1 до 26):'))
if a.isdigit() and int(a) > 0 and int(a) < 27:
    print (my_str[int(a)-1])
else:
    if a.isalpha():
        print('Введенное значение не число')
    else:
        print('Введенное значение не входит в диапазон латинского алфавита (от 1 до 26)')
