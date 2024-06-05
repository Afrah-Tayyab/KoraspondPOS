//
//  AddItemVC.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 04/06/2024.
//

import UIKit
//let newInventory = InventoryModel(id: iventoryEntity.id, itemName: iventoryEntity.itemName, itemPrice: Int64(50000000), stockQuantity: Int64(500))
//self.inventoryViewModel.updateInventoryItem(itemData: newInventory, inventoryEntity: iventoryEntity)
class AddItemVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tblViewAddItem: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    //MARK: - Properties
    var addItemViewModel = AddItemViewModel()
    var itemName = "", item_Price = "" , itemStockQuantity = ""
    var inventoryEntity = InventoryEntity()
    var addeditItem = AddEditItemCase.addItem
    //MARK: - VC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        switch self.addeditItem {
        case .addItem:
            self.lblTitle.text = "Add Item"
        case .editItem:
            self.lblTitle.text = "Edit Item"
            self.itemName = self.inventoryEntity.itemName ?? ""
            self.item_Price = "\(self.inventoryEntity.itemPrice)"
            self.itemStockQuantity = "\(self.inventoryEntity.stockQuantity)"
        }
        self.setUpTblView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //MARK: - Helping funcs
    func setUpTblView() {
        //tableiew delegate methods are in Extension AddItemTVExtension class
        self.tblViewAddItem.delegate = self
        self.tblViewAddItem.dataSource = self
        tblViewAddItem.register(UINib(nibName: "AddItemTVCell", bundle: nil), forCellReuseIdentifier: "AddItemTVCell")
    }
    
    @IBAction func btnBackTap(_ sd : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
}
