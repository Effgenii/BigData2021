with open("lesson4.txt", 'r', encoding="utf-8") as in_file:
    content = in_file.readlines()
    content_new = []
    for n_names in content:
        # n_names = n_names.replace("\n", "")
        n_names = n_names.replace("One", "Один")
        n_names = n_names.replace("Two", "Два")
        n_names = n_names.replace("Three", "Три")
        n_names = n_names.replace("Four", "Четыре")
        n_names = n_names.replace("Five", "Пять")
        n_names = n_names.replace("Six", "Шесть")
        n_names = n_names.replace("Seven", "Семь")
        n_names = n_names.replace("Eight", "Восемь")
        n_names = n_names.replace("Nine", "Девять")
        n_names = n_names.replace("Ten", "Десять")
        content_new.append(n_names)
# Потом нужно будет разобраться с кодировками.
with open("lesson4_trans.txt", "w") as out_file:
    out_file.writelines(content_new)

# 4. Создать (не программно) текстовый файл со следующим содержимым:
# One — 1
# Two — 2
# Three — 3
# Four — 4
# Необходимо написать программу, открывающую файл на чтение и считывающую построчно данные.
# При этом английские числительные должны заменяться на русские. Новый блок строк должен
# записываться в новый текстовый файл.
#
