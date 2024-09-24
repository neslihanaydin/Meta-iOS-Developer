//
//  MenuItemsOptionView.swift
//  LittleLemonDinner
//
//  Created by Neslihan Turpcu on 2024-09-18.
//

import SwiftUI

struct MenuOptionsView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedCategory: MenuCategory?
    var menuCategories: [MenuCategory] = [.food, .drink, .dessert]
    var sortOptions = ["Most Popular", "Price $-$$$", "A-Z"]
    var menuCategoriesView: some View {
        Section {
            ForEach(menuCategories, id: \.self) { menuCategory in
                HStack {
                    Text(menuCategory.rawValue.capitalized)
                    if selectedCategory == menuCategory {
                        Spacer()
                        Image(systemName: "checkmark")
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    if selectedCategory == menuCategory {
                        selectedCategory = nil
                    } else {
                        selectedCategory = menuCategory
                    }
                    dismiss()
                }
                
            }
        } header: {
            HStack(alignment: .top) {
                Text("Selected Categories")
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
            }
        }
    }
    var sortOptionsView: some View {
        Section {
            ForEach(sortOptions, id: \.self) { sortOption in
                Text(sortOption)
            }
        } header: {
            HStack(alignment: .top) {
                Text("Sort By")
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                menuCategoriesView
                sortOptionsView
            }
            .navigationTitle("Filter")
            .listStyle(GroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                            .bold()
                    }
                }
            }
        }
    }
}

