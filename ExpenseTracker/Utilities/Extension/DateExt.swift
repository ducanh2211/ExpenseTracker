//
//  DateExt.swift
//  ExpenseTracker
//
//  Created by PC1562 on 07/03/2024.
//

import Foundation

extension Date {
    func toString(format: SettingsDateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
    
    func extractComponents(_ components: Set<Calendar.Component>, calendar: Calendar = .current) -> DateComponents {
        return calendar.dateComponents(components, from: self)
    }
    
    func extractComponent(_ component: Calendar.Component, calendar: Calendar = .current) -> Int {
        return calendar.component(component, from: self)
    }
}

extension String {
    func toDate(format: SettingsDateFormat) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: self) ?? Date()
    }
}
