//
//  MenuItem.swift
//  LittleLemonDinner
//
//  Created by Neslihan Turpcu on 2024-09-18.
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { get set }
    var title: String { get }
    var ingredients: [Ingredient] { get set }
}

struct MenuItem: Identifiable, MenuItemProtocol {
    var id = UUID()
    var title: String
    let menuCategory: MenuCategory
    let price: Double
    var ordersCount: Int
    var ingredients: [Ingredient]
    var displayPrice: String {
        String(
            round(price / 0.01) * 0.01
        )
    }
    
    static func getMockItems(for type: MenuCategory) -> [MenuItem] {
        switch type {
        case .food:
            let foodMenuItems: [MenuItem] = [
                MenuItem(title: "Broccoli Soup", menuCategory: .food, price: 3.99, ordersCount: 100, ingredients: [Ingredient.broccoli, Ingredient.carrot]),
                MenuItem(title: "Carrot Soup", menuCategory: .food, price: 2.99, ordersCount: 80, ingredients: [Ingredient.carrot]),
                MenuItem(title: "Broccoli Pasta", menuCategory: .food, price: 5.99, ordersCount: 120, ingredients: [Ingredient.pasta, Ingredient.broccoli]),
                MenuItem(title: "Spaghetti Soup", menuCategory: .food, price: 4.49, ordersCount: 90, ingredients: [Ingredient.pasta, Ingredient.tomatoSauce]),
                MenuItem(title: "Spinach Pasta", menuCategory: .food, price: 6.49, ordersCount: 110, ingredients: [Ingredient.pasta, Ingredient.spinach]),
                MenuItem(title: "Spinach Soup", menuCategory: .food, price: 3.49, ordersCount: 95, ingredients: [Ingredient.spinach]),
                MenuItem(title: "Broccoli Salad", menuCategory: .food, price: 4.99, ordersCount: 105, ingredients: [Ingredient.broccoli, Ingredient.carrot]),
                MenuItem(title: "Green Salad", menuCategory: .food, price: 4.59, ordersCount: 85, ingredients: [Ingredient.spinach]),
                MenuItem(title: "Pizza", menuCategory: .food, price: 7.99, ordersCount: 150, ingredients: [Ingredient.tomatoSauce, Ingredient.spinach]),
                MenuItem(title: "Carrot Pasta", menuCategory: .food, price: 5.49, ordersCount: 70, ingredients: [Ingredient.pasta, Ingredient.carrot]),
                MenuItem(title: "Broccoli Tomato", menuCategory: .food, price: 5.99, ordersCount: 115, ingredients: [Ingredient.broccoli, Ingredient.tomatoSauce]),
                MenuItem(title: "Tomato Soup", menuCategory: .food, price: 3.49, ordersCount: 100, ingredients: [Ingredient.tomatoSauce, Ingredient.carrot])
            ]
            return foodMenuItems
        case .dessert:
            let dessertMenuItems: [MenuItem] = [
                MenuItem(title: "Tiramisu", menuCategory: .dessert, price: 4.99, ordersCount: 140, ingredients: []),
                MenuItem(title: "Eclair", menuCategory: .dessert, price: 3.49, ordersCount: 95, ingredients: []),
                MenuItem(title: "Donut", menuCategory: .dessert, price: 2.49, ordersCount: 100, ingredients: []),
                MenuItem(title: "Chocolate Cake", menuCategory: .dessert, price: 5.99, ordersCount: 120, ingredients: [])
            ]
            return dessertMenuItems
        case .drink:
            let drinkMenuItems: [MenuItem] = [
                MenuItem(title: "Black Tea", menuCategory: .drink, price: 1.99, ordersCount: 130, ingredients: []),
                MenuItem(title: "Green Tea", menuCategory: .drink, price: 2.49, ordersCount: 110, ingredients: []),
                MenuItem(title: "Mint Tea", menuCategory: .drink, price: 2.49, ordersCount: 120, ingredients: []),
                MenuItem(title: "Peach Tea", menuCategory: .drink, price: 2.99, ordersCount: 85, ingredients: []),
                MenuItem(title: "Hibiscus Tea", menuCategory: .drink, price: 3.19, ordersCount: 75, ingredients: []),
                MenuItem(title: "Elderberry Tea", menuCategory: .drink, price: 3.49, ordersCount: 60, ingredients: []),
                MenuItem(title: "Blackberry Tea", menuCategory: .drink, price: 3.49, ordersCount: 90, ingredients: []),
                MenuItem(title: "Matcha Tea", menuCategory: .drink, price: 4.99, ordersCount: 70, ingredients: [])
            ]
            return drinkMenuItems
        }
    }
}


