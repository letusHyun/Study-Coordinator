//
//  LoginViewController.swift
//  Coordinator-ByZedd
//
//  Created by SeokHyun on 2023/01/17.
//

import UIKit

protocol LoginViewControllerDelegate {
  func login()
}

class LoginViewController: UIViewController {
  
  var delegate: LoginViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let item = UIBarButtonItem(
      title: "로그인",
      style: .plain,
      target: self,
      action: #selector(self.loginButtonDidTap)
    )
    navigationItem.rightBarButtonItem = item
  }
  
  @objc private func loginButtonDidTap() {
    self.delegate?.login()
  }
  
  deinit {
    print("- \(type(of: self)) deinit")
  }
}
