//
//  LandingViewController.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {

    @IBOutlet weak var cvProductListing: UICollectionView!
    var popularProducts: [(name: String,
                           description: String,
                           price: Double,
                           discount: Double,
                           status: String,
                           image: String)] = []

    var categoryList: [CategoryVO] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategory()

        self.cvProductListing.dataSource = self
        self.cvProductListing.delegate = self

        self.cellsRegister()
    }
    
    func loadCategory() {
        
        showLoadingIndicator()
        DataModel.shared.getCategoryList(success: { (data) in
            
            self.categoryList.removeAll()
            self.categoryList = data
            self.cvProductListing.reloadData()
            self.hideLoadingIndicator()
            
        }) { (error) in
            self.hideLoadingIndicator()
            self.showAlertDialog(message: error)
        }
    }

    private func cellsRegister() {
        CellRegisterUtil.cellRegister(nibName: "PopularProductCollectionViewCell", collectionView: self.cvProductListing)
        CellRegisterUtil.cellRegister(nibName: "ProductCategoryCollectionViewCell", collectionView: self.cvProductListing)
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if section == 0 {
            return 1
        } else {
            return categoryList.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0 {

            return collectionView.dequeueReusableCell(withReuseIdentifier: "PopularProductCollectionViewCell", for: indexPath) as! PopularProductCollectionViewCell

        } else {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCategoryCollectionViewCell", for: indexPath) as! ProductCategoryCollectionViewCell

            cell.imvProductCategory?.sd_setImage(with: URL(string: categoryList[indexPath.row].image ?? ""), completed: nil)
            cell.lblProductCategoryName.text = categoryList[indexPath.row].name

            return cell

        }
    }

}

extension HomeViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.section == 0 {
            return CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.35)
        } else {
            let width = collectionView.frame.width / 2 - 6
            let height = (collectionView.frame.width / 3)
            return CGSize(width: width, height: height)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {


        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "ProductListingViewController") as! UINavigationController
        self.present(navigationController, animated: true, completion: nil)

    }
}
