
month = int(input("enter month number:"))
dict_season = {}
if month == 12 or month == 1 or month == 2:
    season = 0
elif month == 3 or month == 4 or month == 5:
    season = 1
elif month == 6 or month == 7 or month == 8:
    season = 2
elif month == 9 or month == 10 or month == 11:
    season = 3
else:
    print ('no month with this number!')
    season = 4

list = ['winter', 'spring', 'summer', 'autumn', 'season not definied']
dict_season = { 0 : 'winter', 1 : 'spring', 2 : 'summer', 3 : 'autumn', 4 : 'season not definied'}
print('via list:', list[season])
print('via dictionary:', dict_season.get(season))

# 3. Пользователь вводит месяц в виде целого числа от 1 до 12. Сообщить к какому времени года относится
# месяц (зима, весна, лето, осень). Напишите решения через list и через dict.