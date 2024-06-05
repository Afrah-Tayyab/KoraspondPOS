//
//  CheckoutTVExt.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import Foundation
import UIKit
//MARK: - TableView Delegates and Datasources
extension CheckoutVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.checkoutViewModel.checkoutItemListing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutTVCell", for: indexPath) as! CheckoutTVCell
        let data = self.checkoutViewModel.checkoutItemListing[indexPath.row]
        cell.setupCheckoutData(cartData: data)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
}
