//
//  StoreCollectionViewCell.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imvStore: UIImageView!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblStoreAddress: UILabel!
    @IBOutlet weak var lblStorePhoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
