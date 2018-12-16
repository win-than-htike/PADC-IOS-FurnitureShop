//
//  ProductCategoryCollectionViewCell.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class PopularProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblViewMorePopularProducts: UILabel!
    @IBOutlet weak var cvPopularProduct: UICollectionView!

    var popularProduct: [(image: String,
                          name: String,
                          description: String,
                          price: Double,
                          discount: Double,
                          status: String,
                          manufacturer: String)] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellRegister()
        self.cvPopularProduct.delegate = self
        self.cvPopularProduct.dataSource = self

        let tap = UITapGestureRecognizer(target: self, action: #selector(goToProductListing))
        lblViewMorePopularProducts.isUserInteractionEnabled = true
        lblViewMorePopularProducts.addGestureRecognizer(tap)
    }

    private func cellRegister() {
        CellRegisterUtil.cellRegister(nibName: "ProductCollectionViewCell", collectionView: self.cvPopularProduct)
    }

    @objc func goToProductListing(sender: UITapGestureRecognizer) {

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyBoard.instantiateViewController(withIdentifier: "ProductListingViewController") as! UINavigationController

        //let vc = navigationController.topViewController as! ProductListingViewController

        //Pass argument

        self.window?.rootViewController?.present(navigationController, animated: true, completion: nil)
    }
}

extension PopularProductCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
    }
}

extension PopularProductCollectionViewCell: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: UIScreen.main.bounds.width / 3, height: 300)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyBoard.instantiateViewController(withIdentifier: "ProductDetailViewController") as! UINavigationController

        //let vc = navigationController.topViewController as! ProductDetailViewController


        self.window?.rootViewController?.present(navigationController, animated: true, completion: nil)
    }
}

