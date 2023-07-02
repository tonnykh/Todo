//
//  ToDoListItem.swift
//  Todo
//
//  Created by Khumbongmayum Tonny on 02/07/23.
//

import Foundation

struct Task: Identifiable, Hashable {
    let id = UUID()
    let item: String
    var isCompleted: Bool
}
