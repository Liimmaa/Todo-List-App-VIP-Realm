//
//  CreateTodoInteractor.swift
//  PersonalTodo
//  Created by Lima on 16/10/2020.
//

import Foundation
import RealmSwift

protocol CreateTodoBusinessLogic {
    func createTodo(todo: TodoItem)
}

class CreateTodoInteractor: CreateTodoBusinessLogic {
    var presenter: CreateTodoPresentationLogic?
    
    func createTodo(todo: TodoItem) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(todo)
            }
        }
        catch{
            print("cannot write to database: \(error)")
        }
        presenter?.createPresentedTodos(todo: todo)
    }
}
