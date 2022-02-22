"""
4. Определить, какое число в массиве встречается чаще всего.
"""

from random import randint
my_list = [randint(1, 20) for _ in range(30)]
my_dict = {}
for i in range(len(my_list)):
    try:
        my_dict[my_list[i]] += 1
    except KeyError:
        my_dict[my_list[i]] = 1

number = list(set(my_dict.values()))[-1]
ans_in = list(my_dict.values()).index(number)
answer = list(my_dict.keys())[ans_in]
print(f'В массиве {my_list} \n число {answer} встречается чаще всего - {number} раз')
