//
//  ButtonExt.swift
//  ExpenseTracker
//
//  Created by PC1562 on 07/03/2024.
//

import Foundation
import SwiftUI

struct BorderButtonStyle: ButtonStyle {
    let padding: CGFloat
    let borderLineWidth: CGFloat
    let foregroundColor: Color
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding)
            .foregroundStyle(foregroundColor)
            .background {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(backgroundColor, lineWidth: 1)
            }
    }
}
