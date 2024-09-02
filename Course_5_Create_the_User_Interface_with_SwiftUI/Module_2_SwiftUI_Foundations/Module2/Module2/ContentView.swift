//
//  ContentView.swift
//  Module2
//
//  Created by Neslihan Turpcu on 2024-08-28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading)
        {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
               // .background(Color.red)
               // .frame(width: 200, height: 50)
               // .background(Color.blue)
                .padding()
            //Spacer()
            HStack {
                Button("One") {}
                Button("Two") {}
                Button("Three") {}
            }
        }
        .frame(width: 300, alignment: .leading)
        .padding()
        NavigationView {
            VStack {
                ZStack {
                    HStack(spacing: 8) {
                        Text("Demo").scaledToFit().frame(
                            width: 100, height: 100, alignment: .center)
                        VStack(spacing: 10) {
                            Text("Little Lemon").font(.title)
                            Text("Tomato Tortellini, Bottarga and Carbonara ").font(.title3)
                                .multilineTextAlignment(.center)
                        }// :- VStack
                        .padding()
                    }  // :- HStack
                    .padding()
                }  // :- ZStack
            }
        }
        ZStack {
            Circle()
                .scale(x: 0.75, y: 0.75)
                .foregroundColor(Color.green)
                
            Color.green.opacity(0.5).ignoresSafeArea()
            HStack(spacing: 7) {
                Image(systemName: "applelogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100, alignment: .center)
                    .foregroundStyle(.yellow)
                VStack(spacing: 10) {
                    Text("Little Lemon")
                        .font(.title)
                    Text("Stacks in SwiftUI - ZStack, HStack, VStack")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
