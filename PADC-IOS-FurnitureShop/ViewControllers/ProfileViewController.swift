//
//  ProfileViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imvProfile: UIImageView!
    @IBOutlet weak var cvOrders: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        ImageRoundUtil.round(image: imvProfile)
    }

    @IBAction func onClickEditProfile(_ sender: Any) {

    }

    @IBAction func onClickLogout(_ sender: Any) {

        let dialogMessage = UIAlertController(title: "Logout",
                                              message: "Are you sure you want to logout?",
                                              preferredStyle: .alert)

        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            self.doLogout()
        })

        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })

        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)

        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil)
    }

    private func doLogout() {

    }

}
