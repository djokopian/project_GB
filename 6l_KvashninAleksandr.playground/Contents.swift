import Foundation


/*
  1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 */

struct Queue<T: Ratingabe> {                 //создаем тип коллеции, который поддерживает фильтрацию по какому-либо рейтингу
    
    private var elements: [T] = []          // массив типа Т
       
    mutating func push(_ element: T) {      // добавляем элемент типа Т
        elements.append(element)
    }
    mutating func pop() -> T? {             // извлекаем элемент типа Т
        return elements.removeLast()
    }

    var totalRating : Double {             // свойство, отражающее общий рейтинг коллекции
        var rating = 0.0
        for element in elements {
            rating += element.rating
        }
        return rating
    }

    /*
     2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
     */
    
    func filter(predicate: (Ratingabe) -> Bool ) -> [Ratingabe] {
        var tmpArray = [Ratingabe]()               // создает временный массив
        for element in elements {
            if predicate(element) {                 // вызываем замыкание, чтобы проверить элемент
                tmpArray.append(element)
            }
        }
        return tmpArray                             // возвращаем отфильтрованный массив
    }

    
    /*
     3. Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
     */
    
    subscript(element: Int) -> Double? {

        if element >= self.elements.count { return nil }
        
        return self.elements[element].rating
        
    }
    
    
}


 // создаем протокол рейтинга

protocol Ratingabe {
    var rating: Double { get set }
    var name: String{ get }
}



// ПРОВЕРКА

class Hotel: Ratingabe {        //создадим класс отелей для хранения названия и рейтинга отелей
    
    var rating: Double
    let name: String
    let yaerConstruct: Int
    let roomCount: Int
    
    init (name: String, yaerConstruct: Int, roomCount: Int) {
        self.name = name
        self.yaerConstruct = yaerConstruct
        self.roomCount = roomCount
        rating = Double(yaerConstruct/100 + roomCount/10)
        print(rating)
    }
    
}


class Restaraunt: Ratingabe {        //создадим класс рестаранов для хранения названия и рейтинга рестаранов
    
    var rating: Double
    let name: String
    let middleCost: Int
    let guestCount: Int
    
    init (name: String, middleCost: Int, guestCount: Int) {
        self.name = name
        self.middleCost = middleCost
        self.guestCount = guestCount
        rating = Double(middleCost/10 + guestCount/2)
        print(rating)
    }
    
}


//создадим очередь для посещения гостиниц с учетом рейтинга
var queueHotel = Queue<Hotel>()
//создадим очередь для посещения рестаранов с учетом рейтинга
var queueRestarant = Queue<Restaraunt>()


// добавляем элементы
queueHotel.push(Hotel(name: "Grand", yaerConstruct: 1910, roomCount: 153))
queueHotel.push(Hotel(name: "Supreme", yaerConstruct: 2010, roomCount: 213))
queueHotel.push(Hotel(name: "Classic", yaerConstruct: 2001, roomCount: 13))
queueHotel.push(Hotel(name: "EcoNom", yaerConstruct: 1988, roomCount: 1133))

queueHotel.totalRating

queueRestarant.push(Restaraunt(name: "Grand", middleCost: 100, guestCount: 100))
queueRestarant.push(Restaraunt(name: "Supreme", middleCost: 200, guestCount: 50))
queueRestarant.push(Restaraunt(name: "Classic", middleCost: 50, guestCount: 150))
queueRestarant.push(Restaraunt(name: "EcoNom", middleCost: 30, guestCount: 100))
queueRestarant.push(Restaraunt(name: "DoshiRak", middleCost: 10, guestCount: 15))

queueRestarant.totalRating

let minRating: Double = 30.0  //минимальный рейтинг для фильтрации очередей

var bestHotels = queueHotel.filter{ $0.rating > minRating }
for index in bestHotels {
    print(index.name)
}

var notBestRestaraunt = queueRestarant.filter{ $0.rating < minRating }
for index in notBestRestaraunt {
    print(index.name)
}


var grandNameRestaraunt = queueRestarant.filter{ $0.name == "Grand" }
for index in grandNameRestaraunt {
    print(index.rating)
}

queueHotel[2]
queueHotel[0]
queueHotel[17]

queueRestarant[1]
queueRestarant[3]
queueRestarant[45]
