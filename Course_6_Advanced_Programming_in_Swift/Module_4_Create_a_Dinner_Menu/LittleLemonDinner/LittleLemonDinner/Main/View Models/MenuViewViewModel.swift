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

    private var allMenuItems: [MenuItem] = MenuItem.getMockMenuItems()
    private var cancellable = Set<AnyCancellable>()
    @Published var selectedCategory: MenuCategory? = nil
    @Published var filteredMenuItems: [MenuItem] = MenuItem.getMockMenuItems()
    @Published var selectedSortOption: SortOption? = nil

    init() {
        observeSelectedCategoryAndSortOption()
    }
    
    private func filterMenuItems(for category: MenuCategory?) -> [MenuItem] {
        if let category = category {
            return allMenuItems.filter { $0.menuCategory == category}
        }
        return allMenuItems
    }
    
    private func sortMenuItems(_ items: [MenuItem],by sortOption: SortOption?) -> [MenuItem] {
        if let sortOption = sortOption {
            switch sortOption {
            case .alphabetical:
                return items.sorted(by: { $0.title < $1.title})
            case .popularity:
                return items.sorted(by: { $0.ordersCount > $1.ordersCount})
            case .price:
                return items.sorted(by: { $0.price < $1.price})
            }
        }
        return items
    }
    
    private func observeSelectedCategoryAndSortOption() {
        Publishers.CombineLatest($selectedCategory, $selectedSortOption)
            .sink { [weak self] newCategory, newSortOption in
                guard let self else {
                    return
                }
                let filteredItems = self.filterMenuItems(for: newCategory)
                self.filteredMenuItems = self.sortMenuItems(filteredItems, by: newSortOption)
            }
            .store(in: &cancellable)
    }
}
