//
//  CreateTodoPresenter.swift
//  PersonalTodo
//  Created by Lima on 16/10/2020.
//

import Foundation

protocol CreateTodoPresentationLogic {
    func createPresentedTodos(todo: TodoItem)
}

class CreateTodoPresenter: CreateTodoPresentationLogic {
    var view: DisplayCreatedTodoLogic?
    func createPresentedTodos(todo: TodoItem) {
        view?.displayCreatedTodo(todo: todo)
    }
}
