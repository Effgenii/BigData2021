# -*- coding: cp1251 -*-
class Stationery:
    title = str()
    def draw (self):
        print('Запуск отрисовки')
class Pen(Stationery):
    def draw(self):
        print('Рисуем ручкой')
class Pencil(Stationery):
    def draw(self):
        print('Рисуем карандашом')
class Handle(Stationery):
    def draw(self):
        print('Рисуем маркером')

x = Stationery()
pen = Pen()
pencil = Pencil()
handle = Handle()
x.draw()
pen.draw()
pencil.draw()
handle.draw()


# 5. Реализовать класс Stationery (канцелярская принадлежность). Определить в нем атрибут title
# (название) и метод draw (отрисовка). Метод выводит сообщение “Запуск отрисовки.” Создать три
# дочерних класса Pen (ручка), Pencil (карандаш), Handle (маркер). В каждом из классов реализовать
# переопределение метода draw. Для каждого из классов методы должен выводить уникальное сообщение.
# Создать экземпляры классов и проверить, что выведет описанный метод для каждого экземпляра.
