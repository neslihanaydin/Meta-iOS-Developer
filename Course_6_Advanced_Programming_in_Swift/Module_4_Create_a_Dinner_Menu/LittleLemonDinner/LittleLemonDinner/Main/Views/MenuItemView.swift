//
//  MenuItemsView.swift
//  LittleLemonDinner
//
//  Created by Neslihan Turpcu on 2024-09-18.
//

import SwiftUI

struct MenuItemView: View {
    @Binding var menuItem: MenuItem
    var body: some View {
        VStack {
            Color.gray
            Text(menuItem.title)
                .lineLimit(1)
        }
    }
}

