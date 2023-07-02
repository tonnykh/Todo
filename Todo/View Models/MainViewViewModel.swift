//
//  MainViewViewModel.swift
//  Todo
//
//  Created by Khumbongmayum Tonny on 02/07/23.
//

import Foundation

class MainViewViewModel: ObservableObject {
    @Published var tasks = [
        Task(item: "To do 1", isCompleted: true),
        Task(item: "To do 2", isCompleted: false),
        Task(item: "To do 3", isCompleted: true)
    ]
    
    func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
}
