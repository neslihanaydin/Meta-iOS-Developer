//
//  MenuView.swift
//  LittleLemonDinner
//
//  Created by Neslihan Turpcu on 2024-09-23.
//
import SwiftUI

struct MenuView: View {
    @ObservedObject private var viewModel = MenuViewViewModel()
    @State private var isPresentingOptionsView = false
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    var scrollView: some View {
        let groupedMenuItems = Dictionary(grouping: viewModel.filteredMenuItems, by: { $0.menuCategory.rawValue})
        return ScrollView {
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(groupedMenuItems.keys.sorted(), id: \.self) { category in
                    Section(header: Text(category.capitalized)
                        .font(.title)
                        .frame(maxWidth: .infinity,
                               alignment: .leading
                              )
                    ) {
                        let items = groupedMenuItems[category] ?? []
                        ForEach(items) { menuItem in
                            NavigationLink {
                                MenuItemDetailsView(menuItem: .constant(menuItem))
                                    .navigationTitle(menuItem.title)
                            } label: {
                                MenuItemView(menuItem: .constant(menuItem))
                                    .frame(
                                        maxWidth: .infinity,
                                        minHeight: 120
                                    )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
    }
    var body: some View {
        NavigationStack {
            scrollView
                .navigationTitle("Menu")
                .toolbar {
                    ToolbarItem {
                        Button {
                            isPresentingOptionsView.toggle()
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                        }
                    }
                }
                .sheet(isPresented: $isPresentingOptionsView) {
                    MenuOptionsView(selectedCategory: $viewModel.selectedCategory, selectedSortOption: $viewModel.selectedSortOption)
                }
        }
    }
}

#Preview {
    MenuView()
}
