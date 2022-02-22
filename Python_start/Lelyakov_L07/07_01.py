class Matrix:
    m_view = []
    m_sum = []
    n = []
    def __init__(self, data: list):
        self.data = data
        self.rows = len(self.data)
        self.items = len(self.data[0])
        print ('создана новая матрица')

    def __str__(self):
        self.m_view.clear()
        for el in self.data:
            self.m_view.append(el)
        return ('\n'.join(map(str, self.m_view)))

    def __add__(self, other):
        print ('сумма матриц:')
        for row in range(0, self.rows):
            self.n.clear()
            for idx in range(0, self.items):
                self.n.append((other.data[row])[idx] + (self.data[row])[idx])
            self.m_sum.append(str(self.n))
        return (self.m_sum)

matrix_a = Matrix([[5, 3, 3, 7, 4],[4, 1, 6, 3, 7],[0, 2, 4, 1, 9],])
print(matrix_a)
matrix_b = Matrix([[1, 1, 1, 1, 1],[1, 1, 1, 1, 1],[1, 1, 1, 1, 1],])
print(matrix_b)
matrix_c = Matrix(matrix_b + matrix_a)
print(matrix_c)



# 1. Реализовать класс Matrix (матрица). Обеспечить перегрузку конструктора класса (метод __init__()),
# который должен принимать данные (список списков) для формирования матрицы.
# Подсказка: матрица — система некоторых математических величин, расположенных в виде прямоугольной схемы.
# Примеры матриц вы найдете в методичке.
# Следующий шаг — реализовать перегрузку метода __str__() для вывода матрицы в привычном виде.
# Далее реализовать перегрузку метода __add__() для реализации операции сложения двух объектов класса
# Matrix (двух матриц). Результатом сложения должна быть новая матрица.
# Подсказка: сложение элементов матриц выполнять поэлементно — первый элемент первой строки первой матрицы
# складываем с первым элементом первой строки второй матрицы и т.д.