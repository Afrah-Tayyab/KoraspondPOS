//
//  LoginVC.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import UIKit

class LoginVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tblViewLogin: UITableView!
    //MARK: - Properties
    var loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTblView()
    }
    
    //MARK: - Helping funcs
    func setUpTblView() {
        //tableiew delegate methods are in Extension LoginTVExt file
        self.tblViewLogin.delegate = self
        self.tblViewLogin.dataSource = self
        tblViewLogin.register(UINib(nibName: "LoginTVCell", bundle: nil), forCellReuseIdentifier: "LoginTVCell")
    }
}
