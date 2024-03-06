//
//  Category.swift
//  ExpenseTracker
//
//  Created by PC1562 on 04/03/2024.
//

import Foundation
import GRDB

struct Category {
    var id: Int64?
    var name: Category.Name
    
    // reference
    static let transactions = hasMany(Transaction.self)
    var transactions: QueryInterfaceRequest<Transaction> {
        return request(for: Category.transactions)
    }
    
    static let budgetCategory = hasMany(BudgetCategory.self)
    static let budgets = hasMany(Budget.self, through: budgetCategory, using: BudgetCategory.budget)
    var budgets: QueryInterfaceRequest<Budget> {
        return request(for: Category.budgets)
    }
}

extension Category: Codable, FetchableRecord, MutablePersistableRecord {
    enum Columns: String, ColumnExpression {
        case id
        case name
    }
    
    mutating func didInsert(_ inserted: InsertionSuccess) {
        self.id = inserted.rowID
    }
}

extension Category {
    enum Name: String, Codable, DatabaseValueConvertible {
        case foodAndDining
        case utilities
        case transport
        case clothing
        case entertainment
        case gift
        case health
        case housing
        case personal
        case pets
    }
}
