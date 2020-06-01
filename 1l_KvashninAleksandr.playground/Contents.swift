import Foundation

//Домашнее задание. Квашнина АЕ. Лекция 01


//********  Задание 01. Решить квадратное уравнение
//Дано квадротное уравнение вида ax2 + bx + c = 0

var a: Double = 2.0
var b: Double = 7.0
var c: Double = 1.0

var D: Double = b*b-4*a*c

if D < 0 {
    print("В уравнении нет решения.")
} else if D > 0 {
    print("Уравнение имеет 2 решения. Х1 = ")
    print(((-1)*b+sqrt(D))/(2*a))
    print("Х2 = ")
    print(((-1)*b-sqrt(D))/(2*a))
} else {
    print("Уравнение имеет 1 решение. Х = ")
    print((-1)*b/(2*a))
}


//********  Задание 02. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника

var cat1: Double = 2.0
var cat2: Double = 2.0

var gip: Double = sqrt(cat1*cat1+cat2*cat2)
var S: Double = cat1*cat2/2
var P: Double = cat1+cat2+gip

print("Площадь треугольника равна S = ")
print(S)

print("Периметр треугольника равен P = ")
print(P)

print("Гипотенуза треугольника равна = ")
print(gip)



//********  Задание 03. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var summa: Double = 5000
var perc: Double = 10

for index in 1...5 {
    summa = summa + summa*perc/100
}

print("Сумма вклада по истечении 5 лет составит:")
print(summa)

