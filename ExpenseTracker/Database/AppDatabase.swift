//
//  AppDatabase.swift
//  ExpenseTracker
//
//  Created by PC1562 on 04/03/2024.
//

import Foundation
import GRDB

struct AppDatabase {
    
    private let writer: any DatabaseWriter
    
    var reader: DatabaseReader {
        writer
    }
    
    init(_ writer: any DatabaseWriter) throws {
        self.writer = writer
        try migrator.migrate(writer)
    }
    
}

// MARK: - Database migrator
extension AppDatabase {
    var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        #if DEBUG
        migrator.eraseDatabaseOnSchemaChange = true
        #endif
        migrator.registerMigration("v1") { db in
            try createTransactionTableV1(in: db)
            try createBudgetTableV1(in: db)
            try createCategoryTableV1(in: db)
            try createBudgetTransactionTableV1(in: db)
            try createBudgetCategoryTableV1(in: db)
        }
        return migrator
    }
}
