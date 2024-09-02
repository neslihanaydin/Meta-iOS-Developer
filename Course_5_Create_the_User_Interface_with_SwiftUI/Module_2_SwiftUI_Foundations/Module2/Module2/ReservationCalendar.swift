//
//  ReservationCalendar.swift
//  Module2
//
//  Created by Neslihan Turpcu on 2024-08-28.
//

import SwiftUI

struct ReservationCalendar: View {
    @State var selectedDate = Date() // DatePicker state
    @State var selectedDateText: String = "" // DatePicker state
    
    var body: some View {
        Image("logo")
            .frame(width: 400, height: 400, alignment: .center)
        Form {
            HStack {
                DatePicker(
                    selection: $selectedDate,
                    in: Date()...,
                    displayedComponents: [.date, .hourAndMinute]
                ){}
                Button(action: {
                    print("do something")
                }) {
                    HStack {
                        Image(systemName: "paperplane")
                        Text("Done")
                    }
                }.padding(20)
                
            }
            Text("Selected date: \(selectedDate.formatted(date: .long, time: .complete))")
        }
    }
}

#Preview {
    ReservationCalendar()
}
