class Data:
    date = str()

    def __init__(self, data):
        date = data

    @classmethod
    def data_to_int(cls, data):
        day = int(data[0: 2])
        month = int(data[3: 5])
        year = int(data[6: ])
        print (cls, day, type(day), month, year)

    @staticmethod
    def data_valid (data):
        if int(data[0: 2]) > 31:
            print ('некорректная дата')
        if int(data[3: 5]) > 12:
            print ('некорректный месяц')
        if int (data[6: 10]) < 1000 or len(data[6:]) !=4:
            print ('некорректный год')

# a = Data('10-10-2021')
Data.data_to_int('10-10-2021')
Data.data_valid('10-10-2011')

# 1. Реализовать класс «Дата», функция-конструктор которого должна принимать дату в виде
# строки формата «день-месяц-год». В рамках класса реализовать два метода. Первый, с декоратором
# @classmethod, должен извлекать число, месяц, год и преобразовывать их тип к типу «Число».
# Второй, с декоратором @staticmethod, должен проводить валидацию числа, месяца и года
# (например, месяц — от 1 до 12). Проверить работу полученной структуры на реальных данных.