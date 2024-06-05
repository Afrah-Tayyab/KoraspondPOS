//
//  InventoryListingTVCell.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 04/06/2024.
//

import UIKit

class InventoryListingTVCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var uvMainView: UIView!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblItemPrice: UILabel!
    @IBOutlet weak var lblItemQuantity: UILabel!
    //MARK: - Properties
    var onClickEdit:(()-> Void)?
    var onClickDelete:(()-> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        //main view styling
        self.uvMainView.layer.cornerRadius = 8.0
        self.uvMainView.layer.borderWidth = 1.0
        self.uvMainView.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //MARK: - setup API Data
    func setItemData(itemData : InventoryEntity) {
        self.lblItemName.text = itemData.itemName
        self.lblItemPrice.text = "Price: Rs \(itemData.itemPrice)"
        self.lblItemQuantity.text = "Stock: \(itemData.stockQuantity)"
    }
    
    //MARK: - Actions
    @IBAction func btnEditTap(_ sd : UIButton){
        self.onClickEdit?()
    }
    @IBAction func btnDeleteTap(_ sd : UIButton){
        self.onClickDelete?()
    }
    
}
