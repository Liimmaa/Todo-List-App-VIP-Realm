//
//  ShowTodoInteractor.swift
//  PersonalTodo
//  Created by Lima on 16/10/2020.
//

import Foundation
import RealmSwift

protocol ShowTodoBusinessLogic {
    func showTodo(todo: TodoItem, taskTitle: String, descriptionTitle: String)
}

class ShowTodoInteractor: ShowTodoBusinessLogic {
    var presenter: ShowTodoPresentationLogic?
    
    func showTodo(todo: TodoItem, taskTitle: String, descriptionTitle: String) {
        do {
            let realm = try Realm()
            try realm.write {
                todo.taskTitle = taskTitle
                todo.taskDescription = descriptionTitle
            }
        }
        catch{
            print("cannot update to database: \(error)")
        }
        presenter?.presentDataOnClick(todo: todo)
    }    
}
