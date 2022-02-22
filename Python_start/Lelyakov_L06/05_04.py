# -*- coding: cp1251 -*-

class Car:
    speed = float
    color = str
    name = str
    is_police = bool(0)
    def __init__(self, speed, color, name):
        self.speed = int(speed)
        self.color = color
        self.name = name

    def go (self):
        print ('машина', self.name, 'поехала')

    def stop (self):
        print ('машина', self.name, 'остановилась')

    def turn (self, direction):
        if direction == 'right':
            print('машина', self.name, 'повернула направо')
        elif direction == 'left':
            print('машина', self.name, 'повернула налево')
        else:
            print('команда поворота не распознана, машина', self.name, 'едет прямо')

    def show_speed (self):
        print ('машина', self.name, 'едет со скоростью', self.speed)

    def check_police (self):
        if self.is_police == 1:
            print ('машина', self.name,'полицейская машина')
        else:
            print ('машина', self.name,'не полицейская машина')

class TownCar(Car):
    def show_speed(self):
        if self.speed > 60:
            print('машина', self.name, 'едет с превышением скорости')
        else:
            print ('скорость машины', self.name, 'в норме')

class SportCar(Car):
    pass
class WorkCar(Car):
    def show_speed(self):
        if self.speed > 40:
            print('машина', self.name, 'едет с превышением скорости')
        else:
            print('скорость машины', self.name, 'в норме')
class PoliceCar(Car):
    is_police = 1

zaz = TownCar(70, 'Blue', 'ZAZ')
bmw = SportCar(360, 'Red', 'BMW')
renault = WorkCar(30, 'Grey', 'Renault')
police = PoliceCar(250,'White', 'Audi-Police')

zaz.turn('right')
zaz.show_speed()
zaz.check_police()
bmw.show_speed()
renault.turn('left')
renault.turn('налево')
renault.show_speed()
police.check_police()



# 4. Реализуйте базовый класс Car. У данного класса должны быть следующие атрибуты: speed, color, name,
# is_police (булево). А также методы: go, stop, turn(direction), которые должны сообщать, что
# машина поехала, остановилась, повернула (куда). Опишите несколько дочерних классов: TownCar,
# SportCar, WorkCar, PoliceCar. Добавьте в базовый класс метод show_speed, который должен показывать
# текущую скорость автомобиля. Для классов TownCar и WorkCar переопределите метод show_speed.
# При значении скорости свыше 60 (TownCar) и 40 (WorkCar) должно выводиться сообщение о превышении скорости.
# Создайте экземпляры классов, передайте значения атрибутов. Выполните доступ к атрибутам, выведите
# результат. Выполните вызов методов и также покажите результат.