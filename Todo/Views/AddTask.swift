//
//  AddTask.swift
//  Todo
//
//  Created by Khumbongmayum Tonny on 02/07/23.
//

import SwiftUI

struct AddTask: View {
//    @ObservedObject var viewModel: MainViewViewModel
    @State private var newTask: String = ""
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Add task here..", text: $newTask)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button("SAVE") {
                    let task = Task(context: moc)
                    task.id = UUID()
                    task.item = newTask
                    task.isCompleted = false
                    
                    try? moc.save()
//                    let task = Task(item: newTask, isCompleted: false)
//                    viewModel.tasks.append(task)
                    dismiss()
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Add task 🖋️")
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "multiply")
                        .bold()
                }
            }
        }
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddTask()
        }
    }
}
