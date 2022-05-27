//
//  ProductController.swift
//  BurgerKing-clone
//
//  Created by 김준섭 on 2022/05/27.
//

import UIKit

protocol ProductControllerDelegate: AnyObject {
    func pass(data: String)
}

class ProductController: UIViewController {
    
    var delegate: ProductControllerDelegate?
    
    var text: String = ""
    
    // 텍스트 저장
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        text = sender.text ?? ""
    }
    
    // 프로퍼티에 직접 접근해 데이터 전달
    @IBAction func cartButtonDidTap(_ sender: UIButton) {
        guard let vc =  storyboard?.instantiateViewController(identifier: "CartController") as? CartController else
            { return }
        vc.text = self.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
