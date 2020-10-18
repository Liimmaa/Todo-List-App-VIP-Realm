//
//  NavigationController.swift
//  PersonalTodo
//
//  Created by USER on 16/10/2020.
//

import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstScreen = ListTodoTableViewController()
        viewControllers = [firstScreen]
    }
}
