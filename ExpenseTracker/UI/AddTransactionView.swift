//
//  AddTransactionView.swift
//  ExpenseTracker
//
//  Created by PC1562 on 06/03/2024.
//

import SwiftUI

struct AddTransactionView: View {
    
    private let transactionTypes: [Transaction.Kind] = [.expense, .income]
    @State private var selectedTransactionType: Transaction.Kind = .expense
    @State private var amount: Decimal = 0
    @State private var category: String = ""
    @State private var note: String = ""
    @State private var isSelectingDate: Bool = false
    @State private var selectedDate: Date = .now
    @State private var shouldPresentCategoryPicker: Bool = false
    
    var body: some View {
        ZStack {
            if self.selectedTransactionType == .expense {
                Color.red100
                    .ignoresSafeArea(edges: .top)
            } else {
                Color.green100
                    .ignoresSafeArea(edges: .top)
            }

            ZStack(alignment: .bottom) {
                VStack(spacing: 6) {
                    headerTitleView()
                        .padding(.top, 12)
                    
                    amountInputSection()
                    
                    ZStack {
                        Color.white
                        
                        ScrollView(.vertical) {
                            formInputSection()
                                .background(Color.light80)
                                .clipped()
                                .padding(.top, 24)
                        }
                    }
                    .clipShape(.rect(
                        topLeadingRadius: 16,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 16,
                        style: .continuous)
                    )
                }
                
                Button {
                    print("Save transaction")
                } label: {
                    Text("Save")
                        .font(.title3)
                        .foregroundStyle(Color.light80)
                        .frame(maxWidth: .infinity, minHeight: 56)
                }
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.violet100)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            }
            
            if isSelectingDate {
                datepickerView()
            }
        }
        .ignoresSafeArea(.keyboard)
        .sheet(isPresented: $shouldPresentCategoryPicker) {
            CategorySelectionView(category: $category)
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
    
    private func formInputSection() -> some View {
        VStack(spacing: 16) {
            Button {
                self.shouldPresentCategoryPicker.toggle()
            } label: {
                HStack {
                    Text(category.isEmpty ? "Category" : category)
                        .padding()
                        .font(.regularInterFont(size: 16))
                        .foregroundStyle(Color.dark75)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image.ic_arrow_down
                        .padding(.trailing)
                }
            }
            .frame(minHeight: 56)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color.light20, lineWidth: 1)
            )
            
            TextField("Note", text: $note, axis: .vertical)
                .padding()
                .font(.regularInterFont(size: 16))
                .foregroundStyle(Color.dark75)
                .frame(minHeight: 56)
                .lineLimit(1...5)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.light20, lineWidth: 1)
                )
            
            Button {
                self.isSelectingDate.toggle()
            } label: {
                Text("\(self.selectedDate.toString(format: .eeee_dd_mm_yyyy_hh_mm))")
                    .font(.regularInterFont(size: 16))
                    .foregroundStyle(Color.dark75)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(minHeight: 56)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color.light20, lineWidth: 1)
            )
        }
        .padding(.horizontal, 16)
    }
    
    private func datepickerView() -> some View {
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
                .ignoresSafeArea(edges: .top)
                .onTapGesture {
                    self.isSelectingDate.toggle()
                }
            
            VStack {
                DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.hourAndMinute, .date])
                    .datePickerStyle(.graphical)
                    .padding(6)
                
                Button {
                    self.isSelectingDate.toggle()
                } label: {
                    Text("Done")
                        .font(.regularInterFont(size: 16))
                }
                .buttonStyle(.bordered)
                .padding(.bottom, 16)
            }
            .background {
                Color.white
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.horizontal, 16)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AddTransactionView()
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
