//
//  TodoItem.swift
//  PersonalTodo
//
//  Created by USER on 16/10/2020.
//

import Foundation
import RealmSwift

class TodoItem: Object {
    @objc dynamic var taskTitle: String = ""
    @objc dynamic var taskDescription: String = ""
}
