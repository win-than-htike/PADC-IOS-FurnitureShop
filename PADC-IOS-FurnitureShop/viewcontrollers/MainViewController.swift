//
//  ViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Win Than Htike on 12/2/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import MBProgressHUD

class MainViewController: UIViewController {

    @IBOutlet weak var btnSignUp: ButtonWithCorner!
    @IBOutlet weak var tfEmail: ShadowTextField!
    @IBOutlet weak var tfPassword: ShadowTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToSignUp(_ sender: Any) {

        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! UINavigationController
        self.present(navigationController, animated: true, completion: nil)
    }

    @IBAction func doSignIn(_ sender: Any) {
        
        if !tfEmail.text!.isEmpty && !tfPassword.text!.isEmpty {
            
            showLoadingIndicator()

            DataModel.shared.login(email: tfEmail.text!, password: tfPassword.text!, success: {
                self.goToHome()
            }) {
                self.showAlertDialog(message: "Email or Password incorrect.")
            }
        }
        else {
            self.showAlertDialog(message: "Please fill email and password.")
        }
    }
    
    func goToHome() {
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        self.present(navigationController, animated: true, completion: nil)
    }
}

