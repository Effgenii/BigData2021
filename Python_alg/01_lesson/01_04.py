# 4. Пользователь вводит две буквы. Определить, на каких местах алфавита они стоят,
# и сколько между ними находится букв.

import string
my_str = string.ascii_lowercase
a = input ('Введите первую латинскую букву:')
b = input ('Введите вторую латинскую букву:')
a, b = a.lower(), b.lower()
if a in my_str and b in my_str:
    print('Первая буква стоит на месте', my_str.find(a)+1)
    print('Вторая буква стоит на месте', my_str.find(b)+1)
    print('Между ними', my_str.find(b) - my_str.find(a) - 1, 'букв')
else:
    print ('Как минимум одно из введенных значений не латинская буква')