//
//  CategorySelectionView.swift
//  ExpenseTracker
//
//  Created by PC1562 on 07/03/2024.
//

import SwiftUI

struct CategorySelectionView: View {

    @Environment(\.dismiss) private var dismiss
    @Binding var category: String
    
    var body: some View {
        Button {
            category = "Cai deo gi the"
            dismiss()
        } label: {
            Text("Button")
        }
    }
    
}
