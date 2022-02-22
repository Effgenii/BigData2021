"""
Пользователь вводит данные о количестве предприятий, их наименования и прибыль за четыре квартала для каждого предприятия.
Программа должна определить среднюю прибыль (за год для всех предприятий) и отдельно вывести наименования предприятий, чья прибыль выше среднего и ниже среднего.
"""

from collections import defaultdict
from collections import deque

count_company = int(input('Введите количество компаний: '))

companies = defaultdict(int)
profit_companies = deque()
un_profit_companies = deque()

all_profit = 0


for i in range(count_company):
    name, profit_q1, profit_q2, profit_q3, profit_q4 = input("Введите данные по компании: ").split()
    profit = int(profit_q1) + int(profit_q2) + int(profit_q3) + int(profit_q4)
    companies[name] = profit
    all_profit += profit

"""
name, profit_q1, profit_q2, profit_q3, profit_q4 = "Компания1 10000 12000 15000 5000".split()
profit = int(profit_q1) + int(profit_q2) + int(profit_q3) + int(profit_q4)
companies[name] = profit
all_profit += profit

name, profit_q1, profit_q2, profit_q3, profit_q4 = "Компания2 5000 10000 45000 32000".split()
profit = int(profit_q1) + int(profit_q2) + int(profit_q3) + int(profit_q4)
companies[name] = profit
all_profit += profit

name, profit_q1, profit_q2, profit_q3, profit_q4 = "Компания3 6000 45000 24000 56000".split()
profit = int(profit_q1) + int(profit_q2) + int(profit_q3) + int(profit_q4)
companies[name] = profit
all_profit += profit
"""

avg_profit = all_profit / count_company

for key, value in companies.items():
    if value >= avg_profit:
        profit_companies.append(key)
    else:
        un_profit_companies.append(key)

print(f'Средняя прибыль для всех компаний составила: {avg_profit}')
print(f'Прибыль выше среднего у {list(profit_companies)} компаний:')
print(f'Прибыль ниже среднего у {list(un_profit_companies)} компаний:')

