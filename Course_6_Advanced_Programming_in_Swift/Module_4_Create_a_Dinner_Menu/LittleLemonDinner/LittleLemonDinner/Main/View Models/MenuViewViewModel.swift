//
//  MenuViewViewModel.swift
//  LittleLemonDinner
//
//  Created by Neslihan Turpcu on 2024-09-18.
//

import Foundation
import SwiftUI
import Combine

final class MenuViewViewModel: ObservableObject {
//    @Published var foodMenuItems: [MenuItem] = MenuItem.getMockItems(for: .food)
//    @Published var drinkMenuItems: [MenuItem] = MenuItem.getMockItems(for: .drink)
    //    @Published var dessertMenuItems: [MenuItem] = MenuItem.getMockItems(for: .dessert)
    private var allMenuItems: [MenuItem] = MenuItem.getMockMenuItems()
    private var cancellable = Set<AnyCancellable>()
    @Published var selectedCategory: MenuCategory? = nil
    @Published var filteredMenuItems: [MenuItem] = MenuItem.getMockMenuItems()
    
//    var foodMenuItems: [MenuItem] {
//        filteredMenuItems(for: .food)
//    }
//    var drinkMenuItems: [MenuItem] {
//        filteredMenuItems(for: .drink)
//    }
//    var dessertMenuItems: [MenuItem] {
//        filteredMenuItems(for: .dessert)
//    }
    init() {
        // foodMenuItems = makeFoodMenuItems()
        // drinkMenuItems = makeDrinkMenuItems()
        //  dessertMenuItems = makeDessertMenuItems()
        observeSelectedCategory()
    }
    
    private func filterMenuItems(for category: MenuCategory?) -> [MenuItem] {
        if let category = category {
            return allMenuItems.filter { $0.menuCategory == category}
        }
        return allMenuItems
    }
    
    private func observeSelectedCategory() {
        $selectedCategory
            .sink { [weak self] newCategory in
                guard let self else {
                    return
                }
                self.filteredMenuItems = self.filterMenuItems(for: newCategory)
            }
            .store(in: &cancellable)
    }
    
    private func makeFoodMenuItems() -> [MenuItem] {
        (1...12)
            .map {
                MenuItem(title: "Food \($0)", 
                         menuCategory: .food,
                         price: Double($0) + 5.99,
                         ordersCount: $0 * 200,
                         ingredients: Ingredient.allCases)
            }
    }
    private func makeDrinkMenuItems() -> [MenuItem] {
        (1...8)
            .map {
                MenuItem(title: "Drink \($0)", 
                         menuCategory: .drink,
                         price: Double($0) + 0.99,
                         ordersCount: $0 * 100,
                         ingredients: Ingredient.allCases)
            }
    }
    private func makeDessertMenuItems() -> [MenuItem] {
        (1...4)
            .map {
                MenuItem(title: "Dessert \($0)",
                         menuCategory: .dessert, 
                         price: Double($0) + 2.99,
                         ordersCount: $0 * 50,
                         ingredients: Ingredient.allCases)
            }
    }
    
}


