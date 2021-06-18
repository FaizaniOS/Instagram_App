//
//  AuthManager.swift
//  Instagram_App
//
//  Created by ZMQ MAC3 on 16/06/21.
//  Copyright © 2021 ZMQ MAC3. All rights reserved.
//

import Foundation
import Firebase

public class AuthManager{
    
    static let shared = AuthManager()
    
    public func registerNewUser(username:String,email:String,password:String,completion:@escaping (Bool)->Void){
        /*
         Check if username available
         Check if email available
         */
     print("Control comes inside \(registerNewUser), \(username),\(email),\(password)")
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { (canCreate) in
            print("Control comes inside  canCreateNewUser \(canCreate)")
            if(canCreate){
                /*
                 Create account
                 Insert account into Database
                 */
                 print("Control comes inside \(canCreate)")
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else{
                        //Firebase auth could not create account
                    print("error inserted:- \(error), result:- \(result)")
                        completion(false)
                        return
                    }
                    //Insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { (inserted) in
                        if(inserted){
                            print("inserted:- \(inserted)")
                            completion(true)
                            return
                        }else{
                            completion(false)
                            return
                        }
                    }
                }
            }else{
                // either username or email does not exist
                completion(false)
            }
        }
    }
    
    public func loginUser(email:String?,username:String?,password:String, completion: @escaping (Bool)->Void){
        if let email = email{
            //email log in
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil,error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }
        }else if let username = username {
           //username log in
            print(username)
        }
        
    }
    
    public func logOut(completion:(Bool)->Void){
        do{
            try Auth.auth().signOut()
            completion(true)
            return
        }catch{
            print(error)
            completion(false)
            return
        }
    }
}

