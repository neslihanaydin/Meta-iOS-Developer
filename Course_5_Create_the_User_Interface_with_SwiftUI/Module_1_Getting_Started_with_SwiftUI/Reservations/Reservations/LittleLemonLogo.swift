//
//  LittleLemonLogo.swift
//  Reservations
//
//  Created by Neslihan Turpcu on 2024-08-27.
//

import SwiftUI

struct LittleLemonLogo: View {
    @Binding var bindingVariable: Bool
    var body: some View {
        VStack {
            Text("LittleLemonLogo Binding")
            if bindingVariable {
                Image(.littleLemon)
            }
            
            Button(action: {
                bindingVariable.toggle()
            }, label: {
                Text("Toggle Logo Visibility OFF")
                    .font(.title2)
            })
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

