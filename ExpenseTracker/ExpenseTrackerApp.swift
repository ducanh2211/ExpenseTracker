//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by PC1562 on 23/02/2024.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    try? AppDatabase.shared.writer.write { db in
                        let categories = (try? Category.fetchAll(db)) ?? []
                        if categories.isEmpty {
                            var transactionKind: Transaction.Kind
                            for categoryName in Category.Name.allCases {
                                switch categoryName {
                                case .foodAndDining, .utilities, .transport, .clothing, .entertainment, .gift, .health, .housing, .personal, .pets:
                                    transactionKind = .expense
                                case .salary, .interest, .other:
                                    transactionKind = .income
                                }
                                var category = Category(name: categoryName, transactionKind: transactionKind)
                                try? category.save(db)
                            }
                        }
                    }
                }
        }
    }
}
