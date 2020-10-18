//
//  ListTodoInteractor.swift
//  PersonalTodo
//  Created by Lima on 16/10/2020.
//

import Foundation
import RealmSwift

protocol ListTodoBusinessLogic {
    func getToDo(todos: [TodoItem])
    func deleteTodo(todo: TodoItem)
}

class ListTodoInteractor: ListTodoBusinessLogic {
    var presenter: ListTodoPresentationLogic?
    
    func getToDo(todos: [TodoItem]) {
        
        var arrayOfTodos: [TodoItem]?
        func retrieveTodo() -> Array<TodoItem> {
            do {
                let realm = try Realm()
                let todo = TodoItem.self
                arrayOfTodos = Array(realm.objects(todo))
            }
            catch{
                print("cannot retrieve from database: \(error)")
            }
            return arrayOfTodos ?? [TodoItem]()
        }
        let todos = retrieveTodo()
        
        presenter?.presentTodo(todos: todos)
    }
    
    func deleteTodo(todo: TodoItem) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(todo)
            }
        }
        catch{
            print("cannot delete from database: \(error)")
        }
        presenter?.presentDeletedTodo(todo: todo)
    }
    
}
