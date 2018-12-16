//
//  StoreVO.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Zin Lin Phyo on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation

struct StoreVO {
    
    var id : String? = nil
    
    var name : String? = nil
    
    var address : String? = nil
    
    var phone : String? = nil
    
    var image : String? = nil
    
    public static func parseToDictionary(store : StoreVO) -> [String : Any] {
        
        let value = [
            "id" : store.id ?? "",
            "name" : store.name ?? "",
            "address" : store.address ?? "",
            "phone" : store.phone ?? "",
            "image" : store.image ?? "",
        ]
        
        return value
    }
    
    public static func parseToStoreVO(json : [String : Any]) -> StoreVO {
        
        var store = StoreVO()
        store.id = json["id"] as? String
        store.name = json["name"] as? String
        store.address = json["address"] as? String
        store.phone = json["phone"] as? String
        store.image = json["image"] as? String
        return store
    }
    
}
