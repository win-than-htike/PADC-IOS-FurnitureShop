//
//  ProductCollectionViewCell.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage
class ProductCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var imvProduct: UIImageView!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var btnBookmark: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblManufacture: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindData(data: ProductVO) {
        if data.images.count > 0 {
            imvProduct.sd_setImage(with: URL(string: data.images[0]), completed: nil)
        }
        
        lblStatus.text = data.status
        lblName.text = data.name
        lblDescription.text = data.description
        lblPrice.text = "\(String(describing: data.price))$"
        lblDiscount.text = "10%"
        lblManufacture.text = "Sweety Home"
    }
}
