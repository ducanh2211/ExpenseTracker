//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by PC1562 on 23/02/2024.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
