import random

st = ""
ls = []
x = 0
with open("lesson5.txt", "w", encoding="utf-8") as out_file:
    # Больше чисел богу чисел !!!
    for _ in range(3):
        for _ in range(3):
            st = st + str(random.randint(1, 3)) + str(" ")
        ls.append(st + '\n')
        st = ''
    out_file.writelines(ls)

with open("lesson5.txt", "r") as in_file:
    for line in in_file:
        line = line.replace(" \n", "")
        line = (line.split(' '))
        print(line)
        for el in line:
            x = int(el) + x
    print('Сумма всех чисел:', x)

# 5. Создать (программно) текстовый файл, записать в него программно набор чисел, разделенных
# пробелами. Программа должна подсчитывать сумму чисел в файле и выводить ее на экран.
