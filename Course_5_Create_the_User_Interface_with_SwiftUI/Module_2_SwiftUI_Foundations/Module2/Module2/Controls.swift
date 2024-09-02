//
//  Controls.swift
//  Module2
//
//  Created by Neslihan Turpcu on 2024-08-28.
//

import SwiftUI

struct Controls: View {
    @State var buttonClicked: String = "" // Button state
    @State var isShowing = true // Toggle state
    @State private var value = 1 // Stepper state
    @State private var size: CGFloat = 0.1 // Slider state
    @State var selectedDate = Date() // DatePicker state
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        return min...max
    }
    
    var body: some View {
        
        // Button
        Button(role: .destructive) {
            //print("do something!")
            buttonClicked = "Deleted"
        } label: {
            HStack {
                Image(systemName: "trash")
                Text("\(buttonClicked)")
            }
        }
        
        // Toggle
        Toggle(isOn: $isShowing) {
            if isShowing {
                Text("Hello!")
            } else {
                Text("Disabled!")
            }
        }
        
        // Stepper
        VStack {
            Text("Current value: \(value)")
            Stepper("Number of guests", value: $value, in:1...10)
        }
        .padding()
        
        // Slider
        Text("Little Lemon").font(.system(size: size * 50))
        Slider(value: $size)
        
        // Date Picker
        Section {
            DatePicker(
                selection: $selectedDate,
                in: dateClosedRange,
                displayedComponents: .date,
                label: {Text("Due Date")})
        }
        
        // Label
        Label("Menu", systemImage: "fork.knife")
            .labelStyle(.titleAndIcon)
    }
}

#Preview {
    Controls()
}
