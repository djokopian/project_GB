import Foundation


/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 */

protocol CarExecutable {
    var model: String { get set }
    var year: UInt { get }
    var motorStatus: Bool { get set }
    var windowStatus: Bool { get set }
    
    mutating func carAction (action: CarAction)
}

enum CarAction {
    case startedMotor, shutMotor, openWindow, closeWindow //общее для всех типов машин
}

/*
  2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 */

extension CarExecutable {
    
    mutating func carAction (action: CarAction) {
        switch action {
        case .shutMotor:
            guard motorStatus else {print("мотор уже выключен"); return}
            motorStatus = false
            print("Мотор выключен")
        
        case .startedMotor:
            guard !motorStatus else {print("мотор уже заведен"); return}
            motorStatus = true
            print("Мотор заведен")
            
        case .closeWindow:
            guard windowStatus else {print("окна уже закрыты"); return}
            windowStatus = false
            print("Окна закрыты")
            
        case .openWindow:
            guard !windowStatus else {print("окна уже открыты"); return}
            windowStatus = true
            print("Oкна открыты")
        }
    }

}

/*
  3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 */

class TrunkAuto: CarExecutable {
    var model: String
    var year: UInt
    var motorStatus: Bool = false
    var windowStatus: Bool = false
    
    let sizeTrunk: Double
    var volInTrunk: Double = 0

    func inTrunk(volume: Double) {
        if (volInTrunk+volume) < sizeTrunk {
            volInTrunk = volInTrunk + volume
        }
    }

    
    func outTrunk(volume: Double) {
        if (volInTrunk+volume) > sizeTrunk {
            volInTrunk = sizeTrunk
        }
    }
    
    init (model: String, year: UInt, sizeTrunk: Double) {
        self.model = model
        self.year = year
        self.sizeTrunk = sizeTrunk
    }
}

class SportCar: CarExecutable {
    var model: String
    var year: UInt
    var motorStatus: Bool = false
    var windowStatus: Bool = false
    
    let maxSpeed: UInt
    
    init (model: String, year: UInt, maxSpeed: UInt) {
        self.maxSpeed = maxSpeed
        self.model = model
        self.year = year
    }
}

/*
  4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 */

extension TrunkAuto: CustomStringConvertible {
    var description: String {
        return "Автомобиль грузовой. Модель - \(self.model). Год выпуска - \(self.year). Размер багажника - \(self.sizeTrunk). Заполнено в багажнике - \(self.volInTrunk). Статус положения окон - \(self.windowStatus). Статус двигателя - \(self.motorStatus)"
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Спортивный суперкар. Модель - \(self.model). Год выпуска - \(self.year). максимальная скорость - \(self.maxSpeed) км/ч. Статус положения окон - \(self.windowStatus). Статус двигателя - \(self.motorStatus)"
    }
}

/*
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 */

var auto1 = TrunkAuto(model: "Kamaz-001", year: 2010, sizeTrunk: 100)
var auto2 = SportCar(model: "Ferrari", year: 2019, maxSpeed: 325)

auto1.inTrunk(volume: 5.9)
auto1.carAction(action: .openWindow)

auto2.carAction(action: .startedMotor)

print(auto1)
print("*****************************")
print(auto2)

