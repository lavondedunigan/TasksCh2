//
//  TasksCh2App.swift
//  TasksCh2
//
//  Created by Lavonde Dunigan on 2/5/26.
//

import SwiftUI
import SwiftData

@main
struct TasksCh2App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            SignupView()
        }
        .modelContainer(sharedModelContainer)
    }
}
