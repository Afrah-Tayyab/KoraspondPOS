//
//  BaseViewController.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 04/06/2024.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func showAlert(title : String, message : String, btnOne : String, btnTwo : String){
            // create the alert
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

            // show the alert
            self.present(alert, animated: true, completion: nil)
        }

}
