# 4. Определить, какое число в массиве встречается чаще всего.

from random import randint

array_len = 10
array = [randint(1, 7) for _ in range(array_len)]
max_count = 1
num = array[0]

for i in range(array_len - 1):
    count = 1
    for j in range(i + 1, array_len):
        if array[i] == array[j]:
            count += 1
    if count > max_count:
        max_count = count
        num = array[i]

print(f" Исходный массив: {array}")

if max_count > 1:
    print(f" В массиве чаще всего встречается число _{num}_, в количестве _{max_count}_ раз(а)")
else:
    print('В массиве нет повтояющихся чисел!')