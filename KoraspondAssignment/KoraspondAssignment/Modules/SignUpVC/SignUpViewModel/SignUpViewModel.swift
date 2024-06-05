//
//  SignUpViewModel.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 06/06/2024.
//

import Foundation
import UIKit

class SignUpViewModel {
//MARK: - Properties
    private let manager =  CoreDataManager()
    var userListing: [UserEntity] = []
//MARK: - Helping functions
    
//check if user match to the user list in the databse
// get the list of Users that are in Database
    func requestUserLogin(login_email: String, login_password : String,completion: @escaping (UpdateResponse) -> Void) {
        self.userListing.removeAll()
        self.userListing = self.manager.fetchUserList()
        
        if let user = userListing.first(where: { $0.email == login_email }) {
            print("User found: \(user.email) with email \(login_email)")
            if user.password == login_password {
                // save user data to user defaults
                let loginUser = LoginModel(email: user.email, firstName: user.firstName, lastName: user.lastName, password: user.password, username: user.username)
                UserDefault.saveLoginUser(userModel: loginUser)
                UserDefault.saveIsUserLogin(isUserLogin: true)
                completion(.success)
            }else{
                completion(.noData)
            }
        } else {
            print("User not found")
            completion(.noData)
        }
    }
    
    func registerUser(email : String, username : String, firstName : String, lastName : String, user_password : String,completion: @escaping (UpdateResponse) -> Void) {
        if email == "" {
            completion(.noData)
        }else if username == "" {
            completion(.noData)
        }else if firstName == "" {
            completion(.noData)
        }else if lastName == "" {
            completion(.noData)
        }else if user_password == "" {
            completion(.noData)
        }else{
            let registerModel = LoginModel(email: email, firstName: firstName, lastName: lastName, password: user_password, username: username)
            self.manager.registerUser(registerModel)
            completion(.success)
        }
    }
}
