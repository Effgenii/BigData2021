with open("lesson6.txt", "r", encoding="utf-8") as in_file:
    content = in_file.readlines()
    pivot = {}
    for el in content:
        el = el.replace("\n", "")
        subject = str(el[0:el.find(':'):])
        hours = el[(el.find(':')+2)::].split(" ")
        laboratory = 0
        practic = 0
        lecture = 0
        for hr in hours:
            if '(лаб)' in hr:
                laboratory = int(hr[0:(hr.find('(лаб)')):])
            elif '(пр)' in hr:
                practic = int(hr[0:(hr.find('(пр)')):])
            elif '(л)' in hr:
                lecture = int(hr[0:(hr.find('(л)')):])
        pivot [subject] = (laboratory + practic + lecture)
        # следующая строка была нужна для отладки
        # print (subject, hours, 'лабор:', laboratory, 'практ:', practic,'лекц:', lecture)
    print (pivot)

# 6. Необходимо создать (не программно) текстовый файл, где каждая строка описывает учебный
# предмет и наличие лекционных, практических и лабораторных занятий по этому предмету и их
# количество. Важно, чтобы для каждого предмета не обязательно были все типы занятий.
# Сформировать словарь, содержащий название предмета и общее количество занятий по нему.
# Вывести словарь на экран.
# Примеры строк файла:
# Информатика: 100(л) 50(пр) 20(лаб)
# Физика: 30(л) 10(лаб)
# Физкультура: 30(пр)
#
# Пример словаря:
# {“Информатика”: 170, “Физика”: 40, “Физкультура”: 30}
