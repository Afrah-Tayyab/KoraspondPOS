//
//  CartVC.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 04/06/2024.
//

import UIKit

class CartVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tblViewCartListing : UITableView!
    @IBOutlet weak var btnCheckout : UIButton!
    @IBOutlet weak var lblNoData : UILabel!
    
    //MARK: - Properties
    var cartViewModel = CartViewModel()
    //MARK: - VC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnCheckout.layer.cornerRadius = 8.0
        self.setUpTblView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
        self.fetchCartListing()
    }
    
    
    //MARK: - Helping funcs
    func setUpTblView() {
        //tableiew delegate methods are in Extension CartTVExt class
        self.tblViewCartListing.delegate = self
        self.tblViewCartListing.dataSource = self
        tblViewCartListing.register(UINib(nibName: "CartTVCell", bundle: nil), forCellReuseIdentifier: "CartTVCell")
    }
    
    func fetchCartListing() {
        self.cartViewModel.getCartList { result in
            switch result {
            case .noData:
                print("no data found")
                self.tblViewCartListing.isHidden = true
                self.btnCheckout.isHidden = true
                self.lblNoData.isHidden = false
            case .success:
                self.tblViewCartListing.isHidden = false
                self.btnCheckout.isHidden = false
                self.lblNoData.isHidden = true
                self.tblViewCartListing.reloadData()
            }
        }
    }
    @IBAction func btnPushToCheckOutTap(_ sd : UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CheckoutVC") as? CheckoutVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}
