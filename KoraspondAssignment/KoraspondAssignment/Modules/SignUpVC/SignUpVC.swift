//
//  SignUpVC.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import UIKit

class SignUpVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tblViewSignup: UITableView!
    //MARK: - Properties
    var signupViewModel = SignUpViewModel()
    
    var email = "", password = "", firstName = "", lastName = "", user_password = "", username = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTblView()
    }
    
    //MARK: - Helping funcs
    func setUpTblView() {
        //tableiew delegate methods are in Extension SignupTVExt file
        self.tblViewSignup.delegate = self
        self.tblViewSignup.dataSource = self
        tblViewSignup.register(UINib(nibName: "SignUpTVCell", bundle: nil), forCellReuseIdentifier: "SignUpTVCell")
    }

}
