//
//  AddItemViewModel.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation
import UIKit

class AddItemViewModel {
    private weak var navigationController: UINavigationController?
    private let manager =  CoreDataManager()
    var inventoryListing: [InventoryEntity] = []
    
    func addNewItem(itemData : InventoryModel) {
        manager.addInventory(itemData)
    }
    
    func getItemList() {
        self.inventoryListing = self.manager.fetchInventoryItems()
        print("self.inventoryListing.counts === \(self.inventoryListing.count)")
    }

    func updateInventoryItem(itemData : InventoryModel, inventoryEntity : InventoryEntity) {
        manager.updateInventory(inventoryData: itemData, inventoryEntity: inventoryEntity)
    }
    
}
