//
//  Category.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Zin Lin Phyo on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CategoryVO {
    
    var id : String? = nil
    
    var name : String? = nil
    
    var image : String? = nil
    
    var products : [ProductVO] = []
    
    public static func parseToDictionary(category : CategoryVO) -> [String : Any] {
        
        let value = [
            "id" : category.id ?? "",
            "name" : category.name ?? "",
            "image" : category.image ?? "",
            ]
        
        return value
    }
    
    public static func parseToCategoryVO(json : [String : Any]) -> CategoryVO {
        
        var category = CategoryVO()
        category.id = json["id"] as? String
        category.name = json["name"] as? String
        category.image = json["image"] as? String
        
        return category
    }
}
