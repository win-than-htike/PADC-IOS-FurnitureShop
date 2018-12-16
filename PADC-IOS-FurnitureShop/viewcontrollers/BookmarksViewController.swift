//
//  BookmarksViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class BookmarksViewController: UIViewController {

    @IBOutlet weak var cvBookmarkedPrdoucts: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.cvBookmarkedPrdoucts.delegate = self
        self.cvBookmarkedPrdoucts.dataSource = self
        self.cellRegister()
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

    private func cellRegister() {
        CellRegisterUtil.cellRegister(nibName: "ProductCollectionViewCell",
                                      collectionView: self.cvBookmarkedPrdoucts)
    }
}

extension BookmarksViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell


        return cell
    }

}

extension BookmarksViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width / 2 - 6
        let height = (collectionView.frame.width / 3) * 2
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as! UINavigationController
        self.present(navigationController, animated: true, completion: nil)
    }
}
