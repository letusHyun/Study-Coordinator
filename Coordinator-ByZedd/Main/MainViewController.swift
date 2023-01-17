//
//  MainViewController.swift
//  Coordinator-ByZedd
//
//  Created by SeokHyun on 2023/01/17.
//

import UIKit

protocol MainViewControllerDelegate {
  func logout()
}

class MainViewController: UIViewController {

  var delegate: MainViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let item = UIBarButtonItem(
      title: "로그아웃",
      style: .plain,
      target: self,
      action: #selector(logoutButtonTap)
    )
    navigationItem.rightBarButtonItem = item
  }
  
  @objc func logoutButtonTap() {
    self.delegate?.logout()
  }
}

