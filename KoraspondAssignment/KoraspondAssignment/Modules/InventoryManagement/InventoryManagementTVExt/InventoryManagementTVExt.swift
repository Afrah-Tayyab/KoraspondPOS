//
//  InventoryManagementTVExt.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 04/06/2024.
//

import Foundation
import UIKit

//MARK: - TableView Delegates and Datasources
extension InventoryManagementVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.inventoryViewModel.inventoryListing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InventoryListingTVCell", for: indexPath) as! InventoryListingTVCell
        self.setupCellForRowAt(cell: cell, index_Path: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175.0
    }
    
}

//MARK: -  TableView Helping fuunctions
extension InventoryManagementVC {
    func setupCellForRowAt(cell : InventoryListingTVCell, index_Path : Int) {
        cell.setItemData(itemData: self.inventoryViewModel.inventoryListing[index_Path])
        cell.onClickEdit = {
            print("edit inventory")
            
            let iventoryEntity = self.inventoryViewModel.inventoryListing[index_Path]
            self.pushToEditItem(inventoryEntity: iventoryEntity)

            self.getInventoryList()
        }
        
        cell.onClickDelete = {
            //delete item from inventory
            let inventoryData = self.inventoryViewModel.inventoryListing[index_Path]
            self.inventoryViewModel.deleteInventory(inventoryEntity: inventoryData) { result in
                switch result {
                case .noData:
                    break
                case .success:
                    self.getInventoryList()
                }
            }
        }
    }
    
    func pushToEditItem(inventoryEntity : InventoryEntity) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddItemVC") as? AddItemVC
        vc?.inventoryEntity = inventoryEntity
        vc?.addeditItem = .editItem
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
