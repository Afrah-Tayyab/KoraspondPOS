//
//  CheckoutTVCell.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import UIKit

class CheckoutTVCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var uvMainView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSelectedQuantity: UILabel!
    @IBOutlet weak var lblItemTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.uvMainView.layer.cornerRadius = 8.0
        self.uvMainView.layer.borderWidth = 1.0
        self.uvMainView.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setupCheckoutData(cartData : Cart_Saved_DataModel) {
        self.lblName.text = cartData.itemName
        self.lblPrice.text = "Rs \(cartData.itemPrice ?? 0)"
        self.lblSelectedQuantity.text = "Cart Quantity : \(cartData.cartQuantity ?? 0)"
        let itemTotal = ((cartData.cartQuantity ?? 0) * (cartData.itemPrice ?? 0))
        self.lblItemTotal.text = "Item Total: Rs \(itemTotal)"
    }
}
