//
//  SignUpViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var imvProfilePhoto: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        ImageRoundUtil.round(image: imvProfilePhoto)
    }


    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
