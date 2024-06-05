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
}
