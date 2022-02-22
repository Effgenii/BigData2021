# -*- coding: cp1251 -*-

class Worker:
    name = str
    surname = str
    position = str
    _income = dict
class Position(Worker):
    def __init__(self, name, surname, position, wage: float, bonus: float):
        self.name = str(name)
        self.surname = str(surname)
        self.position = str(position)
        self._income = {'wage': wage, 'bonus': bonus}
    def get_full_name (self):
        return self.name + ' ' + self.surname
    def get_total_income (self):
        return (self._income['wage']+ self._income['bonus'])

ii = Position('Иван','Иванов', 'менеджер' ,1000, 100)
pp = Position('Петр','Пeтров', 'программист',1100, 150)
print (ii.get_full_name(), ii.position, ii.get_total_income())
print (pp.get_full_name(), pp.position, pp.get_total_income())

# 3. Реализовать базовый класс Worker (работник), в котором определить атрибуты: name, surname,
# position (должность), income (доход). Последний атрибут должен быть защищенным и ссылаться на словарь,
# содержащий элементы: оклад и премия, например, {"wage": wage, "bonus": bonus}. Создать класс Position
# (должность) на базе класса Worker. В классе Position реализовать методы получения полного имени
# сотрудника (get_full_name) и дохода с учетом премии (get_total_income). Проверить работу примера
# на реальных данных (создать экземпляры класса Position, передать данные, проверить значения атрибутов,
# вызвать методы экземпляров).