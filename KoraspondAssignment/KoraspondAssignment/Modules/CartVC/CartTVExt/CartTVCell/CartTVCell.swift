//
//  CartTVCell.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import UIKit

class CartTVCell: UITableViewCell {
//MARK: - Outlets
    
    @IBOutlet weak var uvMainView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSelectedQuantity: UILabel!
    @IBOutlet weak var lblItemTotal: UILabel!
    
    @IBOutlet weak var uvQuantityView: UIView!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var btnMinusQuantity: UIButton!
    @IBOutlet weak var btnAddQuantity: UIButton!
    
    @IBOutlet weak var btnUpdateCart: UIButton!
    //MARK: - Properties
    var onCliclUpdateCart:(()-> Void)?
    var onClickDelFromCart:(()-> Void)?
    var onClickIncreaseQuantity:(()-> Void)?
    var onClickDecreaseQuantity:(()-> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    //MARK: - Helping functions
        func setupUI() {
            //view styling
            self.uvMainView.layer.cornerRadius = 8.0
            self.uvMainView.layer.borderWidth = 1.0
            self.uvMainView.layer.borderColor = UIColor.lightGray.cgColor
            self.btnUpdateCart.layer.cornerRadius = 8.0
            
            self.uvQuantityView.layer.borderWidth = 1.0
            self.uvQuantityView.layer.borderColor = UIColor.black.cgColor
            
            self.btnAddQuantity.layer.borderWidth = 1.0
            self.btnAddQuantity.layer.borderColor = UIColor.black.cgColor
            
            self.btnMinusQuantity.layer.borderWidth = 1.0
            self.btnMinusQuantity.layer.borderColor = UIColor.black.cgColor
        }
    func setupCartData(cartData : Cart_Saved_DataModel) {
        self.lblName.text = cartData.itemName
        self.lblPrice.text = "Rs \(cartData.itemPrice ?? 0)"
        self.lblSelectedQuantity.text = "Cart Quantity : \(cartData.cartQuantity ?? 0)"
        self.lblQuantity.text = "\(cartData.cartQuantity ?? 0)"
        let itemTotal = ((cartData.cartQuantity ?? 0) * (cartData.itemPrice ?? 0))
        self.lblItemTotal.text = "Item Total: Rs \(itemTotal)"
    }
    //MARK: - Actions
    @IBAction func btnIncreaseQuantityTap(_ sd : UIButton){
        self.onClickIncreaseQuantity?()
    }
    @IBAction func btnDecreaseQuantityTap(_ sd : UIButton){
        self.onClickDecreaseQuantity?()
    }
    @IBAction func btnUpdateCartTap(_ sd : UIButton){
        self.onCliclUpdateCart?()
    }
    @IBAction func btnDeleteFromCart(_ sd : UIButton){
        self.onClickDelFromCart?()
    }
}
