import statistics
with open("lesson3.txt", 'r') as outfile:
    content = outfile.readlines()
    salary = []
    for empl in content:
        empl = empl.replace("\n", "")
        salary.append(int(empl[empl.rfind(" ")::]))
        if int(empl[empl.rfind(" ")::]) < 20000:
            print (empl[:empl.rfind(" "):])
    print ('средняя величина дохода сотрудников', statistics.mean(salary))

# 3. Создать текстовый файл (не программно), построчно записать фамилии сотрудников и величину
# их окладов. Определить, кто из сотрудников имеет оклад менее 20 тыс., вывести фамилии этих
# сотрудников. Выполнить подсчет средней величины дохода сотрудников.