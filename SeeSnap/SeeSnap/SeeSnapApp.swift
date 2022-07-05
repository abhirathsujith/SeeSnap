//
//  SeeSnapApp.swift
//  SeeSnap
//
//  Created by Abhirath Sujith on 05/07/22.
//

import SwiftUI

@main
struct SeeSnapApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
