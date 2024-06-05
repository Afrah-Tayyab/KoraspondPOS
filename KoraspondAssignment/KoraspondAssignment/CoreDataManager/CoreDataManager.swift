//
//  CoreDataManager.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//
import Foundation
import CoreData
import UIKit
class CoreDataManager {

    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }


    
//MARK: - Adding item to inventory
    func addInventory(_ inventoryData: InventoryModel) {
        let inventoryEntity = InventoryEntity(context: context)
        
        inventoryEntity.id = inventoryData.id ?? 0
        inventoryEntity.itemName = inventoryData.itemName
        inventoryEntity.itemPrice = inventoryData.itemPrice ?? 0
        inventoryEntity.stockQuantity = inventoryData.stockQuantity ?? 0
        saveContext()
    }
//MARK: - Update the existing item in the inventory
    func updateInventory(inventoryData: InventoryModel, inventoryEntity: InventoryEntity) {
        inventoryEntity.id = inventoryData.id ?? 0
        inventoryEntity.itemName = inventoryData.itemName
        inventoryEntity.itemPrice = inventoryData.itemPrice ?? 0
        inventoryEntity.stockQuantity = inventoryData.stockQuantity ?? 0
        saveContext()
        
    }
//MARK: -  save Item to the coreDataDB
    func saveContext() {
        do {
            try context.save() // MIMP
        }catch {
            print("User saving error:", error)
        }
    }
    //delete the item from the database
    func deleteInventory(inventoryEntity : InventoryEntity,completion: @escaping (UpdateResponse) -> Void) {
        //also delete this item from cart as we are going to delete it from inventory
        let cartList = UserDefault.loadCart()
        print("cartList First Time ==== \(cartList.count)")
        let filterItemList = cartList.filter({$0.id != inventoryEntity.id})
        UserDefault.saveToCart(list: filterItemList)
        //now delete item from Database
        context.delete(inventoryEntity)
        saveContext()
        completion(.success)
    }

//MARK: -  fetch the list of items
    func fetchInventoryItems() -> [InventoryEntity] {
        var inventoryList: [InventoryEntity] = []

        do {
            inventoryList = try context.fetch(InventoryEntity.fetchRequest())
        }catch {
            print("Fetch user error", error)
        }

        return inventoryList
    }


}
