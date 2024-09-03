//
//  MyTabView.swift
//  Module3_1
//
//  Created by Neslihan Turpcu on 2024-09-02.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        VStack{
            TabView {
                Text("This is the Share View")
                    .tabItem({
                        Label("Share", systemImage:"square.and.arrow.up")
                    })
                Text("This is the Trash View")
                    .tabItem({
                        Label("", systemImage:"trash")
                    })
            }
        }
    }
}

#Preview {
    MyTabView()
}
