//
//  CheckoutVC.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import UIKit

class CheckoutVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tblViewCheckout : UITableView!
    @IBOutlet weak var btnPlaceOrder : UIButton!
    @IBOutlet weak var lblNoData : UILabel!
    @IBOutlet weak var uvTotalView : UIView!
    @IBOutlet weak var lblTotalItemsCount : UILabel!
    @IBOutlet weak var lblItemsTotal : UILabel!
    @IBOutlet weak var lbltax : UILabel!
    @IBOutlet weak var lblOrderTotal : UILabel!
    
    //MARK: - Properties
    
    let checkoutViewModel = CheckoutViewModel()
    //MARK: - VC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnPlaceOrder.layer.cornerRadius = 8.0
        self.uvTotalView.layer.cornerRadius = 8.0
        self.setUpTblView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
        self.checkoutViewModel.getItemList()
        fetchItemListing()
    }
    //MARK: - Helping funcs
    func setUpTblView() {
        //tableiew delegate methods are in Extension CheckoutTVExt class
        self.tblViewCheckout.delegate = self
        self.tblViewCheckout.dataSource = self
        tblViewCheckout.register(UINib(nibName: "CheckoutTVCell", bundle: nil), forCellReuseIdentifier: "CheckoutTVCell")
    }
    
    func fetchItemListing() {
        self.checkoutViewModel.getCartList { result in
            switch result {
            case .noData:
                //no data 
                self.tblViewCheckout.isHidden = true
                self.lblNoData.isHidden = false
                self.uvTotalView.isHidden = true
                self.btnPlaceOrder.isHidden = true
            case .success:
                self.tblViewCheckout.isHidden = false
                self.lblNoData.isHidden = true
                self.uvTotalView.isHidden = false
                self.btnPlaceOrder.isHidden = false
                self.tblViewCheckout.reloadData()
                self.orderSummaryDetail()
            }
        }
    }
    //func will show order summary
    func orderSummaryDetail() {
        let checkoutTotal = self.checkoutViewModel.getCheckoutTotal()
        self.lblTotalItemsCount.text = "\(self.checkoutViewModel.checkoutItemListing.count)"
        self.lblItemsTotal.text = "Rs \(checkoutTotal.itemTotal)"
        self.lbltax.text = "Rs \(checkoutTotal.tax)"
        self.lblOrderTotal.text = "Rs \(checkoutTotal.orderTotal)"
        
    }
    //MARK: - Actions
    @IBAction func btnPlaceOrderTap(_ sd : UIButton){
        //update the inventory after placing order
        self.checkoutViewModel.updateInventoryStock(cartList: self.checkoutViewModel.checkoutItemListing, itemList: self.checkoutViewModel.inventoryListing)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UserDefault.removeCartList()
            self.showToast(message: "Order Placed Successfully")
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarVC")
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    @IBAction func btnBackTap(_ sd : UIButton){
        self.navigationController?.popViewController(animated: true)
    }

}
