#task_2

def merge_sort(lst):
    count = len(lst)
    if count > 2:
        part_1 = merge_sort(lst[:count // 2])
        part_2 = merge_sort(lst[count // 2:])
        lst = part_1 + part_2
        last_index = len(lst) - 1
        for i in range(last_index):
            min_value = lst[i]
            min_index = i
            for j in range(i + 1, last_index + 1):
                if min_value > lst[j]:
                    min_value = lst[j]
                    min_index = j
            if min_index != i:
                lst[i], lst[min_index] = lst[min_index], lst[i]
    elif len(lst) > 1 and lst[0] > lst[1]:
        lst[0], lst[1] = lst[1], lst[0]
    
    return lst

from random import randint
size = 10
a, b = 0, 49
lst = [randint(a,b) for _ in range(size)]
print(lst)
print(merge_sort(lst))
