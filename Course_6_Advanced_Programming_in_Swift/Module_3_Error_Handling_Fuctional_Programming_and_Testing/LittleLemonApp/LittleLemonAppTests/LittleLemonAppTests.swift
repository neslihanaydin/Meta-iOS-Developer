//
//  LittleLemonAppTests.swift
//  LittleLemonAppTests
//
//  Created by Neslihan Turpcu on 2024-09-18.
//

import XCTest
@testable import LittleLemonApp
final class LittleLemonAppTests: XCTestCase {
    
    // naming convention
    /*
     func test_whatIsTested_whatIsTheCircumstance_whatIsExpected() { }
     */
    
    func test_recipeOrderCount_init_orderCountEqualsZero() {
        let recipe = Recipe()
        XCTAssert(recipe.orderCount == 0)
    }
    
    func test_recipeOrderCount_incrementOrderCount_orderCountEqualsOne() {
        var recipe = Recipe()
        recipe.incrementOrderCount()
        XCTAssert(recipe.orderCount == 1)
    }
    
    func test_menuManager_allMeals_returnsCorrectMealList() {
        let menu = MenuManager(networkManager: FakeNetworkManager())
        let allMeals = menu.allMeals()
        XCTAssertEqual(allMeals, "Soda,Milkshake")
    }
    
}

class FakeNetworkManager: NetworkManager {
    func getMealsList() -> [String] {
        return ["Soda", "Milkshake"]
    }
}
