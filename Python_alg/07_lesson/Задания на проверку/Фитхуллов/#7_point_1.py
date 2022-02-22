#task_1

def bubble_sort(lst):
    size = len(lst)
    for i in range(size):
        for j in range(size - i - 1):
            if lst[j] > lst[j+1]:
                lst[j], lst[j+1] = lst[j+1], lst[j]

from random import randint
size = 10
a, b = -100, 99
lst = [randint(a,b) for _ in range(size)]

print(lst)
bubble_sort(lst)            
print(lst)
