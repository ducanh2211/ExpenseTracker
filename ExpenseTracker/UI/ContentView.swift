//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by PC1562 on 23/02/2024.
//

import SwiftUI
import GRDB

struct ContentView: View {
    
    enum TabSelectionKind: Int, CaseIterable {
        case home, transaction, addTransaction, budget, profile
        
        var title: String {
            switch self {
            case .home:
                return "Home"
            case .transaction:
                return "Transaction"
            case .addTransaction:
                return ""
            case .budget:
                return "Budget"
            case .profile:
                return "Profile"
            }
        }
        
        var iconImage: Image {
            switch self {
            case .home:
                return .ic_tab_home
            case .transaction:
                return .ic_tab_transaction
            case .addTransaction:
                return .ic_tab_addTransaction
            case .budget:
                return .ic_tab_piechart
            case .profile:
                return .ic_tab_user
            }
        }
    }
    
    @State private var selectedTab: TabSelectionKind = .addTransaction
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: self.$selectedTab) {
                ForEach(TabSelectionKind.allCases, id: \.self) { tabKind in
                    switch tabKind {
                    case .home:
                        HomeView().tag(tabKind)
                    case .transaction:
                        TransactionView().tag(tabKind)
                    case .addTransaction:
                        AddTransactionView().tag(tabKind)
                    case .budget:
                        BudgetView().tag(tabKind)
                    case .profile:
                        ProfileView().tag(tabKind)
                    }
                }
            }
            
            HStack {
                customTabbarView()
                    .frame(height: 48)
            }
            .background(Color.light80)
        }
        .ignoresSafeArea(.keyboard)
    }
    
    func customTabbarView() -> some View {
        ForEach(TabSelectionKind.allCases, id: \.self) { tabKind in
            Button {
                self.selectedTab = tabKind
            } label: {
                if tabKind == .addTransaction {
                    Circle()
                        .fill(self.selectedTab == tabKind ? Color.primaryColor: Color.gray1)
                        .frame(width: 56, height: 56)
                        .overlay {
                            tabKind.iconImage
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                        }
                        .offset(y: -6)
                } else {
                    customTabItem(image: tabKind.iconImage, title: tabKind.title, isActive: tabKind == self.selectedTab)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    func customTabItem(image: Image, title: String, isActive: Bool) -> some View {
        VStack(spacing: 0) {
            image
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
            
            Text(title)
                .font(.mediumInterFont(size: 10))
        }
        .foregroundStyle(isActive ? Color.primaryColor : Color.gray1)
    }
    
}


#Preview {
    ContentView()
}
