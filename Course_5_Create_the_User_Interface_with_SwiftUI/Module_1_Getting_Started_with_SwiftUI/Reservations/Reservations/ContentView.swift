//
//  ContentView.swift
//  Reservations
//
//  Created by Neslihan Turpcu on 2024-08-26.
//

import SwiftUI

struct ContentView: View {
    @State var personCount: Int = 1
    @State var showLogo = true
    @ObservedObject var myClass = MyClass()
    @State private var isOn: Bool = false
    @State var inputValue: String = ""
    var body: some View {
        VStack {
            MyView() // Calling the MyView view file
            Text("Reservations")
                .font(.title2)
            Stepper {
                Text("Reservation for: \(personCount)")
            } onIncrement: {
                personCount += 1
            } onDecrement: {
                personCount = (personCount == 1) ? 1 : personCount - 1
            }
            
            LittleLemonLogo(bindingVariable: $showLogo)
    
            LittleLemonLogoObserved(myClass: myClass)
            

            Form {
                Label("Lightning", systemImage: "bolt.fill")
                TextField("Type your name", text: $inputValue)
                ToggleDetailView(isOn: $isOn)

            }
            
            ReservationForm()
            
        }
        .padding()
        
    }
}

struct ToggleDetailView: View {
    @Binding var isOn: Bool

    var body: some View {
        VStack {
            Text(isOn ? "Switch is ON" : "Switch is OFF")
            Toggle("Switch", isOn: $isOn)
        }
    }
}

#Preview {
    ContentView(personCount: 3)
}
