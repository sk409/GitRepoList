//
//  GitRepoListApp.swift
//  GitRepoList
//
//  Created by 小林聖人 on 2021/02/27.
//

import SwiftUI

@main
struct GitRepoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
