//
//  CartItemModel.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation

class Cart_Saved_DataModel : Codable {
    var id : Int64?
    var itemName: String?
    var itemPrice: Int64?
    var stockQuantity: Int64?
    var cartQuantity: Int64? = 1
    var itemTotal : Int64? = 0
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case itemName = "itemName"
        case itemPrice = "itemPrice"
        case stockQuantity = "stockQuantity"
        case cartQuantity = "cartQuantity"
        case itemTotal = "itemTotal"
    }
    
    init(id: Int64? = nil, itemName: String? = nil, itemPrice: Int64? = nil, stockQuantity: Int64? = nil, cartQuantity: Int64? = nil, itemTotal : Int64? = nil) {
        self.id = id
        self.itemName = itemName
        self.itemPrice = itemPrice
        self.stockQuantity = stockQuantity
        self.cartQuantity = cartQuantity
        self.itemTotal = itemTotal
    }
}
