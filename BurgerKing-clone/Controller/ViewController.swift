//
//  ViewController.swift
//  BurgerKing-clone
//
//  Created by 김준섭 on 2022/05/24.
//

import UIKit
import AVFoundation
import Photos

class ViewController: UIViewController {

    @IBAction func diabloBtn(_ sender: UIButton) {
//        모달창 띄우는 방법
//        guard let cartController = storyboard?.instantiateViewController(withIdentifier: "CartController") as? CartController else {return}
//        cartController.modalPresentationStyle = .fullScreen
//        self.present(cartController, animated: true)
        
//      네비게이션 컨트롤러 화면전환
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = UIImageView(image: UIImage(named: "main-logo"))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "hamburger-btn"))
//        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named: "barcode")),UIBarButtonItem(image: UIImage(named: "cart"))]
        
        checkCameraPermission()
        checkAlbumPermission()
    }
    
    func checkCameraPermission(){
           AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
               if granted {
                   print("카메라 권한 허용")
               } else {
                   print("카메라 권한 거부")
               }
           })
        }
    
    func checkAlbumPermission(){
            PHPhotoLibrary.requestAuthorization( { status in
                switch status{
                case .authorized:
                    print("앨범 권한 허용")
                case .denied:
                    print("앨범 권한 거부")
                case .restricted, .notDetermined:
                    print("앨범 선택하지 않음")
                default:
                    break
                }
            })
        }
}

