//
//  StoresListingViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class StoresListingViewController: UIViewController {

    @IBOutlet weak var cvStoresListing: UICollectionView!

    var storesListing: [(storeImage: String,
                         name: String,
                         address: String,
                         phoneNumber: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setDummyData()

        self.cvStoresListing.delegate = self
        self.cvStoresListing.dataSource = self
        self.cellRegister()
    }

    private func cellRegister() {
        CellRegisterUtil.cellRegister(nibName: "StoreCollectionViewCell",
                                      collectionView: self.cvStoresListing)
    }

    private func setDummyData() {
        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
    }

}


extension StoresListingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storesListing.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCollectionViewCell", for: indexPath) as! StoreCollectionViewCell

        cell.imvStore.image = UIImage(named: storesListing[indexPath.row].storeImage)
        cell.lblStoreName.text = storesListing[indexPath.row].name
        cell.lblStoreAddress.text = storesListing[indexPath.row].address
        cell.lblStorePhoneNumber.text = storesListing[indexPath.row].phoneNumber

        return cell
    }

}

extension StoresListingViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width / 2 - 6
        let height = (collectionView.frame.width / 3) * 2
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let dialogMessage = UIAlertController(title: "Call",
                                              message: "\(storesListing[indexPath.row].phoneNumber)",
                                              preferredStyle: .alert)

        // Create OK button with action handler
        let ok = UIAlertAction(title: "Call", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            self.phoneCall(phoneNumber: self.storesListing[indexPath.row].phoneNumber)
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

    private func phoneCall(phoneNumber: String) {

    }
}
