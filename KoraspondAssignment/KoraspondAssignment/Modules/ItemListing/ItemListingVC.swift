//
//  ItemListingVC.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 04/06/2024.
//

import UIKit

class ItemListingVC: UIViewController {

    //MARK: -  Outlets
    @IBOutlet weak var tblViewItemListing: UITableView!
    @IBOutlet weak var lblNoData: UILabel!
    //MARK: -  Properties
    let itemListingViewModel = ItemListingViewModel()
//    var cartQuantity = 1
    //MARK: - VC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTblView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
        self.fetchItemListing()
    }
    //MARK: - Helping funcs
    func setUpTblView() {
        //tableiew delegate methods are in Extension ItemlistingTVExt class
        self.tblViewItemListing.delegate = self
        self.tblViewItemListing.dataSource = self
        tblViewItemListing.register(UINib(nibName: "ItemlistingTVCell", bundle: nil), forCellReuseIdentifier: "ItemlistingTVCell")
    }
    
    func fetchItemListing() {
        self.itemListingViewModel.getItemList { result in
            switch result {
            case .noData:
                print("no data found")
                self.tblViewItemListing.isHidden = true
                self.lblNoData.isHidden = false
            case .success:
                self.tblViewItemListing.isHidden = false
                self.lblNoData.isHidden = true
                self.tblViewItemListing.reloadData()
            }
        }
    }
}

