//
//  BudgetCategory.swift
//  ExpenseTracker
//
//  Created by PC1562 on 04/03/2024.
//

import Foundation
import GRDB

struct BudgetCategory {
    var budgetId: Int64
    var categoryId: Int64
    
    // reference
    static let budget = belongsTo(Budget.self)
    static let category = belongsTo(Category.self)
}

extension BudgetCategory: Codable, FetchableRecord, PersistableRecord { }
