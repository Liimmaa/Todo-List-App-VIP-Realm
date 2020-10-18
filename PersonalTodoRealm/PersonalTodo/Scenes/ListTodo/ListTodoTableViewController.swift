//
//  ViewController.swift
//  PersonalTodo
//  Created by Lima on 16/10/2020.
//

import UIKit

protocol ListTodoDisplayLogic {
    func displayTodo(todos: [TodoItem])
    func deleteTodo(todo: TodoItem)
}

class ListTodoTableViewController: UITableViewController, ListTodoDisplayLogic {
    var arrayListTodo: [TodoItem] = []
    let cell = StringConstants.cell
    var interactor: ListTodoBusinessLogic?
    
    func displayTodo(todos: [TodoItem]) {
        arrayListTodo = todos
    }
    
    func deleteTodo(todo: TodoItem) {
        //      add user experience
    }
    
    func setup() {
        let presenter = ListTodoPresenter()
        let interactor = ListTodoInteractor()
        presenter.view = self
        interactor.presenter = presenter
        self.interactor = interactor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        self.tableView.tableFooterView = UIView()
        navigationBar()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.getToDo(todos: arrayListTodo)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayListTodo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cell) else { return UITableViewCell() }
        cell.textLabel?.text = arrayListTodo[indexPath.row].taskTitle
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ShowTodoViewController()
        viewController.selectedTask = arrayListTodo[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
        viewController.titleTextView.text = arrayListTodo[indexPath.row].taskTitle
        viewController.descriptionTextView.text = arrayListTodo[indexPath.row].taskDescription
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let todo = arrayListTodo[indexPath.row]
            interactor?.deleteTodo(todo: todo)
            self.arrayListTodo.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

