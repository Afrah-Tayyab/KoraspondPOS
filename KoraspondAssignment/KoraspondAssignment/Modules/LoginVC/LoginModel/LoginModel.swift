//
//  LoginModel.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation

class LoginModel : Codable {
    var email : String?
    var firstName: String?
    var lastName: String?
    var password: String?
    var username: String?
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case firstName = "firstName"
        case lastName = "lastName"
        case username = "username"
        case password = "password"
    }
    
    init(email: String? = nil, firstName: String? = nil, lastName: String? = nil, password: String? = nil, username: String? = nil) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
        self.username = username
    }
}
