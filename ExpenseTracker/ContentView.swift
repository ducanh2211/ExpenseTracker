//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by PC1562 on 23/02/2024.
//

import SwiftUI
import GRDB

struct ContentView: View {
    
    
    var body: some View {
        return Text("")
    }
    
    func dsads() {
        try? DatabaseQueue().write { db in
            try? db.create(table: "") { t in
                t.column("", .datetime)
                
            }
        }
    }
}


#Preview {
    ContentView()
}
