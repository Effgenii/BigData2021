from abc import ABC, abstractmethod
class Outfit(ABC):
    name = str
    def __init__(self, name):
        self.name = str(name)
    @property
    @abstractmethod
    def calculation(self):
        pass
class Coat(Outfit):
    size: float
    def __init__(self, name, S):
        super(Coat, self).__init__(name)
        self.size = float(S)
    @property
    def calculation(self):
        return round((self.size / 6.5 + 0.5),3)

class Suit(Outfit):
    height: float
    def __init__(self, name, H):
        super(Suit, self).__init__(name)
        self.height = float(H)
    @property
    def calculation(self):
        return round((2 * self.height + 0.3),3)

coat = Coat('пальто', 10)
suit = Suit('костюм', 1.70)
print ('Расход ткани на', "\033[33m" , coat.name,"\033[0m", coat.calculation, 'м2')
print ('Расход ткани на', "\033[33m" ,suit.name, "\033[0m", suit.calculation, 'м2')

# 2. Реализовать проект расчета суммарного расхода ткани на производство одежды. Основная сущность (класс)
# этого проекта — одежда, которая может иметь определенное название. К типам одежды в этом проекте
# относятся пальто и костюм. У этих типов одежды существуют параметры: размер (для пальто) и рост
# (для костюма). Это могут быть обычные числа: V и H, соответственно.
# Для определения расхода ткани по каждому типу одежды использовать формулы: для пальто (V/6.5 + 0.5),
# для костюма (2 * H + 0.3). Проверить работу этих методов на реальных данных.
# Реализовать общий подсчет расхода ткани. Проверить на практике полученные на этом уроке знания:
# реализовать абстрактные классы для основных классов проекта, проверить на практике работу декоратора
# @property.