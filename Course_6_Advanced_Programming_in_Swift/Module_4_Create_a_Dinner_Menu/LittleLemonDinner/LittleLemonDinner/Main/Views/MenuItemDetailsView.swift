//
//  MenuItemDetailsView.swift
//  LittleLemonDinner
//
//  Created by Neslihan Turpcu on 2024-09-18.
//

import SwiftUI

struct MenuItemDetailsView: View {
    @Binding var menuItem: MenuItem
    var body: some View {
        VStack(spacing: 8) {
            Image("LittleLemon")
                .resizable()
                .scaledToFit()
            VStack {
                Text("Price:")
                    .bold()
                Text(menuItem.displayPrice)
            }
            VStack {
                Text("Ordered:")
                    .bold()
                Text("\(menuItem.ordersCount)")
            }
            VStack {
                Text("Ingredients:")
                    .bold()
                ForEach(menuItem.ingredients, id: \.self) {
                    Text($0.rawValue)
                }
            }
        }
    }
}



