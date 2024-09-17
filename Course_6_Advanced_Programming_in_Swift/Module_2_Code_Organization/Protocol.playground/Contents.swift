import UIKit
import Foundation

protocol GoodChef {
    func cookGoodFood()
}
protocol GreatChef {
    func cookGreatFood()
}
protocol ExcellentChef {
    func cookExcellentFood()
}

// implement multiple inheritances with protocols – something that can’t be done with classes.
/*
class Person: GoodChef, GreatChef {
    func cookGoodFood() {
        <#code#>
    }
    func cookGreatFood() {
        <#code#>
    }
}
*/

// As a rule of thumb, use an extension for each protocol adoption and conformance.
class Person {
    
}
extension Person: GoodChef {
    func cookGoodFood() {
        <#code#>
    }
}
extension Person: GreatChef {
    func cookGreatFood() {
        <#code#>
    }
}
extension Person: ExcellentChef {
    func cookExcellentFood() {
        <#code#>
    }
}

// create a protocol that inherits other protocols
protocol BlackBeltChef: GoodChef, GreatChef, ExcellentChef {
    func cookBlackBeltFood()
}
class Person_: BlackBeltChef {
    func cookGoodFood() {
        
    }
    func cookGreatFood() {
        <#code#>
    }
    func cookExcellentFood() {
        <#code#>
    }
    func cookBlackBeltFood() {
        <#code#>
    }
}

// Optional protocol methods, only for classes because objective-c doesn't support structs
@objc protocol ReservationDataSource {
    @objc optional func reserve(tables: Int) -> Int
    @objc optional var maxReservableTables: Int { get }
}

class ReservationWebsite: ReservationDataSource {
    func reserve(tables: Int) -> Int {
        if tables < 1 {
            return 0
        }
        return tables
    }
}

class ReservationAgent: ReservationDataSource {
    let maxReservableTables: Int = 2
}

// Exercise: Create a dish protocol to set the requirements of each dish.
protocol Dish {
    var name: String { get }
    var preparationMinutes: Int { get set }
    func prepare()
    func plate(artisticLevel: Int)
}

class MainDish: Dish {
    let name: String
    var preparationMinutes: Int
    
    init(name: String, preparationMinutes: Int) {
        self.name = name
        self.preparationMinutes = preparationMinutes
    }
    func prepare() {
        print("Preparing \(name) for \(preparationMinutes) minutes.")
    }
    func plate(artisticLevel: Int) {
        print("Plating artistic level: \(artisticLevel)")
    }
}

let superSpaghetti = MainDish(name: "Super Spaghetti", preparationMinutes: 35)
superSpaghetti.prepare()
superSpaghetti.plate(artisticLevel: 10)
