//
//  ContentView.swift
//  Todo
//
//  Created by Khumbongmayum Tonny on 02/07/23.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewViewModel()
    @Environment(\.managedObjectContext) var moc
    @State private var showSheet: Bool = false
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: []) var tasks: FetchedResults<Task>

    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    ItemRowView(task: task)
//                    Text(task.item ?? "Unknown")
                }
                .onDelete(perform: deleteTask)
//                .onDelete(perform: viewModel.delete)
//                .onMove(perform: viewModel.move)
            }
            .navigationTitle("Todo List 📝")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                AddTask()
            }
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        for offset in offsets {
            let task = tasks[offset]
            moc.delete(task)
        }
        
        try? moc.save()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
