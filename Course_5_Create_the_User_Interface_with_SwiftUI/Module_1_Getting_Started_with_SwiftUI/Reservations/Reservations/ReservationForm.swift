//
//  ReservationForm.swift
//  Reservations
//
//  Created by Neslihan Turpcu on 2024-08-27.
//

import SwiftUI

struct ReservationForm: View {
    @State var customerName: String = ""
    @State var userName:  String = ""
    var body: some View {
        Form {
            TextField("Type your name", 
                      text: $customerName,
                      onEditingChanged: {status in
                        print(status)})
                .onChange(of: customerName) { oldValue, newValue in
                    userName = newValue
                    print(newValue)
                }
                .onSubmit {
                    print("Submitted: \(userName)")
                }
            
            Text(userName)
                
        }
    }
}

#Preview {
    ReservationForm()
}
