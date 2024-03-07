//
//  Tables.swift
//  ExpenseTracker
//
//  Created by PC1562 on 04/03/2024.
//

import Foundation
import GRDB

extension AppDatabase {
    
    func createTransactionTableV1(in db: Database) throws {
        try db.create(table: Transaction.databaseTableName, options: .ifNotExists) { t in
            t.autoIncrementedPrimaryKey(Transaction.Columns.id.rawValue)
            t.column(Transaction.Columns.absoluteAmount.rawValue, .integer).notNull()
            t.column(Transaction.Columns.createdDate.rawValue, .datetime).notNull()
            t.column(Transaction.Columns.note.rawValue, .text)
            t.column(Transaction.Columns.kind.rawValue, .text).notNull()
            t.column(Transaction.Columns.categoryId.rawValue, .integer)
                .references(Transaction.databaseTableName)
        }
    }
    
    func createBudgetTableV1(in db: Database) throws {
        try db.create(table: Budget.databaseTableName, options: .ifNotExists) { t in
            t.autoIncrementedPrimaryKey(Budget.Columns.id.rawValue)
            t.column(Budget.Columns.name.rawValue, .text).notNull()
            t.column(Budget.Columns.absoluteAmount.rawValue, .integer).notNull()
            t.column(Budget.Columns.startDate.rawValue, .datetime).notNull()
            t.column(Budget.Columns.endDate.rawValue, .datetime).notNull()
        }
    }
    
    func createCategoryTableV1(in db: Database) throws {
        try db.create(table: Category.databaseTableName, options: .ifNotExists) { t in
            t.autoIncrementedPrimaryKey(Category.Columns.id.rawValue)
            t.column(Category.Columns.name.rawValue, .text).notNull()
            t.column(Category.Columns.transactionKind.rawValue, .text).notNull()
        }
    }
    
    func createBudgetTransactionTableV1(in db: Database) throws {
        try db.create(table: BudgetTransaction.databaseTableName, options: .ifNotExists) { t in
            t.column("budgetId", .integer).notNull()
            t.column("transactionId", .integer).notNull()
            t.primaryKey(["budgetId", "transactionId"])
        }
    }
    
    func createBudgetCategoryTableV1(in db: Database) throws {
        try db.create(table: BudgetCategory.databaseTableName, options: .ifNotExists) { t in
            t.column("budgetId", .integer).notNull()
            t.column("categoryId", .integer).notNull()
            t.primaryKey(["budgetId", "categoryId"])
        }
    }
    
}
