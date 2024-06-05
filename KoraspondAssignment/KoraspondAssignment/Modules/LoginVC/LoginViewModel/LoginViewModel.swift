//
//  LoginViewModel.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation
import UIKit

class LoginViewModel {
//MARK: - Properties
    private let manager =  CoreDataManager()
    var userListing: [UserEntity] = []
    var email = "", password = ""
//MARK: - Helping functions
    
//check if user match to the user list in the databse
// get the list of Users that are in Database
    func requestUserLogin(completion: @escaping (UpdateResponse) -> Void) {
        self.userListing.removeAll()
        self.userListing = self.manager.fetchUserList()
        print("user counter\(self.userListing.count)")
        if let user = userListing.first(where: { $0.email == self.email }) {
            print("User found: \(user.email) with email \(self.email)")
            if user.password == self.password {
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
}
