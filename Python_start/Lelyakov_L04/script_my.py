
# Скрипт к заданию №1
def salary(productivity=40, rate=5, bonus=40):
    return ((productivity * rate) + bonus)

# Скрипт к заданию №2, 4
def generator(num, interval = 100):
    from random import randint
    new_list = [randint(0, interval) for el in list(range(num))]
    return (new_list)

# Скрипт к заданию №6a
def lin_genetrator(num, interval, interval_stop = 101):
    new_list = [el for el in list(range(num, interval)) if el < interval_stop]
# я знаю про функцию count, но генератор кажется красивее
    return (new_list)

# Скрипт к заданию №6b
def rep_generator (code, repeat):
    from itertools import cycle
    c = 0
    new_list = []
    for el in cycle(code):
        if c > repeat or c > 100:
            break
        new_list.append(el)
        c += 1
    return (new_list)

# Скрипт к заданию №7
def factorial(n):
    n = int(n)
    res = 1
    if n <= 0:
        yield res
    for x in range(1, n + 1):
        res *= x
        yield res