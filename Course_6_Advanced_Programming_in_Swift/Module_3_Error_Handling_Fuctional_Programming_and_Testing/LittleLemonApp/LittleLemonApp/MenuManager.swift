//
//  MenuManager.swift
//  LittleLemonApp
//
//  Created by Neslihan Turpcu on 2024-09-18.
//

import Foundation
protocol NetworkManager {
    func getMealsList() -> [String]
}

class MenuManager {
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func allMeals() -> String {
        return networkManager.getMealsList().joined(separator: ",")
    }
}
