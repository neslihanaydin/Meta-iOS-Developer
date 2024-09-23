//
//  Recipe.swift
//  LittleLemonApp
//
//  Created by Neslihan Turpcu on 2024-09-18.
//

import Foundation

struct Recipe {
    var orderCount = 0
    mutating func incrementOrderCount() {
        orderCount += 1
    }
}
