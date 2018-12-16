//
//  ProductListingViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class ProductListingViewController: UIViewController {

    @IBOutlet weak var cvProductListing: UICollectionView!
    
    var category : CategoryVO? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = category?.name

        self.cvProductListing.delegate = self
        self.cvProductListing.dataSource = self
        self.cellRegister()
    }

    private func cellRegister() {
        CellRegisterUtil.cellRegister(nibName: "ProductCollectionViewCell",
                                      collectionView: self.cvProductListing)
    }
    @IBAction func onGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ProductListingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.productsList.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        cell.bindData(data: category?.productsList[indexPath.row] ?? ProductVO())
        return cell
    }

}

extension ProductListingViewController: UICollectionViewDelegate {

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
