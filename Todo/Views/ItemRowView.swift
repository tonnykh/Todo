//
//  ItemRowView.swift
//  Todo
//
//  Created by Khumbongmayum Tonny on 02/07/23.
//

import SwiftUI

struct ItemRowView: View {
    @Binding var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(task.isCompleted ? .green : .red )
                .onTapGesture {
                        task.isCompleted.toggle()
                }
            Text(task.item)
        }
    }
}


struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        let task = Task(item: "Sample Task", isCompleted: false)

        ItemRowView(task: .constant(task))
    }
}
