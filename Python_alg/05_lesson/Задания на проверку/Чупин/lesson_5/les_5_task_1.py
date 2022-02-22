"""
1. Пользователь вводит данные о количестве предприятий,
их наименования и прибыль за четыре квартала для каждого предприятия.
Программа должна определить среднюю прибыль (за год для всех предприятий)
и отдельно вывести наименования предприятий,
чья прибыль выше среднего и ниже среднего.
"""

from collections import namedtuple


Company = namedtuple('Company', 'name, qrt_profit, profit')
all_companies = set()

n = int(input('Введите кол-во предприятий: '))
print('\nВведите названия предприятий и их поквартальную прибыль.')
total_profit = 0

for i in range(n):
    profit = 0
    qrt_profit = []
    name = input(f'\nНазвание предприятия № {i + 1}: ')

    for j in range(4):  # 4 квартала
        qrt_profit.append(int(input(f'Прибыль за {j + 1}-й квартал: ')))
        profit += qrt_profit[j]

    comp = Company(name=name, qrt_profit=tuple(qrt_profit), profit=profit)
    all_companies.add(comp)
    total_profit += profit

average_profit = total_profit / n
print(f'\nСредняя прибыль (за год для всех предприятий) = {average_profit:.2f}\n')

for comp in all_companies:
    if comp.profit > average_profit:
        print(f'Предприятие {comp.name} показало прибыль выше среднего - {comp.profit}')

for comp in all_companies:
    if comp.profit < average_profit:
        print(f'Предприятие {comp.name} показало прибыль ниже среднего - {comp.profit}')

for comp in all_companies:
    if comp.profit == average_profit:
        print(f'Предприятие {comp.name} показало прибыль на среднем уровне - {comp.profit}')
