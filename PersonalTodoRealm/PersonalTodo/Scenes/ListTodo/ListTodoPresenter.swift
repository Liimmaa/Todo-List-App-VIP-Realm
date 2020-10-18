//
//  ListTodoPresenter.swift
//  PersonalTodo
//  Created by Lima on 16/10/2020.
//

import Foundation

protocol ListTodoPresentationLogic {
    func presentTodo(todos: [TodoItem])
    func presentDeletedTodo(todo: TodoItem)
}

class ListTodoPresenter: ListTodoPresentationLogic {
    var view: ListTodoDisplayLogic?
    
    func presentTodo(todos: [TodoItem]) {
        view?.displayTodo(todos: todos)
    }
    func presentDeletedTodo(todo: TodoItem) {
        view?.deleteTodo(todo: todo)
    }
}
