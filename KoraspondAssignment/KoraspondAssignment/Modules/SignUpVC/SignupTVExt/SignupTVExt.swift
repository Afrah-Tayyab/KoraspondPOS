//
//  SignupTVExt.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation
import UIKit

//MARK: - TableView Delegates and Datasources
extension SignUpVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SignUpTVCell", for: indexPath) as! SignUpTVCell
        cell.onAddEmail = { email in
            if email == ""{
                self.showToast(message: "Please enter email")
            }else{
                self.email = email
            }
        }
        
        cell.onAddPassword = { userPassword in
            if userPassword == ""{
                self.showToast(message: "Please enter Password")
            }else{
                self.user_password = userPassword
            }
        }
        cell.onAddFirstName = { userFirstName in
            if userFirstName == ""{
                self.showToast(message: "Please enter First Name")
            }else{
                self.firstName = userFirstName
            }
        }
        cell.onAddLastName = { userLastName in
            if userLastName == ""{
                self.showToast(message: "Please enter Last Name")
            }else{
                self.lastName = userLastName
            }
        }
        cell.onAddUserName = { userName in
            if userName == ""{
                self.showToast(message: "Please enter User Name")
            }else{
                self.username = userName
            }
        }
        
        cell.onClickSignup = {
            self.signupViewModel.registerUser(email: self.email, username: self.username, firstName: self.firstName, lastName: self.lastName, user_password: self.user_password) { result in
                switch result {
                case .noData:
                    break
                case .success:
                    self.pushToLogin()
                }
            }
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 625.0
    }
}

extension SignUpVC {
    func pushtoTabBar() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarVC")
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    func pushToLogin() {
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
