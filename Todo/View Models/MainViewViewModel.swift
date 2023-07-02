//
//  MainViewViewModel.swift
//  Todo
//
//  Created by Khumbongmayum Tonny on 02/07/23.
//

import Foundation

class MainViewViewModel: ObservableObject {
    @Published var tasks: [Task] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(tasks) {
                UserDefaults.standard.set(encoded, forKey: "Tasks")
            }
        }
    }
    
    init() {
        if let savedTasks = UserDefaults.standard.data(forKey: "Tasks") {
            if let decodedItems = try? JSONDecoder().decode([Task].self, from: savedTasks) {
                tasks = decodedItems
                return
            }
        }
        
        tasks = []
    }
    
    func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
}
