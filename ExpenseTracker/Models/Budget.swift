//
//  Budget.swift
//  ExpenseTracker
//
//  Created by PC1562 on 04/03/2024.
//

import Foundation
import GRDB

struct Budget {
    var id: Int64?
    var name: String
    private var absoluteAmount: Int
    var startDate: Date
    var endDate: Date
    
    var amount: Decimal {
        get { Decimal(absoluteAmount) / 100 }
        set { absoluteAmount = Int(Double(truncating: NSDecimalNumber(decimal: newValue * 100))) }
    }
    
    // reference
    static let budgetTransactions = hasMany(BudgetTransaction.self)
    static let transactions = hasMany(Transaction.self, through: budgetTransactions, using: BudgetTransaction.transaction)
    var transactions: QueryInterfaceRequest<Transaction> {
        return request(for: Budget.transactions)
    }
    
    static let budgetCategory = hasMany(BudgetCategory.self)
    static let categories = hasMany(Category.self, through: budgetCategory, using: BudgetCategory.category)
    var categories: QueryInterfaceRequest<Category> {
        return request(for: Budget.categories)
    }
}

extension Budget: Codable, FetchableRecord, MutablePersistableRecord {
    enum Columns: String, ColumnExpression {
        case id
        case name
        case absoluteAmount
        case startDate
        case endDate
    }
    
    mutating func didInsert(_ inserted: InsertionSuccess) {
        self.id = inserted.rowID
    }
}
