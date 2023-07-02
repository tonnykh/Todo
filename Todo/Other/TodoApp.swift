//
//  TodoApp.swift
//  Todo
//
//  Created by Khumbongmayum Tonny on 02/07/23.
//

import SwiftUI

@main
struct TodoApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
