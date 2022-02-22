def user(name = 'n/a', surname = 'n/a', birthday = 'n/a', town = 'n/a', mail = 'n/a', phone = 'n/a'):
    return str(name + ' ' + surname + ' ' + birthday + ' ' + town + ' ' + mail + ' ' + phone)
name = input('name:')
surname = input('surname:')
birthday = input('birthday:')
town = input('town:')
mail = input('mail:')
phone = input('phone:')
# переменные передаем в функцию в произвольном порядке
print (user(phone = phone, name = name, surname = surname, birthday = birthday, town = town, mail = mail))

# 2. Реализовать функцию, принимающую несколько параметров, описывающих данные пользователя:
# имя, фамилия, год рождения, город проживания, email, телефон. Функция должна принимать параметры
# как именованные аргументы. Реализовать вывод данных о пользователе одной строкой.
