//
//  CoreDataEntityApp.swift
//  CoreDataEntity
//
//  Created by Neslihan Turpcu on 2024-09-25.
//

import SwiftUI

@main
struct CoreDataEntityApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
