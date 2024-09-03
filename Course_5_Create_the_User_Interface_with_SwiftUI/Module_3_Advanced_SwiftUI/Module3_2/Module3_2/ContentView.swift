//
//  ContentView.swift
//  Module3_2
//
//  Created by Neslihan Turpcu on 2024-09-02.
//

import SwiftUI

struct ContentView: View {
    let elements = ["Reservation", "Contacts", "Restaurant Locations"]
    var body: some View {
       /* List {
            ForEach(elements, id: \.self) {element in
                Text(element)
            }
        }
        .padding()
        */
        
        List {
            Section(header: Text("Important Information")) {
                Text("This List shows information about our restaurant pages")
                    .font(.headline)
            }
            
            ForEach(elements, id: \.self) {element in
                Text(element)
            }
            
            Section(footer: Text("More Information")) {
                Text("Contact us as (212) 555 3231")
            }
        }
        .padding()
        .listStyle(.grouped) // default : .automatic
        .scrollContentBackground(.hidden)
        
        /*
        ScrollView {
            ForEach(elements, id: \.self) {element in
                Text(element)
            }
        }
        .padding()
         */
    }
}

#Preview {
    ContentView()
}
