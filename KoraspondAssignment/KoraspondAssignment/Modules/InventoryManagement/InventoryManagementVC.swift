//
//  InventoryManagementVC.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 04/06/2024.
//

import UIKit

class InventoryManagementVC: UIViewController {

    //MARK: -  Outlets
    @IBOutlet weak var tblViewInventory: UITableView!
    @IBOutlet weak var lblNoData: UILabel!
    @IBOutlet weak var btnAddItem: UIButton!
    //MARK: -  Properties
    let inventoryViewModel = InventoryVeiwModel()
    
    //MARK: - VC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // styling to button
        self.btnAddItem.layer.cornerRadius = 8.0
        self.setUpTblView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
        self.getInventoryList()
    }
    
    func getInventoryList() {
        self.inventoryViewModel.getItemList { result in
            switch result {
            case .noData:
                //no data
                self.tblViewInventory.isHidden = true
                self.btnAddItem.isHidden = false
                self.lblNoData.isHidden = false
            case .success:
                self.tblViewInventory.isHidden = false
                self.btnAddItem.isHidden = false
                self.lblNoData.isHidden = true
                self.tblViewInventory.reloadData()
            }
        }
    }
    //MARK: - Helping funcs
    func setUpTblView() {
        //tableiew delegate methods are in Extension InventoryManagementTVExt class
        self.tblViewInventory.delegate = self
        self.tblViewInventory.dataSource = self
        tblViewInventory.register(UINib(nibName: "InventoryListingTVCell", bundle: nil), forCellReuseIdentifier: "InventoryListingTVCell")
    }
    //MARK: -  Actions
    @IBAction func btnAddItemTap(_ sd :  UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddItemVC") as? AddItemVC
        vc?.addeditItem = .addItem
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
