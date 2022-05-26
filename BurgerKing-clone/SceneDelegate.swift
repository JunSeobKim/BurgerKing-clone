//
//  SceneDelegate.swift
//  BurgerKing-clone
//
//  Created by 김준섭 on 2022/05/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var blurView: UIVisualEffectView?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        print(#function)
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        print(#function)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
//        callBackgroundImage(false)
        print(#function)
        if let blurView = blurView {
                    blurView.removeFromSuperview()
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
//        callBackgroundImage(true)
        print(#function)
        guard let window = window else {
                    return
        }
        let effect = UIBlurEffect(style: .regular)
        blurView = UIVisualEffectView(effect: effect)
        blurView?.frame = window.frame
        window.addSubview(blurView!)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        callBackgroundImage(false)
        print(#function)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        callBackgroundImage(true)
        print(#function)
    }
    
    
    // 뷰 생성으로 switcher 하는 방법
    func callBackgroundImage(_ bShow: Bool) {
           
           let TAG_BG_IMG = -101

           let backgroundView = window?.rootViewController?.view.window?.viewWithTag(TAG_BG_IMG)

           if bShow {

               if backgroundView == nil {

                   // 뷰 생성
                   let bgView = UIView()
                   bgView.frame = UIScreen.main.bounds
                   bgView.tag = TAG_BG_IMG
                   bgView.backgroundColor = .black

                   let lbl = UILabel()
                   lbl.frame = UIScreen.main.bounds
                   lbl.textAlignment = .center
                   lbl.font = UIFont.systemFont(ofSize: 30)
                   lbl.textColor = .white
                   lbl.numberOfLines = 0
                   lbl.text = "BurgerKing"
                   bgView.addSubview(lbl)

                   window?.rootViewController?.view.window?.addSubview(bgView)
               }
           } else {

               if let backgroundView = backgroundView {
                   backgroundView.removeFromSuperview()
               }
           }
       }


}

