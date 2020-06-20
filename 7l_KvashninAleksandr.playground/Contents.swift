import Foundation

enum operationError: Error {
    case notMoneyForBuy, notCountForSell, notShareForSell
}


class Portfolio { //создаем портфель для хранения данных об акциях в наличии
    
    var shares = [Share]() //изначально нет акций
    var deposit:Double = 100000.0 //начальный депозит
    
//ЗАДАНИЕ 2/ ******************   Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
    func buy(share: Share) -> operationError? {  //добавим метод покупки акции
        
        guard share.price*Double(share.count) < deposit else { return operationError.notMoneyForBuy }  //делаем вывод ошибки типа Error
        
        for (index, value) in shares.enumerated() {  //если такая акция есть, то добавляем данные о покупки в имеющийся элемент
            if value.ticker == share.ticker {
                shares[index].price = (shares[index].price * Double(shares[index].count) + share.price * Double(share.count)) / Double((shares[index].count + share.count))
                shares[index].count += share.count
                deposit -= Double(share.count)*share.price
                print("Добавлено \(share.count) \(share.ticker) акций на общую сумму \(Double(share.count)*share.price) денег. Размер депозита - \(deposit) денег")
                return nil
            }
        }
        
        shares.append(share)  //если акция новая, то добавляем его в архив
        deposit -= Double(share.count)*share.price
        print("Куплено \(share.count) \(share.ticker) акций на общую сумму \(Double(share.count)*share.price) денег. Размер депозита - \(deposit) денег")
        return nil
    }
    
    
//ЗАДАНИЕ 1/ ******************   Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
    func sell(share: Share) throws { //добавляем метод продажи акций
        
        for (index, value) in shares.enumerated() {  //ищем акцию в портфолию
            if value.ticker == share.ticker {
                if value.count < share.count { throw operationError.notCountForSell }
                shares[index].count -= share.count
                deposit += Double(share.count)*share.price
                print("Продано \(share.count) \(share.ticker) акций на общую сумму \(Double(share.count)*share.price) денег. Размер депозита - \(deposit) денег")
                return
            }
        }
        throw operationError.notShareForSell  //если акций не нашли значит таких нет
    }
}

struct Share {
    let ticker: Ticker
    var count: Int
    var price: Double
}

enum Ticker {
    case APL, GGL, GZP, SBER
}




//********************   ПРОВЕРКА  **********************

let user001 = Portfolio()


//Проверка покупки с выводом nil или типа ошибки

if let buy = user001.buy(share: Share(ticker: .APL, count: 10, price: 1000000.1)){
    print("Ошибка! Код ошибки - \(buy).")
} else {
    print("Акции куплены")
}

if  let buy = user001.buy(share: Share(ticker: .APL, count: 20, price: 111.1)){
    print("Ошибка! Код ошибки - \(buy).")
} else {
    print("Акции куплены")
}


if let buy = user001.buy(share: Share(ticker: .GGL, count: 20, price: 75.1)){
    print("Ошибка! Код ошибки - \(buy).")
} else {
    print("Акции куплены")
}


if let buy = user001.buy(share: Share(ticker: .GZP, count: 15, price: 113.1)){
    print("Ошибка! Код ошибки - \(buy).")
} else {
    print("Акции куплены")
}

//Проверка покупки с выводом throws или типа ошибки

do {
    try user001.sell(share: Share(ticker: .APL, count: 10, price: 111.1))
} catch operationError.notCountForSell {
    print("Недостаточно акций для продажи")
} catch operationError.notShareForSell {
    print("Акций в портфеде нет. Нечего продовать")
} catch let error {
    print(error.localizedDescription)
}


do {
    try user001.sell(share: Share(ticker: .SBER, count: 10, price: 111.1))
} catch operationError.notCountForSell {
    print("Недостаточно акций для продажи")
} catch operationError.notShareForSell {
    print("Акций в портфеде нет. Нечего продовать")
} catch let error {
    print(error.localizedDescription)
}

do {
    try user001.sell(share: Share(ticker: .APL, count: 1000, price: 111.1))
} catch operationError.notCountForSell {
    print("Недостаточно акций для продажи")
} catch operationError.notShareForSell {
    print("Акций в портфеде нет. Нечего продовать")
} catch let error {
    print(error.localizedDescription)
}

