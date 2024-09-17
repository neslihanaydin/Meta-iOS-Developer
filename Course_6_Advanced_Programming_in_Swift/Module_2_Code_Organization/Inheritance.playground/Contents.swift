import UIKit

// Base Class
class Dish {
    private let ingredients: [String]
    private let name: String
    
    init(ingredients: [String], name: String) {
        self.ingredients = ingredients
        self.name = name
    }
    
    func printInfo() {
        print("Dish Name: \(name)")
        print("Ingredients: \(ingredients)")
    }
}

// Subclass
final class AppetizerDish: Dish {
    override func printInfo() {
        print("Appetizer")
        super.printInfo()
    }
}

final class MainDish: Dish {
    
}

for _ in 0..<5 {
    let randomNumber = Int.random(in: 0...1)
    let dish: Dish
    if randomNumber == 0 {
        dish = AppetizerDish(ingredients: ["Margherita", "Flatbread"], name: "Margherita Flatbread")
    } else {
        dish = MainDish(ingredients: ["Spaghetti", "Tomato sauce"], name: "Super Spaghetti")
    }
    //print(dish)
    if let appetizerDish = dish as? AppetizerDish {
        appetizerDish.printInfo()
    } else {
        print("Main Dish!")
        dish.printInfo()
    }
    
    if dish is MainDish {
        print("Main Dish End!")
    }
}
