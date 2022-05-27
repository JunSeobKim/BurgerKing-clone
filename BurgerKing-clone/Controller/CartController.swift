//
//  CartController.swift
//  BurgerKing-clone
//
//  Created by 김준섭 on 2022/05/27.
//

import UIKit

class CartController: UIViewController {

    @IBOutlet weak var resText: UILabel!
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = UIImageView(image: UIImage(named: "cart-title"))
    }
    
    // 뷰가 나타나기 직전에 텍스트 변경
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resText.text = text
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("뷰가 나타남")
        }
        
        override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("뷰가 사라지기 직전")
        }
        
        override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("뷰가 사라짐")
        }
}
