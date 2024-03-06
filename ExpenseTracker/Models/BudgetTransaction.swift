//
//  BudgetTransaction.swift
//  ExpenseTracker
//
//  Created by PC1562 on 04/03/2024.
//

import Foundation
import GRDB

struct BudgetTransaction {
    var budgetId: Int64
    var transactionId: Int64
    
    static let budget = belongsTo(Budget.self)
    static let transaction = belongsTo(Transaction.self)
}

extension BudgetTransaction: Codable, FetchableRecord, PersistableRecord { }
