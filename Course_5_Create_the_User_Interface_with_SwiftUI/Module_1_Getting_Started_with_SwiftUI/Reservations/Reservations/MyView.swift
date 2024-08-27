//
//  MyView.swift
//  Reservations
//
//  Created by Neslihan Turpcu on 2024-08-27.
//

import SwiftUI

struct MyView: View {
    var body: some View {
        Text("Little Lemon Restaurant Reservation System")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundStyle(.black)
            .padding([.leading, .trailing], 20)
            .background(Color.yellow)
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MyView()
}
