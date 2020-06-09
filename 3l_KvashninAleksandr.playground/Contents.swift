import Foundation

/*
 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 */

enum typeAuto {
    case car, truck
}

enum windowStatus {
    case open, close
}

enum motorStatus {
    case work, shutdown
}

enum trunkStatus {
    case full, empty, notAvible
}

struct auto {
    
    let type: typeAuto
    let model: String
    let year: UInt
    let sizeTrunk: Double
    var volInTrunk: Double = 0
    var motor: motorStatus
    var window: windowStatus
    var trunk: trunkStatus
    
    
    //3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
    
    mutating func startedMotor() {
        self.motor = .work
    }
    
    mutating func shutMotor() {
        self.motor = .shutdown
    }
    
    mutating func openWindow() {
        self.window = .open
    }
    
    mutating func closeWindow() {
        self.window = .close
    }

    //4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    
    mutating func inTrunk(volume: Double) {
        self.volInTrunk = self.volInTrunk + volume
        if self.volInTrunk >= self.sizeTrunk {
            self.trunk = .full
        }
    }
    
    mutating func outTrunk(volume: Double) {
        self.volInTrunk = self.volInTrunk - volume
        if self.volInTrunk < self.sizeTrunk {
            self.trunk = .full
        }
    }
    
    init (type: typeAuto, model: String, year: UInt, sizeTrunk: Double) {
        self.type = type
        self.model = model
        self.year = year
        self.sizeTrunk = sizeTrunk
        
        self.volInTrunk = 0
        
        self.motor = .shutdown
        self.window = .close
       
        if type == .truck {
            self.trunk = .empty
        }
      
        if type == .car {
            self.trunk = .notAvible
        }
        
        self.trunk = .empty
    }
    
}


//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

var auto1 = auto(type: .car, model: "Model 111", year: 2019, sizeTrunk: 0)

var auto2 = auto(type: .truck, model: "Model Truck 666", year: 2007, sizeTrunk: 12.2)



//6. Вывести значения свойств экземпляров в консоль.


print("Автомобиль номер 1. Тип - ", auto1.type)
print("Автомобиль номер 1. Модель - ", auto1.model)
print("Автомобиль номер 1. Год выпуска - ", auto1.year)
print("Автомобиль номер 1. Размер багажника - ", auto1.sizeTrunk)
print("Автомобиль номер 1. Статус кузова - ", auto1.trunk)
print("Автомобиль номер 1. Статус положения окон - ", auto1.window)
print("Автомобиль номер 1. Статус двигателя - ", auto1.motor)

print("Автомобиль номер 2. Тип - ", auto2.type)
print("Автомобиль номер 2. Модель - ", auto2.model)
print("Автомобиль номер 2. Год выпуска - ", auto2.year)
print("Автомобиль номер 2. Размер багажника - ", auto2.sizeTrunk)
print("Автомобиль номер 2. Статус кузова - ", auto2.trunk)
print("Автомобиль номер 2. Статус положения окон - ", auto2.window)
print("Автомобиль номер 2. Статус двигателя - ", auto2.motor)
