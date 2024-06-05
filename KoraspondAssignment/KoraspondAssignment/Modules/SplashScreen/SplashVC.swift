//
//  SplashVC.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 04/06/2024.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefault.getIsUserLogin() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarVC")
                UIApplication.shared.windows.first?.rootViewController = vc
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
        }else{
            let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }

}
