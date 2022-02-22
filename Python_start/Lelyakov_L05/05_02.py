with open("lesson2.txt", 'r') as outfile:
    st = outfile.readlines()
    print('Количество строк в файле ', len(st))
    for word in st:
        print ('в строке ', word.replace("\n", ""), len(word.split()), 'слов(а)')


# 2. Создать текстовый файл (не программно), сохранить в нем несколько строк, выполнить
# подсчет количества строк, количества слов в каждой строке.