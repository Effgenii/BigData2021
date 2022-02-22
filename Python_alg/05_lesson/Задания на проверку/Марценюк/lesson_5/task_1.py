"""1. Пользователь вводит данные о количестве предприятий, их наименования
и прибыль за четыре квартала для каждого предприятия.
Программа должна определить среднюю прибыль (за год для всех предприятий)
и отдельно вывести наименования предприятий, чья прибыль выше среднего и ниже среднего.
Задача считается решённой, если в ней использована как минимум одна коллекция из модуля collections.
"""

from collections import namedtuple
from statistics import mean

Company = namedtuple("Company", "name profit avg")

l = []
n = int(input("Введите количество компаний: "))

for i in range(n):
    name = input(f"Введите имя компании {i + 1}: ")
    x = input("Введите через пробел поквартальную прибыль: ").split()
    l.append(Company(name, x[0:], mean(map(int, x[0:]))))

avg = mean([i.avg for i in l])

for i in l:
    print(f"У компании {i.name} средняя прибыль за год: {i.avg}")

print("*" * 50)

print("Компании с прибылью выше среднего:")
for i in l:
    if i.avg > avg:
        print(i.name)

print("Компании с прибылью ниже среднего:")
for i in l:
    if i.avg < avg:
        print(i.name)