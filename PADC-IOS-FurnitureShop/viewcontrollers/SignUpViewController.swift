//
//  SignUpViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import MBProgressHUD

class SignUpViewController: UIViewController {

    @IBOutlet weak var tfFullName: ShadowTextField!
    @IBOutlet weak var imvProfilePhoto: UIImageView!
    @IBOutlet weak var tfEmail: ShadowTextField!
    @IBOutlet weak var tfPassword: ShadowTextField!
    @IBOutlet weak var tfRetypePassword: ShadowTextField!
    @IBOutlet weak var btnSingUp: ButtonWithCorner!

    override func viewDidLoad() {
        super.viewDidLoad()

        ImageRoundUtil.round(image: imvProfilePhoto)
    }

    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onTapBtnSignUp(_ sender: Any) {

        if tfPassword.text!.isEmpty {
            showAlertDialog(message: "Password is Empty!")
            return
        }

        if tfRetypePassword.text!.isEmpty {
            showAlertDialog(message: "Confirm Password is Empty!")
            return
        }

        if tfPassword.text! == tfRetypePassword.text! {

            showLoadingIndicator()

            let user = UserVO()
            user.username = tfFullName.text!
            user.email = tfEmail.text!
            user.password = tfPassword.text!
            user.confirmPassword = tfRetypePassword.text!

            DataModel.shared.register(user: user, success: {
                print("signup success")
                self.hideLoadingIndicator()

                let alert = UIAlertController(title: "Success", message: "Register Complete.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
                
            }) { (error) in
                print(error)
            }

        }
        else {
            showAlertDialog(message: "Password not match!")
        }
    }
}
