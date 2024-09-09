import UIKit

enum Ingredient: String {
    case lettuce = "Romaine Lettuce"
    case chicken = "Free Range Chicken"
}

let ingredient = Ingredient.lettuce

switch ingredient {
case .lettuce:
    print("We use \(ingredient.rawValue) that has the richest flavor from all the lettuces")
case .chicken:
    print("Our meals tastes better with \(ingredient.rawValue) to raise the quality")
}

enum RecipeInformation {
    case allergens(information: String)
}

let recipeInformation = RecipeInformation.allergens(information: "Peanuts, Milk, Gluten")

switch recipeInformation {
case .allergens(let information):
    print("The meal includes the following allergens: \(information)")
}

enum Table {
    case Indoors
    case Outdoors
    var description: String {
        switch self {
        case .Indoors:
            return "Use circular tables"
        case .Outdoors:
            return "Use rectangular tables"
        }
    }
}

let table = Table.Indoors
print(table.description)

enum CompassDirection: CaseIterable {
    case north, south, east, west
}


print("There are \(CompassDirection.allCases.count) directions.")
// Prints "There are 4 directions."
let caseList = CompassDirection.allCases
    .map({ "\($0)" })
    .joined(separator: ", ")
print(caseList)
// caseList == "north, south, east, west"
