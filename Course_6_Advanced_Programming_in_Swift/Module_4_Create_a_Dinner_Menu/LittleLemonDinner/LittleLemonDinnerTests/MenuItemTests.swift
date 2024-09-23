//
//  MenuItemTests.swift
//  LittleLemonDinnerTests
//
//  Created by Neslihan Turpcu on 2024-09-18.
//

import XCTest
@testable import LittleLemonDinner
final class MenuItemTests: XCTestCase {

    func test_MenuItemTitle_init_isEqual() {
        let menuItem = MockData.foodMenuItems[0]
        XCTAssert(menuItem.title == "Broccoli Soup")
    }
    
    func test_menuItemIngredients_init_isEqual() {
            let menuItem = MockData.foodMenuItems[0]
        XCTAssertEqual([Ingredient.broccoli, Ingredient.carrot], menuItem.ingredients)

    }

}
