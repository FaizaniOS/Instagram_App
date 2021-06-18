//
//  DatabaseManager.swift
//  Instagram_App
//
//  Created by ZMQ MAC3 on 16/06/21.
//  Copyright © 2021 ZMQ MAC3. All rights reserved.
//

import Foundation
import Firebase

public class DatabaseManager{
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    //MARK:- Public
    ///Check if Username and Email is avalable
    ///- Parameters
    ///    -email:String representing email
    ///    -username:String representing username
    
    public func canCreateNewUser(with email:String,username:String,completion:(Bool)->Void){
        print("canCreateNewUser:- \(username), \(email)")
        completion(true)
    }
    
    public func insertNewUser(with email:String,username:String,completion:@escaping (Bool)->Void){
        database.child(email.safeDatabaseKey()).setValue(["username":username]) { (error, _) in
            if(error == nil){
                //succeeded
                completion(true)
                return
            }else{
                //Failed
               completion(false)
                return
            }
        }
    }
    
}
