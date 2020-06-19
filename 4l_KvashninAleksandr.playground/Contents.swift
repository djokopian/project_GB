import Foundation

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 */

class Car {
    
    let model: String
    let year: UInt
    var motor: motorStatus
    var window: windowStatus
    
    
    func startedMotor() {
        motor = .work
    }
    
    func shutMotor() {
        motor = .shutdown
    }
    
    func openWindow() {
        window = .open
    }
    
    func closeWindow() {
        window = .close
    }

    func inTrunk(volume: Double) {
        print("Информация о статусе загрузки и общей грузоподобностью недоступна.")
    }
    
    func outTrunk(volume: Double) {
        print("Информация о статусе загрузки и общей грузоподобностью недоступна.")
    }
    
    init (model: String, year: UInt) {
        self.model = model
        self.year = year
        motor = .shutdown
        window = .close
    }
    
}

/*
  2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 */


class TrunkAuto: Car {
    let sizeTrunk: Double
    var volInTrunk: Double = 0
    var trunk: trunkStatus = .empty
    
    override func inTrunk(volume: Double) {
        if (volInTrunk+volume) < sizeTrunk {
            volInTrunk = volInTrunk + volume
        }
    }

    
    // 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    override func outTrunk(volume: Double) {
        if (volInTrunk+volume) > sizeTrunk {
            volInTrunk = sizeTrunk
            trunk = .full
        }
    }
    
    init (model: String, year: UInt, sizeTrunk: Double) {
        self.sizeTrunk = sizeTrunk
        super.init(model: model, year: year)
    }

    
}

class SportAuto: Car {
    let maxSpeed: UInt
    
    
    // 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    override func inTrunk(volume: Double) {
        print("Данное действие недоступно со спортивной машиной.")
    }
    
    override func outTrunk(volume: Double) {
        print("Данное действие недоступно со спортивной машиной.")
    }
    
    init (model: String, year: UInt, maxSpeed: UInt) {
        self.maxSpeed = maxSpeed
        super.init(model: model, year: year)
    }

}

/*
  3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 */

enum windowStatus { //общее
    case open, close
}

enum motorStatus { //общее
    case work, shutdown
}

enum trunkStatus { //только для грузовика
    case full, empty, notAvible
}


/*
  5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 */

var auto1 = TrunkAuto(model: "Камаз", year: 2010, sizeTrunk: 100)
auto1.inTrunk(volume: 5)
auto1.openWindow()

var auto2 = SportAuto(model: "Феррари", year: 2015, maxSpeed: 325)
auto2.startedMotor()
auto2.openWindow()



/*
 6. Вывести значения свойств экземпляров в консоль.
*/



print("Автомобиль номер 1. Модель - ", auto1.model)
print("Автомобиль номер 1. Год выпуска - ", auto1.year)
print("Автомобиль номер 1. Размер багажника - ", auto1.sizeTrunk)
print("Автомобиль номер 1. Заполнено в багажнике - ", auto1.volInTrunk)
print("Автомобиль номер 1. Статус положения окон - ", auto1.window)
print("Автомобиль номер 1. Статус двигателя - ", auto1.motor)
print("******************************************************")
print("Автомобиль номер 2. Модель - ", auto2.model)
print("Автомобиль номер 2. Год выпуска - ", auto2.year)
print("Автомобиль номер 2. Максимальная скорость - ", auto2.maxSpeed)
print("Автомобиль номер 2. Статус положения окон - ", auto2.window)
print("Автомобиль номер 2. Статус двигателя - ", auto2.motor)
