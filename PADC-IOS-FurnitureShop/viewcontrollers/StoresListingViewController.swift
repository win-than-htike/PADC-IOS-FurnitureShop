//
//  StoresListingViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage

class StoresListingViewController: UIViewController {
    
    @IBOutlet weak var cvStoresListing: UICollectionView!
    
    var storesListing: [StoreVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.stetDummyData()
        
        self.cvStoresListing.delegate = self
        self.cvStoresListing.dataSource = self
        self.cellRegister()
        
        getStoreList()
    }
    
    private func cellRegister() {
        CellRegisterUtil.cellRegister(nibName: "StoreCollectionViewCell",
                                      collectionView: self.cvStoresListing)
    }
    
    private func stetDummyData() {
        //        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        //        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        //        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        //        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        //        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        //        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        //        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
        //        storesListing.append((storeImage: "dummy_store.png", name: "Store 1", address: "Pazadaung", phoneNumber: "09 1247989241"))
    }
    
    func getStoreList() {
        
        showLoadingIndicator()
        
        DataModel.shared.getStores(success: { (data) in
            
            self.storesListing.removeAll()
            
            for store in data {
                self.storesListing.append(store)
            }
            
            self.cvStoresListing.reloadData()
            self.hideLoadingIndicator()
            
        }) { (error) in
            
            print(error)
        }
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
        
        cell.imvStore?.sd_setImage(with: URL(string: storesListing[indexPath.row].image ?? ""), completed: nil)
        cell.lblStoreName.text = storesListing[indexPath.row].name
        cell.lblStoreAddress.text = storesListing[indexPath.row].address
        cell.lblStorePhoneNumber.text = storesListing[indexPath.row].phone
        
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
                                              message: "\(storesListing[indexPath.row].phone ?? "")",
            preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "Call", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            self.phoneCall(phoneNumber: self.storesListing[indexPath.row].phone ?? "")
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
