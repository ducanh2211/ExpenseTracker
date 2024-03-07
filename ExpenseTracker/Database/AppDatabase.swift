//
//  AppDatabase.swift
//  ExpenseTracker
//
//  Created by PC1562 on 04/03/2024.
//

import Foundation
import GRDB

struct AppDatabase {
    
    let writer: any DatabaseWriter
    
    var reader: DatabaseReader {
        writer
    }
    
    init(_ writer: any DatabaseWriter) throws {
        self.writer = writer
        try migrator.migrate(writer)
    }
    
}

// MARK: - Database migrator
extension AppDatabase {
    var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        #if DEBUG
        migrator.eraseDatabaseOnSchemaChange = true
        #endif
        migrator.registerMigration("v1") { db in
            try createTransactionTableV1(in: db)
            try createBudgetTableV1(in: db)
            try createCategoryTableV1(in: db)
            try createBudgetTransactionTableV1(in: db)
            try createBudgetCategoryTableV1(in: db)
        }
        return migrator
    }
}

// MARK: - Shared instance DB
extension AppDatabase {
    static let shared: AppDatabase = {
        do {
            // Apply recommendations from
            // <https://swiftpackageindex.com/groue/grdb.swift/documentation/grdb/databaseconnections>
            //
            // Create the "Application Support/Database" directory if needed
            let fileManager = FileManager.default
            let appSupportURL = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let directoryURL = appSupportURL.appendingPathComponent("Database", isDirectory: true)
            
            // Support for tests: delete the database if requested
            if CommandLine.arguments.contains("-reset") {
                try? fileManager.removeItem(at: directoryURL)
            }
            
            // Create the database folder if needed
            try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)
            
            // Open or create the database
            let databaseURL = directoryURL.appendingPathComponent("db.sqlite")
            NSLog("Database stored at \(databaseURL.path)")
            let dbPool = try DatabasePool(path: databaseURL.path)
            
            // Create the AppDatabase
            let appDatabase = try AppDatabase(dbPool)
            
            return appDatabase
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate.
            //
            // Typical reasons for an error here include:
            // * The parent directory cannot be created, or disallows writing.
            // * The database is not accessible, due to permissions or data protection when the device is locked.
            // * The device is out of space.
            // * The database could not be migrated to its latest schema version.
            // Check the error message to determine what the actual problem was.
            fatalError("Unresolved error \(error)")
        }
    }()
}
