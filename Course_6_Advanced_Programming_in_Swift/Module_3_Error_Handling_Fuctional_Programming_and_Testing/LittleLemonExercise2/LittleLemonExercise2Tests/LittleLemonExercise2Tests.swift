//
//  LittleLemonExercise2Tests.swift
//  LittleLemonExercise2Tests
//
//  Created by Neslihan Turpcu on 2024-09-18.
//

import XCTest
@testable import LittleLemonExercise2

final class LittleLemonExercise2Tests: XCTestCase {

    func test_calculateTotal_salesTaxTwentyPercent() {
        // the prices are represented in cents.
        let items = [
            CheckoutItem(name: "Fish and Chips", price: 625),
            CheckoutItem(name: "Super Spaghetti", price: 850),
            CheckoutItem(name: "Salmon", price: 325),
            CheckoutItem(name: "Chicken Wings", price: 175)
        ]
        let taxPercentage = 20
        let totalToPay = calculateTotal(items: items, localTaxPercent: taxPercentage)
        
        XCTAssertEqual(totalToPay, 2370)
    }
    
    func test_Example() {
     let array = [1, 2, 3, 4]
     let sum = array.reduce(0){$0 + $1}
     XCTAssertNotEqual(sum, 9)
    }

}
