//
//  AddItemTVCell.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 04/06/2024.
//

import UIKit

class AddItemTVCell: UITableViewCell {

    //MARK: - Outlets
    //labels outlets
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblItemPrice: UILabel!
    @IBOutlet weak var lblItemStock: UILabel!
    //textfield outlets
    @IBOutlet weak var tfItemName: UITextField!
    @IBOutlet weak var tfItemPrice: UITextField!
    @IBOutlet weak var tfItemStock: UITextField!
    // button outlet
    @IBOutlet weak var btnAddItem: UIButton!
    //MARK: -  Properties
    //textfield callbacks
    var onAddItemName:((_ itemName : String)->Void)?
    var onAddItemPrice:((_ itemPrice : String)->Void)?
    var onAddItemStock:((_ itemStock : String)->Void)?
    //addItem button callback
    var onClickAddItem:(()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //delegates for textfields
        self.tfItemName.delegate = self
        self.tfItemPrice.delegate = self
        self.tfItemStock.delegate = self
        //corner radius for button for styling
        self.btnAddItem.layer.cornerRadius = 8.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setupEditData(inventoryEntity : InventoryEntity) {
        self.tfItemName.text = inventoryEntity.itemName
        self.tfItemPrice.text = "\(inventoryEntity.itemPrice)"
        self.tfItemStock.text = "\(inventoryEntity.stockQuantity)"
    }
    //MARK: - Actions
    @IBAction func btnAddItemTap(_ sender : UIButton){
        //callback to controller when add item button tap
        self.onClickAddItem?()
    }
}
//MARK: - Textfield delegate funcs
extension AddItemTVCell : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.tfItemName {
            self.onAddItemName?(self.tfItemName.text ?? "")
        }
        else if textField == self.tfItemPrice {
            self.onAddItemPrice?(self.tfItemPrice.text ?? "")
        }
        else if textField == self.tfItemStock {
            self.onAddItemStock?(self.tfItemStock.text ?? "")
        }
    }
}
