//
//  ViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Win Than Htike on 12/2/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var btnSignUp: ButtonWithCorner!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func goToSignUp(_ sender: Any) {

        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! UINavigationController
        self.present(navigationController, animated: true, completion: nil)
    }

    @IBAction func doSignIn(_ sender: Any) {
        
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        self.present(navigationController, animated: true, completion: nil)
    }
}

