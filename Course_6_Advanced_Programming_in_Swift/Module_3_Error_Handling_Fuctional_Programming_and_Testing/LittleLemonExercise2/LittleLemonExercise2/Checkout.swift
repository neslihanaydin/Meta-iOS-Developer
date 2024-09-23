//
//  Checkout.swift
//  LittleLemonExercise2
//
//  Created by Neslihan Turpcu on 2024-09-18.
//

import Foundation

struct CheckoutItem{
    let name: String
    let price: Int
}

func calculateTotal(items: [CheckoutItem], localTaxPercent: Int) -> Int {
    let itemsTotal = items.reduce(0) { $0 + $1.price }
    let taxAmount = itemsTotal * localTaxPercent / 100
    return itemsTotal + taxAmount
}


