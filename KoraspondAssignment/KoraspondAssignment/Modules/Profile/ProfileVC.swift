//
//  ProfileVC.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 06/06/2024.
//

import UIKit

class ProfileVC: UIViewController {
//MARK: - Outlets
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btnLogout: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnLogout.layer.cornerRadius = 8.0
        self.setupProfielData()
    }
    
    func setupProfielData() {
        let userData = UserDefault.loadLoginUser()
        self.lblEmail.text = userData.email
        self.lblFirstName.text = userData.firstName
        self.lblLastName.text = userData.lastName
        self.lblUserName.text = userData.username
    }

    @IBAction func btnLogout(_ sd :UIButton){
        UserDefault.removeUserObject()
        UserDefault.saveIsUserLogin(isUserLogin: false)
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
