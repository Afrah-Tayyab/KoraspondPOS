//
//  ItemListingViewModel.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation
import UIKit

class ItemListingViewModel {
//MARK: - Properties
    private weak var navigationController: UINavigationController?
    private let manager =  CoreDataManager()
    var itemListing: [InventoryEntity] = []
    var items_CartListing: [ItemListModel] = []
    
//MARK: - Helping functions
    
// get the list of items that are in inventory list
    func getItemList(completion: @escaping (UpdateResponse) -> Void) {
        //first remove all the list data
        self.items_CartListing.removeAll()
        
        //items List from the database
        self.itemListing = self.manager.fetchInventoryItems()
        var itemsList: [ItemListModel] = itemListing.map { itemListing in
            //fetchCart list that is saved in user defaults
            // now check if the item is in cart then update that item model according to the cart data
            let cartList = UserDefault.loadCart()
            let item_ExistsInCart = cartList.contains{ $0.id == itemListing.id}
            let itemFoundModel = cartList.first{ $0.id == itemListing.id}
            var cartQuantity = 1
            if item_ExistsInCart {
                cartQuantity = Int(itemFoundModel?.cartQuantity ?? 0)
            }
            
            return ItemListModel(id: itemListing.id, itemName: itemListing.itemName ?? "", itemPrice: itemListing.itemPrice, stockQuantity: itemListing.stockQuantity, cartQuantity: Int64(cartQuantity), isInCart: item_ExistsInCart)
        }
        //if any item stock Quantity is 0 then do not populate it
        itemsList = itemsList.filter({$0.stockQuantity != 0})
        
        //now map items regarding to cart data to the list
        self.items_CartListing = itemsList
        
        if self.items_CartListing.count == 0 {
            completion(.noData)
        }else{
            completion(.success)
        }
        print("self.items_CartListing === \(self.items_CartListing.count)")
        print("self.itemListing.counts === \(self.itemListing.count)")
        
    }
}
