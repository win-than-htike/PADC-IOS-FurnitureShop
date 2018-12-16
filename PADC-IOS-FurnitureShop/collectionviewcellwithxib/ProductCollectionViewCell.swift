//
//  ProductCollectionViewCell.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

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
}
