//
//  ShoeTodoPresenter.swift
//  PersonalTodo
//  Created by Lima on 16/10/2020.
//

import Foundation

protocol  ShowTodoPresentationLogic {
    func presentDataOnClick(todo: TodoItem)
}

class ShowTodoPresenter: ShowTodoPresentationLogic {
    var view: DisplayTodoOnClick?
    
    func presentDataOnClick(todo: TodoItem) {
        view?.displayTodoOnClick(todo: todo)
    }
}
