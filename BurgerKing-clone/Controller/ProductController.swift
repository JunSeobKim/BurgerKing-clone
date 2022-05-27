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
    var flag: Int = 0
    
    // 텍스트 저장
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        text = sender.text ?? ""
    }
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    // 프로퍼티에 직접 접근해 데이터 전달
    @IBAction func cartButtonDidTap(_ sender: UIButton) {
        // 올바른 주문로직일 경우 flag를 1로 변경
        self.flag = 1
        guard let vc =  storyboard?.instantiateViewController(identifier: "CartController") as? CartController else
            { return }
        vc.text = self.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 뷰가 사라지기 직전 경고 표시
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // flag를 만들어 다음 주문로직 화면이 아닐 시 alert 호출
        guard self.flag == 0 else { return }
        // alert
        let alert = UIAlertController(title: "경고", message: "작성중인 내용을 취소하겠습니까?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "취소하기", style: .cancel, handler: { (_) in
            self.textFieldOutlet.text = ""
        }))
        alert.addAction(UIAlertAction(title: "돌아가기", style: .default, handler: { (_) in
            // 돌아가기 누르면 홈으로
            self.tabBarController?.selectedIndex = 0
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
