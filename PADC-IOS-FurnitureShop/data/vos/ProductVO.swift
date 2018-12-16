//
//  ProductVO.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Zin Lin Phyo on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ProductVO {
    
    var id : Int? = nil
    
    var name : String? = nil
    
    var images : [String] = []
    
    var imagesJson : [String: Any] = [:]
    
    var description : String? = nil
    
    var price : String? = nil
    
    var size : String? = nil
    
    var status : String? = nil
    
    public static func parseToDictionary(product : ProductVO) -> [String : Any] {
        
        let value = [
            "id" : product.id ?? "",
            "name" : product.name ?? "",
            "image" : product.images,
            "description" : product.description ?? "",
            "price" : product.price ?? "",
            "size" : product.size ?? "",
            "status" : product.status ?? ""
            ] as [String : Any]
        
        return value
    }
    
    public static func parseToProductVO(json : [String: AnyObject]) -> ProductVO {
        
        var product = ProductVO()
        product.id = json["id"] as? Int
        product.name = json["name"] as? String
        product.imagesJson = json["image"] as? [String: Any] ?? [:]
        product.description = json["description"] as? String
        product.price = json["price"] as? String
        product.size = json["size"] as? String
        product.status = json["status"] as? String
        
        product.images.removeAll()
        for (image) in product.imagesJson {
            product.images.append(image.value as? String ?? "")
        }
        
        return product
    }
}
