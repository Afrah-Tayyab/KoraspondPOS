//
//  AddItemTVExtension.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 04/06/2024.
//

import Foundation
import UIKit

//MARK: - TableView Delegates and Datasources
extension AddItemVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddItemTVCell", for: indexPath) as! AddItemTVCell
        self.setupCellForRowAt(cell: cell, index_Path: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420.0
    }
    
}

//MARK: -  TableView Helping fuunctions
extension AddItemVC {
    func setupCellForRowAt(cell : AddItemTVCell, index_Path : Int) {
        //if is to edit item then populate data
        switch self.addeditItem {
        case .addItem:
            cell.btnAddItem.setTitle("Add Item", for: .normal)
        case .editItem:
            cell.setupEditData(inventoryEntity: self.inventoryEntity)
            cell.btnAddItem.setTitle("Update Item", for: .normal)
        }
        //callbacks for textfield on fetching entered data
        cell.onAddItemName = { itemName in
            if itemName.isEmpty {
                //                show Alert that please enter name
                self.showToast(message: "Please enter Item Name")
                self.presentAlertWithTitle(title: "Alert", message: "Please enter Item Name", options: "OK"){ (option) in
                    print("option: \(option)")
                    switch(option) {
                    default:
                        break
                    }
                }
            }else{
                self.itemName = itemName
            }
        }
        cell.onAddItemPrice = { itemPrice in
            if Int(itemPrice) ?? 0 <= 0 {
                //                show Alert that price cannot be 0
                self.showToast(message: "Price must be more then 0")
                self.presentAlertWithTitle(title: "Alert", message: "Price must be more then 0", options: "OK"){ (option) in
                    print("option: \(option)")
                    switch(option) {
                    default:
                        break
                    }
                }
            }else{
                self.item_Price = itemPrice
            }
        }
        cell.onAddItemStock = { itemStock in
            if Int(itemStock) ?? 0 <= 0 {
                //                show Alert that stock cannot be 0
                self.showToast(message: "Stock/Quantity must be more then 0")
            }else{
                self.itemStockQuantity = itemStock
            }
        }
        
        cell.onClickAddItem = {
            switch self.addeditItem {
            case .addItem:
                //add new Item to Database
                self.addNewItemToDB()
            case .editItem:
                //update Item to Database
                self.updateItemToDB()
            }
        }
    }
}

extension AddItemVC {
    func addNewItemToDB() {
        if self.itemName == "" {
            self.showToast(message: "Please enter item name")
        }else if self.item_Price == "" {
            self.showToast(message: "Price must be more then 0")
        }else if self.itemStockQuantity == "" {
            self.showToast(message: "Stock/Quantity must be more then 0")
        }else{
            //call func to save data to core data
            self.addItemViewModel.getItemList()
            let inventoryCount = self.addItemViewModel.inventoryListing.count
            print("inventoryCount === \(inventoryCount)")
            let itemID = inventoryCount + 1
            print("itemID === \(itemID)")
            let newUser = InventoryModel(id: Int64(itemID), itemName: self.itemName, itemPrice: Int64(self.item_Price) ?? 0 , stockQuantity: Int64(self.itemStockQuantity) ?? 0)
            self.addItemViewModel.addNewItem(itemData: newUser)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                self.showToast(message: "SUCCESS\nItem Added to Inventory Successfully!")
                self.navigationController?.popViewController(animated: true)
            })
        }
    }
    //update the existing item in Database
    func updateItemToDB() {
        if self.itemName == "" {
            self.showToast(message: "Please enter item name")
        }else if self.item_Price == "" || self.item_Price == "0" {
            self.showToast(message: "Price must be more then 0")
        }else if self.itemStockQuantity == "" || self.itemStockQuantity == "0" {
            self.showToast(message: "Stock/Quantity must be more then 0")
        }else{
            //call func to update inventory data to core data
            let newInventory = InventoryModel(id: self.inventoryEntity.id, itemName: self.itemName, itemPrice: Int64(self.item_Price) ?? 0 , stockQuantity: Int64(self.itemStockQuantity) ?? 0)
            self.addItemViewModel.updateInventoryItem(itemData: newInventory, inventoryEntity: self.inventoryEntity)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                self.showToast(message: "SUCCESS\nItem Updated to Inventory Successfully!")
                self.navigationController?.popViewController(animated: true)
            })
        }
    }
    
}
