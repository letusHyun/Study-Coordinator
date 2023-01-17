//
//  Coordinator.swift
//  Coordinator-ByZedd
//
//  Created by SeokHyun on 2023/01/17.
//

import Foundation

protocol Coordinator: AnyObject {
  var childCoordinators: [Coordinator] { get set }
  func start()
}
