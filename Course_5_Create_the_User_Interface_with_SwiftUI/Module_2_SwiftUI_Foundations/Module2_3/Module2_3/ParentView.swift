//
//  ParentView.swift
//  Module2_3
//
//  Created by Neslihan Turpcu on 2024-09-02.
//

import SwiftUI

struct ParentView: View {
    var body: some View {
        HStack{
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 50, height: 50)
            Text("Rectangle One")
                .foregroundColor(.white)
                .padding(20)
                .background(Color.yellow)
            Rectangle()
                .fill(Color.accentColor)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30)
        }
        
    }
}

#Preview {
    ParentView()
}
