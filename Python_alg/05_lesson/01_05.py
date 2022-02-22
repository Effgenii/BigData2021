# 1. Пользователь вводит данные о количестве предприятий, их наименования и прибыль за
# четыре квартала для каждого предприятия. Программа должна определить среднюю
# прибыль (за год для всех предприятий) и отдельно вывести наименования предприятий,
# чья прибыль выше среднего и ниже среднего.

from collections import defaultdict

spam = defaultdict(list)

N = int(input('Введите количество предприятий (целое, положительное): '))

for i in range(1, N + 1):
    name = input(f'Введите наименование {i} предприятия: ')
    profit = 0.0

    for j in range(1, 5):
        profit = float(input(f'Введите прибыль предприятия {name} за {j} квартал: '))
        spam[name].append(profit)

print(f' Список предприятий: {spam}')

average = 0.0
result_dict = defaultdict(float)

for k, v in spam.items():
    result_dict[k] = sum(v) / len(v)
    average += result_dict[k]

average = average / N
print(result_dict)
print(f'Средняя прибыль {average}')

list_min = []
list_max = []

for k, v in result_dict.items():
    if v < average:
        list_min.append(k)
    else:
        list_max.append(k)

print("Прибыль ниже среднего: ")
for name in list_min:
    print(name)

print("Прибыль выше среднего: ")
for name in list_max:
    print(name)
