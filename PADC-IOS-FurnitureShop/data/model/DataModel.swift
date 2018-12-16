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
    
    private init() {}
    
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
    
    func getStores(success : @escaping ([StoreVO]) -> Void, failure : @escaping (String) -> Void) {
        
        NetworkManager.shared.getStoreList(success: { (data) in
            
            success(data)
            
        }) { (error) in
            failure(error)
        }
    }
}
