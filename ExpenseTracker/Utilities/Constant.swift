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

enum SettingsDateFormat: String {
    case dd_mm_yyyy = "dd/MM/yyyy"
    case mm_dd_yyyy = "MM/dd/yyyy"
    case yyyy_mm_dd = "yyyy/MM/dd"
    case eeee_dd_mm_yyyy_hh_mm = "EEEE - dd/MM/yyyy HH:mm"
}

enum WeekDay: Int {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    init(_ rawValue: Int) {
        switch rawValue {
        case 2: self = .monday
        case 3: self = .tuesday
        case 4: self = .wednesday
        case 5: self = .thursday
        case 6: self = .friday
        case 7: self = .saturday
        case 8: self = .sunday
        default: self = .monday
        }
    }
    
    func toString() -> String {
        switch self {
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thursday:
            return "Thursday"
        case .friday:
            return "Friday"
        case .saturday:
            return "Saturday"
        case .sunday:
            return "Sunday"
        }
    }
}
