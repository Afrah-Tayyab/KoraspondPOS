//
//  ItemlistingTVExt.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation
import UIKit

//MARK: - TableView Delegates and Datasources
extension ItemListingVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemListingViewModel.items_CartListing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemlistingTVCell", for: indexPath) as! ItemlistingTVCell
        self.setupCellForRowAt(cell: cell, index_Path: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
    
}

//MARK: -  TableView Helping fuunctions
extension ItemListingVC {
    func setupCellForRowAt(cell : ItemlistingTVCell, index_Path : Int) {
        var data = self.itemListingViewModel.items_CartListing[index_Path]
        //setup data to cell
        cell.setItemData(itemData: data)

        //actions callback
        //add to cart action
        cell.onClickAddToCart = {
            //if item is in cart then update it
            if data.isInCart {
                //update Cart
                print("item exist in cart update it")
                self.updateCartItem(data: data)
            }else{
            //as item is not in cart now add it to cart
                print("add item to cart")
                self.addItemToCart(data: data)
            }
        }
        //increase cartquantity action
        cell.onClickIncreaseQuantity = {
            if data.cartQuantity == Int(data.stockQuantity) {
                self.showToast(message: "\(Int(data.stockQuantity)) is max quantity available in stock")
            }else{
                data.cartQuantity  += 1
                cell.lblQuantity.text = "\(data.cartQuantity)"
            }
        }
        //decrease cartquantity action
        cell.onClickDecreaseQuantity = {
            if data.cartQuantity == 1 {
                self.showToast(message: "minimum buyable quantity is 1.")
            }else{
                data.cartQuantity -= 1
                cell.lblQuantity.text = "\(data.cartQuantity)"
            }
        }
        
        //delete from cart
        cell.onClickDelFromCart = {
            //delete the item first check if that item id exists if yes then delete it
            let cartList = UserDefault.loadCart()
            print("cartList First Time ==== \(cartList.count)")
            let filterItemList = cartList.filter({$0.id != data.id})
            UserDefault.saveToCart(list: filterItemList)
            print("UserInfoDefault.loadCart() cartList ==== \(UserDefault.loadCart().count)")
            self.showToast(message: "Item Deleted From Cart")
            self.fetchItemListing()
        }
    }
    
    func addItemToCart(data : ItemListModel) {
        var cartList = [Cart_Saved_DataModel]()
        cartList = UserDefault.loadCart()
        let item_Total = data.itemPrice * data.cartQuantity
        let cartModel = Cart_Saved_DataModel(id: data.id, itemName: data.itemName, itemPrice: data.itemPrice, stockQuantity: data.stockQuantity, cartQuantity: data.cartQuantity, itemTotal: item_Total)
        cartList.append(cartModel)
        UserDefault.saveToCart(list: cartList)
        let updatedCartList = UserDefault.loadCart()
        print("new cart list === \(updatedCartList.count)")
        self.showToast(message: "Item added to Cart Successfully")
        self.fetchItemListing()
    }
    
    
    func updateCartItem(data : ItemListModel) {
        var cartList = [Cart_Saved_DataModel]()
        cartList = UserDefault.loadCart()
        print("existing cartList === \(cartList.count)")
        let item_Total = data.itemPrice * data.cartQuantity
        print("item_Total === \(item_Total)")
        //now fetch the cart model that is to be updated...
        let cartModel = Cart_Saved_DataModel(id: data.id, itemName: data.itemName, itemPrice: data.itemPrice, stockQuantity: data.stockQuantity, cartQuantity: data.cartQuantity, itemTotal: item_Total)
        //remove cart model that is to be updated...
        var filterItemList = cartList.filter({$0.id != data.id})
        UserDefault.saveToCart(list: filterItemList)
//        now append that updated model to the list
        filterItemList.append(cartModel)
        UserDefault.saveToCart(list: filterItemList)
        let updatedCartList = UserDefault.loadCart()
        print("new cart list === \(updatedCartList.count)")
        self.showToast(message: "Cart updated Successfully")
        self.fetchItemListing()
    }
}
