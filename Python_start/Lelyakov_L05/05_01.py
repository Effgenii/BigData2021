outfile = open('lesson1.txt', 'w')
while True:
    st = input(str('Enter string ("enter" for exit): '))
    if not st:
        break
    outfile.write(st + '\n')
outfile.close()


# 1. Создать программно файл в текстовом формате, записать в него построчно данные, вводимые
# пользователем. Об окончании ввода данных свидетельствует пустая строка.