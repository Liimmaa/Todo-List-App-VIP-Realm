//
//  CreateTodoViewController.swift
//  PersonalTodo
//  Created by Lima on 16/10/2020.
//

import UIKit

protocol DisplayCreatedTodoLogic {
    func displayCreatedTodo(todo: TodoItem)
}

class CreateTodoViewController: UIViewController, DisplayCreatedTodoLogic {
    var interactor: CreateTodoBusinessLogic?
    var arrayTextFields: [TodoItem] = []
    
    func displayCreatedTodo(todo: TodoItem) {
        self.navigationController?.popViewController(animated: true)
        let alert = UIAlertController(title: StringConstants.successMessageTitle, message: StringConstants.successAddedMessage, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: StringConstants.successActionMessage, style: .default) { (action) -> Void in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        let presenter = CreateTodoPresenter()
        let interactor = CreateTodoInteractor()
        presenter.view = self
        interactor.presenter = presenter
        self.interactor = interactor
    }
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = StringConstants.titlePlaceholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        //        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        textField.textColor = .white
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        return textField
    }()
    
    lazy var descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = StringConstants.descriptionPlaceholder
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        //        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var saveTodoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(StringConstants.saveButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addNewTodo), for: .touchUpInside)
        return button
    }()
    
    @objc func addNewTodo() {
        let todo = TodoItem()
        todo.taskTitle = titleTextField.text ?? ""
        todo.taskDescription = descriptionTextField.text ?? ""
        interactor?.createTodo(todo: todo)
    }
    
    func layout() {
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(saveTodoButton)
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            titleTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            titleTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
            titleTextField.heightAnchor.constraint(equalToConstant: 50),
            descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            descriptionTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            descriptionTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 300),
            saveTodoButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            saveTodoButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
            saveTodoButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 50),
            saveTodoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
