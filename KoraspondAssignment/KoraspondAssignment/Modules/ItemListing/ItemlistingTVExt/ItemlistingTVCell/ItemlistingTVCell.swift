//
//  ItemlistingTVCell.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import UIKit

class ItemlistingTVCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var uvMainView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblStockQuantity: UILabel!
    
    @IBOutlet weak var uvQuantityView: UIView!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var btnMinusQuantity: UIButton!
    @IBOutlet weak var btnAddQuantity: UIButton!
    
    @IBOutlet weak var btnAddToCart: UIButton!
    //MARK: - Properties
    var onClickAddToCart:(()-> Void)?
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
        self.btnAddToCart.layer.cornerRadius = 8.0
        
        self.uvQuantityView.layer.borderWidth = 1.0
        self.uvQuantityView.layer.borderColor = UIColor.black.cgColor
        
        self.btnAddQuantity.layer.borderWidth = 1.0
        self.btnAddQuantity.layer.borderColor = UIColor.black.cgColor
        
        self.btnMinusQuantity.layer.borderWidth = 1.0
        self.btnMinusQuantity.layer.borderColor = UIColor.black.cgColor
    }
    

    func setItemData(itemData : ItemListModel) {
        self.lblName.text = itemData.itemName
        self.lblPrice.text = "Price: Rs \(itemData.itemPrice)"
        self.lblStockQuantity.text = "Stock: \(itemData.stockQuantity)"
        self.lblQuantity.text = "\(itemData.cartQuantity)"
        if itemData.isInCart {
            self.btnAddToCart.setTitle("Update Cart", for: .normal)
        }else{
            self.btnAddToCart.setTitle("Add to Cart", for: .normal)
        }
    }
    
    //MARK: - Actions
    @IBAction func btnIncreaseQuantityTap(_ sd : UIButton){
        self.onClickIncreaseQuantity?()
    }
    @IBAction func btnDecreaseQuantityTap(_ sd : UIButton){
        self.onClickDecreaseQuantity?()
    }
    @IBAction func btnAddToCartTap(_ sd : UIButton){
        self.onClickAddToCart?()
    }
    @IBAction func btnDeleteFromCart(_ sd : UIButton){
//        self.onClickDelFromCart?()
    }
}
