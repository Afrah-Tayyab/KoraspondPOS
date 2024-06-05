//
//  CheckoutViewModel.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation
import UIKit
import CoreData
class CheckoutViewModel {
//MARK: - Properties
    private let manager =  CoreDataManager()
    var inventoryListing: [InventoryEntity] = []
    var checkoutItemListing: [Cart_Saved_DataModel] = []
    
//MARK: - Helping functions
// get the list of items that are in Cart
    func getCartList(completion: @escaping (UpdateResponse) -> Void) {
        //first remove all the list data
        self.checkoutItemListing.removeAll()
        
        //items List from the database
        let cartListing = UserDefault.loadCart()

        //now map items regarding to cart data to the list
        self.checkoutItemListing = cartListing
        
        if self.checkoutItemListing.count == 0 {
            completion(.noData)
        }else{
            completion(.success)
        }
        print("self.cartListing === \(self.checkoutItemListing.count)")
    }
    //the function will sum up the total prices of items
    func sumPrices(in items: [Cart_Saved_DataModel]) -> Int {
        return items.reduce(0) { (result, item) in
            let itemTotal = Int(item.itemTotal ?? 0)
            return result + itemTotal
        }
    }

    //the func will calculate all the values regarding checkout
    func getCheckoutTotal() -> (itemTotal: Double, tax: Double, orderTotal : Double) {
        let itemTotal : Double =  Double(self.sumPrices(in: self.checkoutItemListing))
        //10% tax will be applied on the order
        
        let tax = (itemTotal * 0.10)
        let orderTotal = itemTotal + tax
        return (itemTotal, tax, orderTotal)
    }
    
// get the list of items that are in inventory list
    func getItemList() {
        self.inventoryListing.removeAll()
        self.inventoryListing = self.manager.fetchInventoryItems()
        print("self.inventoryListing.counts === \(self.inventoryListing.count)")
    }
        
    func updateInventoryStock(cartList: [Cart_Saved_DataModel],itemList: [InventoryEntity]) {
        for cartItem in cartList {
            if let index = itemList.firstIndex(where: { $0.id == cartItem.id }) {
                
                let item = itemList[index]
                var updatedStock = item.stockQuantity
                updatedStock = updatedStock - (cartItem.cartQuantity ?? 0)
                
                let newInventory = InventoryModel(id: item.id, itemName: item.itemName, itemPrice: item.itemPrice, stockQuantity: updatedStock)
                
                self.updateInventoryItem(itemData: newInventory, inventoryEntity: item)
                
            }
        }
    }
    func updateInventoryItem(itemData : InventoryModel, inventoryEntity : InventoryEntity) {
        manager.updateInventory(inventoryData: itemData, inventoryEntity: inventoryEntity)
    }
    
}
