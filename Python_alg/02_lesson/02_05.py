# 5. Вывести на экран коды и символы таблицы ASCII, начиная с символа под номером 32 и заканчивая 127-м включительно.
# Вывод выполнить в табличной форме: по десять пар «код-символ» в каждой строке.

x = 1
string = ''
for i in range(32, 128):
    if x < 10:
        print(f'{i} = {chr(i)}', end='\t\t')
        x += 1
    else:
        print(f'{i} = {chr(i)}', end='\n')
        x = 1