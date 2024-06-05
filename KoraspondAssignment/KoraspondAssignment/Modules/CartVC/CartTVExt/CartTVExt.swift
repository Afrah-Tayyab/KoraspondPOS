//
//  CartTVExt.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation
import UIKit
//MARK: - TableView Delegates and Datasources
extension CartVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cartViewModel.cartListing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTVCell", for: indexPath) as! CartTVCell
        let data = self.cartViewModel.cartListing[indexPath.row]
        //setup data to cell
        cell.setupCartData(cartData: data)
        //actions callback
        cell.onCliclUpdateCart = {
            self.updateCartItem(data: data)
        }
        //increase cartquantity action
        cell.onClickIncreaseQuantity = {
            if Int(data.cartQuantity ?? 0) == Int(data.stockQuantity ?? 0) { //self.cartQuantity
                self.showToast(message: "\(Int(data.cartQuantity ?? 0)) is max quantity available in stock")
            }else{
                data.cartQuantity!  += 1
                cell.lblQuantity.text = "\(data.cartQuantity ?? 0)"
            }
        }
        //decrease cartquantity action
        cell.onClickDecreaseQuantity = {
            if data.cartQuantity == 1 {
                self.showToast(message: "minimum buyable quantity is 1.")
            }else{
                
                data.cartQuantity! -= 1
                cell.lblQuantity.text = "\(data.cartQuantity ?? 0)"
            }
        }
        //delete from cart
        cell.onClickDelFromCart = {
            let cartList = UserDefault.loadCart()
            print("cartList First Time ==== \(cartList.count)")
            let filterItemList = cartList.filter({$0.id != data.id})
            UserDefault.saveToCart(list: filterItemList)
            print("UserInfoDefault.loadCart() cartList ==== \(UserDefault.loadCart().count)")
            self.showToast(message: "Item Deleted From Cart")
            self.fetchCartListing()
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210.0
    }
}

extension CartVC {
    
    func updateCartItem(data : Cart_Saved_DataModel) {
        var cartList = [Cart_Saved_DataModel]()
        cartList = UserDefault.loadCart()
        print("existing cartList === \(cartList.count)")
        let item_Total = Int(data.itemPrice ?? 0) * Int(data.cartQuantity ?? 0)
        print("item_Total === \(item_Total)")
        //now fetch the cart model that is to be updated...
        let cartModel = Cart_Saved_DataModel(id: data.id, itemName: data.itemName, itemPrice: data.itemPrice, stockQuantity: data.stockQuantity, cartQuantity: data.cartQuantity, itemTotal: Int64(item_Total))
        //remove cart model that is to be updated...
        var filterItemList = cartList.filter({$0.id != data.id})
        UserDefault.saveToCart(list: filterItemList)
//        now append that updated model to the list
        filterItemList.append(cartModel)
        UserDefault.saveToCart(list: filterItemList)
        let updatedCartList = UserDefault.loadCart()
        print("new cart list === \(updatedCartList.count)")
        self.showToast(message: "Cart updated Successfully")
        self.fetchCartListing()
    }
}
