//
//  ShowTodoViewController.swift
//  PersonalTodo
//  Created by Lima on 16/10/2020.
//

import UIKit
protocol DisplayTodoOnClick {
    func displayTodoOnClick(todo: TodoItem)
}

class ShowTodoViewController: UIViewController, DisplayTodoOnClick {
    var interactor: ShowTodoBusinessLogic?
    var selectedTask: TodoItem?
    
    func displayTodoOnClick(todo: TodoItem) {
        selectedTask = todo
        self.navigationController?.popViewController(animated: true)
        let alert = UIAlertController(title: StringConstants.successMessageTitle, message: StringConstants.successUpdatedMessage, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: StringConstants.successActionMessage, style: .default) { (action) -> Void in
            
        }
        alert.addAction(action)
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigation()
        layoutViews()
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    }
    
    func setup() {
        let presenter = ShowTodoPresenter()
        let interactor = ShowTodoInteractor()
        presenter.view = self
        interactor.presenter = presenter
        self.interactor = interactor
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let button1 = UIBarButtonItem(
            title: StringConstants.editButtonTitle,
            style: .plain,
            target: self,
            action: #selector(self.editTodoItem)
        )
        self.navigationItem.rightBarButtonItem  = button1
    }
    
    @objc func editTodoItem() {
        titleTextView.isEditable = true
        titleTextView.layer.borderWidth = 1
        titleTextView.layer.borderColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        descriptionTextView.isEditable = true
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        saveTodoButton.isHidden = false
    }
    
    let titleTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.isEditable = false
        textView.attributedText = NSMutableAttributedString(
            string: "\n", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold),
                NSAttributedString.Key.foregroundColor: UIColor.black ])
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.isEditable = false
        textView.attributedText = NSMutableAttributedString(
            string: " ", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light),
                NSAttributedString.Key.foregroundColor: UIColor.black])
        textView.textAlignment = .justified
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    lazy var saveTodoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(StringConstants.saveNewButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveNewTodo), for: .touchUpInside)
        return button
    }()
    
    @objc func saveNewTodo() {
        interactor?.showTodo(todo: selectedTask ?? TodoItem(), taskTitle: titleTextView.text, descriptionTitle: descriptionTextView.text)
    }
    
    func layoutViews() {
        view.addSubview(titleTextView)
        view.addSubview(descriptionTextView)
        view.addSubview(saveTodoButton)
        
        NSLayoutConstraint.activate([
            titleTextView.heightAnchor.constraint(equalToConstant: 50),
            titleTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            titleTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            descriptionTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 20),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 200),
            descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            saveTodoButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 40),
            saveTodoButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            saveTodoButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            saveTodoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
