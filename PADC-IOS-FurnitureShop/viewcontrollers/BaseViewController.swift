//
//  BaseViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Zin Lin Phyo on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public func showAlertDialog(title: String = "Message", message: String, alertActionTitle: String = "OK!") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: alertActionTitle, style: UIAlertAction.Style.default)
        {
            (UIAlertAction) -> Void in
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
        {
            () -> Void in
        }
    }
}
