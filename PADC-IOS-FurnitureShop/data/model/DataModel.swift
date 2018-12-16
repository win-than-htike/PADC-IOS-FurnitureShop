//
//  DataModel.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Zin Lin Phyo on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class DataModel {
    
    let rootRef : DatabaseReference!
    
    private init() {
        rootRef = Database.database().reference()
    }
    
    static var shared : DataModel =  {
        return sharedDataModel
    }()
    
    private static var sharedDataModel: DataModel = {
        let dataModel = DataModel()
        return dataModel
    }()
    
    var user : UserVO? = nil
    
    func register(user : UserVO, success: @escaping () -> Void, failure: @escaping (String) -> Void) {
        
        Auth.auth().createUser(withEmail: user.email!, password: user.password!) { user, error in
            if error == nil {
                
                Auth.auth().signIn(withEmail: self.user!.email!,
                                   password: self.user!.password!)
            }else {
                failure("Error")
            }
        }
        
        let ref = Database.database().reference()
        ref.child("users").child(user.id).setValue(UserVO.parseToDictionary(user: user))
        success()
    }
    
    func login(email : String, password : String, success : @escaping () -> Void, failure : @escaping () -> Void) {
        
        NetworkManager.shared.login(email: email, password: password, success: { (user) in
            
            self.user = user
            success()
            
        }) {
            failure()
        }
    }
    
    func getStoresList(success : @escaping ([StoreVO]) -> Void, failure : @escaping (String) -> Void) {
        
        NetworkManager.shared.loadStoreList(success: { (data) in
            
            success(data)
            
        }) { (error) in
            failure(error)
        }
    }
    
    func getCategoryList(success : @escaping ([CategoryVO]) -> Void, failure : @escaping (String) -> Void) {
        
        rootRef.child("categories").observe(.value) { (dataSnapshot) in
            
            if let data = dataSnapshot.children.allObjects as? [DataSnapshot] {
                
                var categoryList: [CategoryVO] = []
                
                for category in data {
                    
                    if let value = category.value as? [String : AnyObject] {
                        
                        var categoryItem = CategoryVO()
                        categoryItem.id = value["id"] as? Int
                        categoryItem.name = value["name"] as? String
                        categoryItem.image = value["image"] as? String
                        
                        self.rootRef.child("categories").child(category.key).child("products").observe(.value) { (result) in
                            
                            if let products = result.children.allObjects as? [DataSnapshot] {
                                
                                for product in products
                                {
                                    if let p = product.value as? [String : AnyObject] {
                                        
                                        var productItem = ProductVO()
                                        productItem.id = p["id"] as? Int ?? 0
                                        productItem.name = p["name"] as? String ?? ""
                                        productItem.description = p["description"] as? String ?? ""
                                        productItem.price = p["price"] as? String ?? ""
                                        productItem.size = p["size"] as? String ?? ""
                                        productItem.status = p["status"] as? String ?? ""
                                        
                                        self.rootRef.child("categories").child(category.key).child(product.key).child("image").observe(.value) { (result) in
                                            
                                            if let images = result.children.allObjects as? [DataSnapshot] {
                                                
                                                var i = 0
                                                for (image) in images {
                                                    
                                                    if let img = image.value as? [String: Any] {
                                                        
                                                        let url = img["\(i)"] as? String ?? ""
                                                        productItem.images.append(url)
                                                    }
                                                    i += 1
                                                }
                                            }
                                            success(categoryList)
                                        }
                                        
                                        categoryItem.productsList.append(productItem)
                                        success(categoryList)
                                    }
                                }
                            } else {
                                print("Damn it!")
                            }
                            
                            categoryList.append(categoryItem)
                            success(categoryList)
                        }
                    }
                }
                
                
            } else {
                failure("Can't Load Data")
            }
        }
    }
    
    func uploadImage(data : Data?, success : @escaping (String) -> Void, failure : @escaping () -> Void) {
        
        NetworkManager.shared.imageUpload(data: data, success: { (url) in
            success(url)
        }) {
            failure()
        }
        
    }
}
