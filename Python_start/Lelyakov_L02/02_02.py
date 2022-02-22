
i = int(input('введите число элементов списка:'))
x = 0
list_my = []
list_processed = []
while x < i:
    list_my.append(input())
    x += 1
print('исходный список', list_my)
list_processed = list_my
for x in range(0, len(list_processed)-1, 2):
    # если число членов нечетное - счетчику не хватает длины на последний шаг
    x += 1
    list_processed[x-1], list_processed[x] = list_processed[x], list_processed[x-1]
print('обработанный список', list_processed)

# 2. Для списка реализовать обмен значений соседних элементов, т.е. Значениями обмениваются
# элементы с индексами 0 и 1, 2 и 3 и т.д. При нечетном количестве элементов последний
# сохранить на своем месте. Для заполнения списка элементов необходимо использовать функцию input().
