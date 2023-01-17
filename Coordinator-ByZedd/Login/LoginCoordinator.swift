//
//  LoginCoordinator.swift
//  Coordinator-ByZedd
//
//  Created by SeokHyun on 2023/01/17.
//

import UIKit

protocol LoginCoordinatorDelegate {
  func didLoggedIn(_ coordinator: LoginCoordinator)
}

class LoginCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []
  var delegate: LoginCoordinatorDelegate?
  
  private let navigationController: UINavigationController!
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = LoginViewController()
    vc.view.backgroundColor = .systemBrown
    vc.delegate = self
    navigationController.viewControllers = [vc]
  }
}

extension LoginCoordinator: LoginViewControllerDelegate {
  func login() {
    self.delegate?.didLoggedIn(self)
  }
}
