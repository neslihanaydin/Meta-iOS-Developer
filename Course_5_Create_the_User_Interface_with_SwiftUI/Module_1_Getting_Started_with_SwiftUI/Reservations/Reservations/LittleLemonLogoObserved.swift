//
//  LittleLemonLogoObserved.swift
//  Reservations
//
//  Created by Neslihan Turpcu on 2024-08-27.
//

import SwiftUI

struct LittleLemonLogoObserved: View {
    @ObservedObject var myClass: MyClass
    var body: some View {
        VStack {
            Text("Little Lemon Logo Observed")
            if myClass.showLogo {
                Image(.littleLemon)
            }
            Button(action: {
                myClass.showLogo.toggle()
            }, label: {
                Text("Toggle Logo Visibility OFF")
                    .font(.title2)
            })
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}
