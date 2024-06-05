//
//  InventoryModel.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation


//struct InventoryModel {
//    let id : Int64
//    let itemName: String
//    let itemPrice: Int64
//    let stockQuantity: Int64
//}

class InventoryModel : Codable {
    var id : Int64?
    var itemName: String?
    var itemPrice: Int64?
    var stockQuantity: Int64?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case itemName = "itemName"
        case itemPrice = "itemPrice"
        case stockQuantity = "stockQuantity"
    }
    
    init(id: Int64? = nil, itemName: String? = nil, itemPrice: Int64? = nil, stockQuantity: Int64? = nil) {
        self.id = id
        self.itemName = itemName
        self.itemPrice = itemPrice
        self.stockQuantity = stockQuantity
    }
}
