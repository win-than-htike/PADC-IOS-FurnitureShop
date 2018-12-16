//
//  NetworkManager.swift
//  PADC-IOS-FurnitureShop
//
//  Created by Zin Lin Phyo on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage
import SwiftyJSON

class NetworkManager {
    
    let rootRef : DatabaseReference!
    
    let storageRef = Storage.storage().reference().child("images")
    
    private init() {
        rootRef = Database.database().reference()
    }
    
    static var shared : NetworkManager =  {
        return sharedNetworkManager
    }()
    
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager()
        return networkManager
    }()
    
    func login(email : String, password : String, success : @escaping (UserVO) -> Void, failure : @escaping () -> Void) {
        
        rootRef.child("users").observe(.value) { (dataSnapshot) in
            
            if let users = dataSnapshot.children.allObjects as? [DataSnapshot] {
                
                for user in users {
                    
                    if let value = user.value as? [String : AnyObject] {
                        
                        let userVO = UserVO.parseToUserVO(json: value)
                        
                        print("\(userVO.email ?? "") and \(userVO.password ?? "Default")")
                        print("\(email) and \(password)")
                        
                        if email == userVO.email ?? "" && password == userVO.password ?? "" {
                            success(userVO)
                            return
                        } else {
                            
                        }
                        
                    } else {
                        failure()
                    }
                    
                }
                
                failure()
                
            }
            
        }
        
    }
    
    func imageUpload(data : Data?, success : @escaping (String) -> Void, failure : @escaping () -> Void) {
        
        if let imageData = data {
            
            let uploadImageRef = storageRef.child("\(Date().millisecondsSince1970).png")
            
            let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
                
                print(metadata ?? "NO METADATA")
                print(error ?? "NO ERROR")
                
                uploadImageRef.downloadURL(completion: { (url, error) in
                    
                    if let error = error {
                        print(error)
                    }
                    
                    if let url = url {
                        print(url.absoluteString)
                        success(url.absoluteString)
                    } else {
                        failure()
                    }
                    
                })
                
            }
            
            uploadTask.observe(.progress) { (snapshot) in
                print(snapshot.progress ?? "NO MORE PROGRESS")
            }
            
            uploadTask.resume()
            
        }
        
    }
    
    func getStoreList(success : @escaping ([StoreVO]) -> Void, failure : @escaping (String) -> Void) {
        
        rootRef.child("stores").observe(.value) { (dataSnapshot) in
            
            if let stores = dataSnapshot.children.allObjects as? [DataSnapshot] {
                
                var storeList: [StoreVO] = []
                
                for store in stores {
                    
                    if let value = store.value as? [String : AnyObject] {
                        
                        storeList.append(StoreVO.parseToStoreVO(json: value))
                    }
                }
                
                success(storeList)
            }
        }
    }
    
}
