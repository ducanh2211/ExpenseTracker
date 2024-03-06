//
//  UIColorExt.swift
//  ExpenseTracker
//
//  Created by PC1562 on 06/03/2024.
//

import UIKit
import SwiftUI

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }

    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}

extension Color {
    static let dark25 = Color(uiColor: UIColor(rgb: 0x7A7E80))
    static let dark50 = Color(uiColor: UIColor(rgb: 0x464A4D))
    static let dark75 = Color(uiColor: UIColor(rgb: 0x161719))
    static let dark100 = Color(uiColor: UIColor(rgb: 0x0D0E0F))
    
    static let light20 = Color(uiColor: UIColor(rgb: 0xE3E5E5))
    static let light40 = Color(uiColor: UIColor(rgb: 0xF2F4F5))
    static let light60 = Color(uiColor: UIColor(rgb: 0xF7F9FA))
    static let light80 = Color(uiColor: .light80)
    static let light100 = Color(uiColor: UIColor(rgb: 0xFFFFFF))
    
    static let violet20 = Color(uiColor: UIColor(rgb: 0xEEE5FF))
    static let violet40 = Color(uiColor: UIColor(rgb: 0xD3BDFF))
    static let violet60 = Color(uiColor: UIColor(rgb: 0xB18AFF))
    static let violet80 = Color(uiColor: UIColor(rgb: 0x8F57FF))
    static let violet100 = Color(uiColor: UIColor(rgb: 0x7F3DFF))
    
    static let red20 = Color(uiColor: UIColor(rgb: 0xFDD5D7))
    static let red40 = Color(uiColor: UIColor(rgb: 0xFDA2A9))
    static let red60 = Color(uiColor: UIColor(rgb: 0xFD6F7A))
    static let red80 = Color(uiColor: UIColor(rgb: 0xFD5662))
    static let red100 = Color(uiColor: UIColor(rgb: 0xFD3C4A))
    
    static let green20 = Color(uiColor: UIColor(rgb: 0xCFFAEA))
    static let green40 = Color(uiColor: UIColor(rgb: 0x93EACA))
    static let green60 = Color(uiColor: UIColor(rgb: 0x65D1AA))
    static let green80 = Color(uiColor: UIColor(rgb: 0x2AB784))
    static let green100 = Color(uiColor: UIColor(rgb: 0x00A86B))
    
    static let yellow20 = Color(uiColor: UIColor(rgb: 0xFCEED4))
    static let yellow40 = Color(uiColor: UIColor(rgb: 0xFCDDA1))
    static let yellow60 = Color(uiColor: UIColor(rgb: 0xFCCC6F))
    static let yellow80 = Color(uiColor: UIColor(rgb: 0xFCBB3C))
    static let yellow100 = Color(uiColor: UIColor(rgb: 0xFCAC12))

    static let gray1 = Color(uiColor: UIColor(rgb: 0xC6C6C6))
    
    static let primaryColor = violet100
    static let expenseColor = red100
    static let incomeColor = green100
}

extension UIColor {
    static let light80 = UIColor(rgb: 0xFBFBFB)
}
