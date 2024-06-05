//
//  HelperClass.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 04/06/2024.
//

import Foundation
import UIKit
//enum cases
enum UpdateResponse {
    case success
    case noData
}
enum AddEditItemCase {
    case addItem
    case editItem
}
//ViewController helping class
extension UIViewController {

    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showToast(message: String, duration: Double = 2.0) {
        // Create a label
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textColor = .white
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.systemFont(ofSize: 14.0)
        toastLabel.numberOfLines = 0
        
        // Set the label size and position
        let textSize = toastLabel.intrinsicContentSize
        let labelWidth = min(textSize.width + 20, self.view.frame.width - 40)
        let labelHeight = textSize.height + 10
        let x = (self.view.frame.width - labelWidth) / 2
        let y = self.view.frame.height - 100
        toastLabel.frame = CGRect(x: x, y: y, width: labelWidth, height: labelHeight)
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        // Add the label to the view
        self.view.addSubview(toastLabel)
        
        // Animate the label
        UIView.animate(withDuration: 0.5, delay: duration, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { (isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
