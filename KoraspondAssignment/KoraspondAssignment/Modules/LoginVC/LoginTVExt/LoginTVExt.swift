//
//  LoginTVExt.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation
import UIKit

//MARK: - TableView Delegates and Datasources
extension LoginVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoginTVCell", for: indexPath) as! LoginTVCell
        
        cell.onAddPassword = { pssword in
            if pssword == "" {
                self.showToast(message: "Please enter password")
            }else{
                self.loginViewModel.password = pssword
            }
        }
        
        cell.onAddEmail = { email in
            if email == "" {
                self.showToast(message: "Please enter email")
            }else{
                self.loginViewModel.email = email
            }
        }
        //actions callback
        cell.onCLickLogin = {
            self.loginViewModel.requestUserLogin() { result in
                switch result {
                case .noData:
                    self.showToast(message: "Not able to login.Try again")
                case .success :
//                    as of success push to to tab bar
                    self.pushToTabbar()
                }
            }
        }
        cell.onClickSignUp = {
            self.pushToSignup()
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 460.0
    }
}

extension LoginVC {
    func pushToTabbar() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarVC")
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    func pushToSignup() {
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
