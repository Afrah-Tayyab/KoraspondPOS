//
//  CartViewModel.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation
import UIKit

class CartViewModel {
//MARK: - Properties
    var cartListing: [Cart_Saved_DataModel] = []
    
//MARK: - Helping functions
// get the list of items that are in Cart
    func getCartList(completion: @escaping (UpdateResponse) -> Void) {
        //first remove all the list data
        self.cartListing.removeAll()
        
        //items List from the database
        let cartListing = UserDefault.loadCart()
        
        //now map items regarding to cart data to the list
        self.cartListing = cartListing
        
        if self.cartListing.count == 0 {
            completion(.noData)
        }else{
            completion(.success)
        }
        print("self.cartListing === \(self.cartListing.count)")
    }
}
