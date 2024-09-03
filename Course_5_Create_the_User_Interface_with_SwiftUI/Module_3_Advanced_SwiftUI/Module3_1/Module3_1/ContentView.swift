//
//  ContentView.swift
//  Module3_1
//
//  Created by Neslihan Turpcu on 2024-09-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Exercise 1")
                NavigationLink("do Something", destination: EmptyView())
            }
        }
        .navigationTitle("Little Lemon")
    }
}

#Preview {
    ContentView()
}
