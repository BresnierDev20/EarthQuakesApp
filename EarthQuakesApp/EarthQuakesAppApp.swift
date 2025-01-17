//
//  EarthQuakesAppApp.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import SwiftUI
import Factory
import SwiftData

@main
struct EarthQuakesAppApp: App {
    var isLoging = Container.datastore
    
    var sharedModelContainer: ModelContainer {
        let schema = Schema([
            User.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isLoging.getUserKey() {
                    HomeView()
                }else {
                    LoginView()
                }
            }
            .modelContainer(sharedModelContainer)
            .navigationBarHidden(true)
        }
    }
}

