//
//  NavigationControllerExtension.swift
//  PersonalTodo
//
//  Created by USER on 16/10/2020.
//

import UIKit

extension ListTodoTableViewController {
    func navigationBar() {
        self.navigationItem.title = "Todo"
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let button1 = UIBarButtonItem(
            title: "Add Task",
            style: .plain,
            target: self,
            action: #selector(self.addTodoItem)
        )
        self.navigationItem.rightBarButtonItem  = button1
    }
    @objc private func addTodoItem() {
        let rootVc = CreateTodoViewController()
        let navVC = UINavigationController(rootViewController: rootVc)
        navVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVc, animated: true)
    }
}
