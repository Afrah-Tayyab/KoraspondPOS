//
//  SignUpTVCell.swift
//  KoraspondAssignment
//
//  Created by Cartlow on 05/06/2024.
//

import UIKit

class SignUpTVCell: UITableViewCell {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var uvPassword: UIView!
    @IBOutlet weak var btnhideShowPassword: UIButton!
    @IBOutlet weak var btnSignup: UIButton!
    
    //MARK: -  Properties
    //textfield callbacks
    var onAddEmail:((_ email : String)->Void)?
    var onAddPassword:((_ password : String)->Void)?
    var onAddUserName:((_ userName : String)->Void)?
    var onAddFirstName:((_ firstName : String)->Void)?
    var onAddLastName:((_ lastName : String)->Void)?
    
    var hidePassword = true
    var onClickSignup:(()-> Void)?
    var onClickLogin:(()-> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tfEmail.delegate = self
        self.tfUserName.delegate = self
        self.tfFirstName.delegate = self
        self.tfLastName.delegate = self
        self.tfPassword.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func btnSignUpTap(_ sd : UIButton) {
        self.onClickSignup?()
    }
    @IBAction func btnLoginTap(_ sd : UIButton) {
        self.onClickLogin?()
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
extension SignUpTVCell : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.tfEmail {
            self.onAddEmail?(self.tfEmail.text ?? "")
        }
        else if textField == self.tfPassword {
            self.onAddPassword?(self.tfPassword.text ?? "")
        }
        else if textField == self.tfUserName {
            self.onAddUserName?(self.tfUserName.text ?? "")
        }
        else if textField == self.tfFirstName {
            self.onAddFirstName?(self.tfFirstName.text ?? "")
        }
        else if textField == self.tfLastName {
            self.onAddLastName?(self.tfLastName.text ?? "")
        }
    }
}
