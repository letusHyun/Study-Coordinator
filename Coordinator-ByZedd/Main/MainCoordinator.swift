//
//  MainCoordinator.swift
//  Coordinator-ByZedd
//
//  Created by SeokHyun on 2023/01/17.
//

import UIKit

protocol MainCoordinatorDelegate {
  func didLoggedOut(_ coordinator: MainCoordinator)
}

class MainCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []
  var delegate: MainCoordinatorDelegate?
  
  private var navigationController: UINavigationController!
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = MainViewController()
    vc.view.backgroundColor = .systemCyan
    vc.delegate = self
    
    self.navigationController.viewControllers = [vc]
  }
}

extension MainCoordinator: MainViewControllerDelegate {
  func logout() {
    self.delegate?.didLoggedOut(self)
  }
}
