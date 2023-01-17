//
//  AppCoordinator.swift
//  Coordinator-ByZedd
//
//  Created by SeokHyun on 2023/01/17.
//

import UIKit

class AppCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []
  private var navigationController: UINavigationController!
  
  var isLoggedIn: Bool = false
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    if self.isLoggedIn {
      self.showMainViewController()
    } else {
      self.showLoginViewController()
    }
  }
  
  private func showMainViewController() {
    let coordinator = MainCoordinator(
      navigationController: self.navigationController
    )
    coordinator.delegate = self
    coordinator.start()
    self.childCoordinators.append(coordinator)
  }
  
  private func showLoginViewController() {
    let coordinator = LoginCoordinator(
      navigationController: self.navigationController
    )
    coordinator.delegate = self
    coordinator.start()
    self.childCoordinators.append(coordinator)
  }
}

extension AppCoordinator: LoginCoordinatorDelegate {
  
  //AppCoordinator가 가지고 있는 childCoordinators에서 LoginCoordinator를 지워줘야하기 때문에,
  //LoginCoordinator를 파라미터로 받는다.
  func didLoggedIn(_ coordinator: LoginCoordinator) {
    self.childCoordinators = self.childCoordinators
      .filter{ $0 !== coordinator } //child에서 LoginCoordinator를 지움
    
    self.showLoginViewController()
  }
}

extension AppCoordinator: MainCoordinatorDelegate {
  func didLoggedOut(_ coordinator: MainCoordinator) {
    self.childCoordinators = self.childCoordinators
      .filter { $0 !== coordinator }
    
    self.showMainViewController()
  }
}
