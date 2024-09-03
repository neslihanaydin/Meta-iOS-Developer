//
//  ContentView.swift
//  Module3_Gestures
//
//  Created by Neslihan Turpcu on 2024-09-02.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0 // on Tap Gesture
    @State private var counterLong = 0 // on Long Press Gesture
    @State private var offsetValue = CGSize.zero // Drag Gesture
    @State private var amount = 0.0 // Magnification Gesture
    @State private var finalAmount = 1.0 // Magnification Gesture
    @State private var dragMsg = "You can long press image above and then drag" // Sequenced Gesture
    
    var body: some View {
        Text("Counter :\(counter)")
        Text("Long Press: \(counterLong)")
        Text("Little Lemon Restaurant")
            .onTapGesture(count:2) { // double tap
                counter += 2
            }
            .onTapGesture {
                counter += 1 // single tap
            }
            .onLongPressGesture {
                counterLong += 1
            }
        
        Image("Image")
            .offset(offsetValue)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offsetValue = gesture.translation
                    })
        
        Image("Image")
            .scaleEffect(finalAmount + amount)
            .gesture(
            MagnificationGesture()
                .onChanged { value in
                    amount = value - 1}
                .onEnded { value in
                    finalAmount += amount
                    amount = 0
                })
        
        let longPress = LongPressGesture()
            .onEnded { _ in
                dragMsg = "Drag Me."
            }
        let drag = DragGesture()
            .onChanged { gesture in
                offsetValue = gesture.translation
                dragMsg = "Dragging..."
            }
            .onEnded { _ in
                dragMsg = "Placed"}
        let sequence = longPress.sequenced(before: drag)
        Image("Image")
            .offset(offsetValue)
            .gesture(sequence)
        Text(dragMsg)
        
        
    }
}

#Preview {
    ContentView()
}
