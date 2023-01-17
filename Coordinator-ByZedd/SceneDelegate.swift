//
//  SceneDelegate.swift
//  Coordinator-ByZedd
//
//  Created by SeokHyun on 2023/01/17.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let window = UIWindow(windowScene: windowScene)
    self.window = window
    
    let navigationController = UINavigationController()
    self.window?.rootViewController = navigationController
    
    let coordinator = AppCoordinator(navigationController: navigationController)
    coordinator.start()
    
    self.window?.makeKeyAndVisible()
  }
}

