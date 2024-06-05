//
//  LoginTVCell.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import UIKit

class LoginTVCell: UITableViewCell {

    //MARK: - Outlet
    @IBOutlet weak var uvPassword: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var btnhideShowPassword: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    //MARK: -  Properties
    //textfield callbacks
    var onAddEmail:((_ email : String)->Void)?
    var onAddPassword:((_ password : String)->Void)?
    var hidePassword = true
    var onCLickLogin:(()-> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.uvPassword.layer.cornerRadius = 8.0
        self.uvPassword.layer.borderColor = UIColor.lightGray.cgColor
        self.uvPassword.layer.borderWidth = 0.5
        self.btnLogin.layer.cornerRadius = 8.0
        
        //delegates for textfields
        self.tfEmail.delegate = self
        self.tfPassword.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func btnLoginTap(_ sd : UIButton) {
        self.onCLickLogin?()
    }
    
    @IBAction func btnHideShowPassTap(_ sd : UIButton) {
        self.hidePassword = !self.hidePassword
        if self.hidePassword {
            self.btnhideShowPassword.setImage(UIImage(named: "hidePassword"), for: .normal)
            self.tfPassword.isSecureTextEntry = true
        }else{
            self.btnhideShowPassword.setImage(UIImage(named: "showPassword"), for: .normal)
            self.tfPassword.isSecureTextEntry = false
        }
    }
}

//MARK: - Textfield delegate funcs
extension LoginTVCell : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.tfEmail {
            self.onAddEmail?(self.tfEmail.text ?? "")
        }
        else if textField == self.tfPassword {
            self.onAddPassword?(self.tfPassword.text ?? "")
        }
    }
}
