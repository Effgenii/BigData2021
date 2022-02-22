class ComplexNumbers:
    real_number: float
    imaginary_number: float

    def __init__(self, real_number: float, imaginary_number: float):
        self.real_number = real_number
        self.imaginary_number = imaginary_number

    def __add__(self, other: 'ComplexNumbers'):
        return (ComplexNumbers(self.real_number + other.real_number, self.imaginary_number + other.imaginary_number))

    def __mul__(self, other: 'ComplexNumbers'):
        real1 = self.real_number * other.real_number
        real2 = self.imaginary_number * other.imaginary_number * -1
        img1 = self.real_number * other.imaginary_number
        img2 = self.imaginary_number * other.real_number
        real_number = real1 + real2
        imaginary_number = img1 + img2
        return (ComplexNumbers(real_number, imaginary_number))

    def __str__(self):
        if self.imaginary_number > 0:
            complex = str('+')
        else:
            complex = str(' ')
        return (str(self.real_number) + complex + str(self.imaginary_number) + 'i')

a = ComplexNumbers(2, 44)
b = ComplexNumbers(3, 11)

print(a + b)
print(a * b)


# 7. Реализовать проект «Операции с комплексными числами». Создайте класс «Комплексное число»,
# реализуйте перегрузку методов сложения и умножения комплексных чисел. Проверьте работу
# проекта, создав экземпляры класса (комплексные числа) и выполнив сложение и умножение
# созданных экземпляров. Проверьте корректность полученного результата.