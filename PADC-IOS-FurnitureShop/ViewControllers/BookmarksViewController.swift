//
//  BookmarksViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class BookmarksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onClickDeleteBookmarks(_ sender: Any) {

        let dialogMessage = UIAlertController(title: "Confirm",
                                              message: "Are you sure you want to delete all bookmarks?",
                                              preferredStyle: .alert)

        // Create OK button with action handler
        let ok = UIAlertAction(title: "Delete", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            self.deleteRecord()
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

    func deleteRecord() {
        print("Deleting bookmarks now")
    }
}
