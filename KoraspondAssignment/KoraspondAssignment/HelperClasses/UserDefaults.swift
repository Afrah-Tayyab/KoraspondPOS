//
//  UserDefaults.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation

class UserDefault : NSObject {
    static let shared = UserDefault()
    private override init() {}
    
    static func saveToCart(list:[Cart_Saved_DataModel]){
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(list)
            UserDefaults.standard.set(data, forKey: "cartList")
        } catch {
            print("got an error ==== \(error)")
        }
    }
    
    static func loadCart()->[Cart_Saved_DataModel]{
        var result:[Cart_Saved_DataModel] = []
        if let data = UserDefaults.standard.data(forKey: "cartList") {
            do {
                let decoder = JSONDecoder()
                let notes = try decoder.decode([Cart_Saved_DataModel].self, from: data)
                result = notes
            } catch {
                print("Unable to Decode result (\(error))")
            }
        }
        return result
    }
    static func removeCartList() {
        UserDefaults.standard.removeObject(forKey: "cartList")
    }
    
    static func saveLoginUser(userModel: LoginModel){
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(userModel)
            UserDefaults.standard.set(data, forKey: "userModel")
        } catch {
            print("got an error ==== \(error)")
        }
    }
    
    static func loadLoginUser()-> LoginModel{
        var result: LoginModel = LoginModel()
        if let data = UserDefaults.standard.data(forKey: "userModel") {
            do {
                let decoder = JSONDecoder()
                let notes = try decoder.decode(LoginModel.self, from: data)
                result = notes
            } catch {
                print("Unable to Decode result (\(error))")
            }
        }
        return result
    }
    
    static func saveIsUserLogin(isUserLogin: Bool) {
        UserDefaults.standard.set(isUserLogin, forKey: "isUserLogin")
        UserDefaults.standard.synchronize()
    }
    
    static func getIsUserLogin() -> Bool {
        guard let userValue = UserDefaults.standard.value(forKey: "isUserLogin") as? Bool else {return false}
        return userValue
    }
}
