//
//  ViewController.swift
//  BurgerKing-clone
//
//  Created by 김준섭 on 2022/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = UIImageView(image: UIImage(named: "main-logo"))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "hamburger-btn"))
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named: "barcode")),UIBarButtonItem(image: UIImage(named: "cart"))]
    }
}

