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
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var foodMenuItemsView: some View {
        Section {
            ForEach($viewModel.foodMenuItems) { menuItem in
                NavigationLink {
                    MenuItemDetailsView(menuItem: menuItem)
                        .navigationTitle(menuItem.title)
                } label: {
                    MenuItemView(menuItem: menuItem)
                        .frame(
                            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                            minHeight: 120
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
        } header: {
            HStack(alignment: .top) {
                Text("Food")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(
                        maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                        alignment: .leading
                    )
            }
        }
    }
    var drinkMenuItemsView: some View {
        Section {
            ForEach($viewModel.drinkMenuItems) { menuItem in
                    MenuItemView(menuItem: menuItem)
                    .frame(
                        maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                        minHeight: 120
                    )
            }
        } header: {
            HStack(alignment: .top) {
                Text("Drinks")
                    .font(.title)
                    .frame(
                        maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                        alignment: .leading
                    )
            }
        }
    }
    var dessertMenuItemsView: some View {
        Section {
            ForEach($viewModel.dessertMenuItems) { menuItem in
                    MenuItemView(menuItem: menuItem)
                    .frame(
                        maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                    minHeight: 120
                    )
            }
        } header: {
            HStack(alignment: .top) {
                Text("Desserts")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(
                        maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                        alignment: .leading
                    )
            }
        }
    }
    var scrollView: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                foodMenuItemsView
                drinkMenuItemsView
                dessertMenuItemsView
            }
            .padding(.horizontal)
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
                    MenuOptionsView()
                }
        }
    }
}

#Preview {
    MenuView()
}
