//
//  InventoryVeiwModel.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 04/06/2024.
//

import Foundation
import UIKit

class InventoryVeiwModel {
//MARK: - Properties
    private weak var navigationController: UINavigationController?
    private let manager =  CoreDataManager()
    var inventoryListing: [InventoryEntity] = []
    
//MARK: - Helping functions
// get the list of items that are in inventory list
    func getItemList(completion: @escaping (UpdateResponse) -> Void) {
        self.inventoryListing = self.manager.fetchInventoryItems()
        if self.inventoryListing.count == 0 {
            completion(.noData)
        }else{
            completion(.success)
        }
        print("self.inventoryListing.counts === \(self.inventoryListing.count)")
    }
    
    func updateInventoryItem(itemData : InventoryModel, inventoryEntity : InventoryEntity) {
        manager.updateInventory(inventoryData: itemData, inventoryEntity: inventoryEntity)
    }
    
    func deleteInventory(inventoryEntity : InventoryEntity) {
        manager.deleteInventory(inventoryEntity: inventoryEntity)
    }
    
}
