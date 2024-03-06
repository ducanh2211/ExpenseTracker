//
//  AddTransactionView.swift
//  ExpenseTracker
//
//  Created by PC1562 on 06/03/2024.
//

import SwiftUI

struct AddTransactionView: View {
    
    @State private var amount: Decimal = 0
    @State private var selectedTransactionType: Transaction.Kind = .expense
    private let transactionTypes: [Transaction.Kind] = [.expense, .income]
    
    var body: some View {
        ZStack {
            if self.selectedTransactionType == .expense {
                Color.red100
                    .ignoresSafeArea(edges: .top)
            } else {
                Color.green100
                    .ignoresSafeArea(edges: .top)
            }

            VStack(spacing: 6) {
                headerTitleView()
                    .padding(.top, 12)
                
                ScrollView(.vertical) {
                    amountInputSection()
//                    formInputSection()
                }
            }
        }
    }
    
    func headerTitleView() -> some View {
        Menu {
            ForEach(transactionTypes, id: \.self) { type in
                Button {
                    self.selectedTransactionType = type
                } label: {
                    HStack(spacing: 12) {
                        Text(type.rawValue.capitalized)
                            .font(.title3)
                            .foregroundStyle(Color.light100)
                        
                        if self.selectedTransactionType == type {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            Text("\(self.selectedTransactionType.rawValue.capitalized) ▼")
                .font(.title3)
                .foregroundStyle(Color.light100)
        }
    }
    
    func amountInputSection() -> some View {
        VStack(alignment: .leading) {
            Text("How much?")
                .font(.semiboldInterFont(size: 18))
                .foregroundStyle(Color.light20.opacity(0.7))
            
            TextField("0", value: $amount, format: .currency(code: "VND"))
                .textFieldStyle(.plain)
                .font(.semiboldInterFont(size: 64))
                .foregroundStyle(Color.light80)
        }
        .padding(24)
        .keyboardType(.numberPad)
    }
    
//    func formInputSection() -> some View {
//
//    }
    
    
}

#Preview {
    AddTransactionView()
}
