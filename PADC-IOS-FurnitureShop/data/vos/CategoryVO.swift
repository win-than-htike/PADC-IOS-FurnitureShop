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
    
    var id : Int? = nil
    
    var name : String? = nil
    
    var image : String? = nil
    
    var productsJson : [String: Any] = [:]
    
    var productsList : [ProductVO] = []
    
    public static func parseToDictionary(category : CategoryVO) -> [String : Any] {
        
        let value = [
            "id" : category.id ?? "",
            "name" : category.name ?? "",
            "image" : category.image ?? "",
            ] as [String : Any]
        
        return value
    }
    
    public static func parseToCategoryVO(json : [String : AnyObject]) -> CategoryVO {
        
        var category = CategoryVO()
        category.id = json["id"] as? Int
        category.name = json["name"] as? String
        category.image = json["image"] as? String
        category.productsJson = json["products"] as? [String: AnyObject] ?? [:]
        
        category.productsList.removeAll()
        for item in category.productsJson {
            category.productsList.append(ProductVO.parseToProductVO(json: item.value as? [String : AnyObject] ?? [:]))
        }
        
        return category
    }
}
