import Foundation
import CoreData

extension Dish {
    static func createDishesFrom(menuItems: [MenuItem],
                                 _ context: NSManagedObjectContext) {
        for menuItem in menuItems {
            if let dishExists = exists(name: menuItem.title, context) {
                if dishExists == false {
                    let oneDish = Dish(context: context)
                    oneDish.name = menuItem.title
                    if let price = Float(menuItem.price) {
                        oneDish.price = price
                    }
                }
            } else {
                print("Error.")
            }
        }
    }
}
