def my_func(x, y, z):
    if x <= y and x <= z:
        return (y + z)
    elif y <= x and y <= z:
        return (x + z)
    elif z <= y and z <= x:
        return (x + y)
x = float(input('x ='))
y = float(input('y ='))
z = float(input('z ='))
print ('сумма наибольших:', my_func(x,y,z))

# 3. Реализовать функцию my_func(), которая принимает три позиционных аргумента, и возвращает
# сумму наибольших двух аргументов.
