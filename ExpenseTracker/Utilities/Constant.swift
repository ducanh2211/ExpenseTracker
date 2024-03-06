//
//  Constant.swift
//  ExpenseTracker
//
//  Created by PC1562 on 23/02/2024.
//

import Foundation
import SwiftUI

enum ExpenseCategoryType: Int {
    case foodAndDining
    case utilities
    case autoAndTransport
    case clothing
    case entertainment
    case bank
    case giftAndDonations
    case healthAndFitness
    case home
    case kids
    case personal
    case pet
    
    var representationTitle: String {
        return switch self {
        case .foodAndDining:
            "Food & Dining"
        case .utilities:
            "Utilities"
        case .autoAndTransport:
            "Auto & Transport"
        case .clothing:
            "Clothing"
        case .entertainment:
            "Entertainment"
        case .bank:
            "Bank"
        case .giftAndDonations:
            "Gift & Donations"
        case .healthAndFitness:
            "Health & Fitness"
        case .home:
            "Home"
        case .kids:
            "Kids"
        case .personal:
            "Personal"
        case .pet:
            "Pet"
        }
    }
}

enum IncomeCategoryType: Int {
    case salary
    case interest
    case bonus
    case other
    
    var representationTitle: String {
        return switch self {
        case .salary:
            "Salary"
        case .interest:
            "Interest"
        case .bonus:
            "Bonus"
        case .other:
            "Other"
        }
    }
}

enum TransactionType {
    case expense(ExpenseCategoryType)
    case income(IncomeCategoryType)
}
