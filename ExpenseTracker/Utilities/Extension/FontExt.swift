//
//  FontExt.swift
//  ExpenseTracker
//
//  Created by PC1562 on 06/03/2024.
//

import Foundation
import SwiftUI

extension Font {
    static func boldInterFont(size: CGFloat) -> Font {
        return Font.custom("Inter-Bold", size: size)
    }
    
    static func semiboldInterFont(size: CGFloat) -> Font {
        return Font.custom("Inter-SemiBold", size: size)
    }
    
    static func mediumInterFont(size: CGFloat) -> Font {
        return Font.custom("Inter-regular", size: size)
    }
    
    static func regularInterFont(size: CGFloat) -> Font {
        return Font.custom("Inter-regular", size: size)
    }
    
    static let customTitleX = boldInterFont(size: 64)
    static let customTitle1 = boldInterFont(size: 32)
    static let customTitle2 = semiboldInterFont(size: 24)
    static let customTitle3 = semiboldInterFont(size: 18)
    
    static let customRegular1 = regularInterFont(size: 16)
    static let customRegular2 = semiboldInterFont(size: 16)
    static let customRegular3 = regularInterFont(size: 14)
    
    static let customSmall = regularInterFont(size: 13)
    static let customTiny = regularInterFont(size: 12)
}
