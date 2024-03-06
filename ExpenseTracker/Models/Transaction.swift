//
//  Transaction.swift
//  ExpenseTracker
//
//  Created by PC1562 on 04/03/2024.
//

import Foundation
import GRDB

struct Transaction {
    var id: Int64?
    private var absoluteAmount: Int
    var createdDate: Date
    var note: String?
    var kind: Transaction.Kind
    var categoryId: Int
    
    var amount: Decimal {
        get { Decimal(absoluteAmount) / 100 }
        set { absoluteAmount = Int(Double(truncating: NSDecimalNumber(decimal: newValue * 100))) }
    }
    
    // reference
    static let category = belongsTo(Category.self)
    var category: QueryInterfaceRequest<Category> {
        return request(for: Transaction.category)
    }
    
    static let budgetTransactions = hasMany(BudgetTransaction.self)
    static let budgets = hasMany(Budget.self, through: budgetTransactions, using: BudgetTransaction.budget)
    var budgets: QueryInterfaceRequest<Budget> {
        return request(for: Transaction.budgets)
    }
}

extension Transaction: Codable, FetchableRecord, MutablePersistableRecord {
    enum Columns: String, ColumnExpression {
        case id
        case absoluteAmount
        case createdDate
        case note
        case kind
        case categoryId
    }
    
    mutating func didInsert(_ inserted: InsertionSuccess) {
        self.id = inserted.rowID
    }
}

extension Transaction {
    enum Kind: String, Codable, DatabaseValueConvertible {
        case expense
        case income
    }
}

