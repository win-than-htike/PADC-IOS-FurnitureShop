//
//  CellRegisterUtils.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Elissa Software on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//
import Foundation
import UIKit

class CellRegisterUtil {
    
    static func cellRegister(nibName : String, collectionView : UICollectionView){
        collectionView.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
}
