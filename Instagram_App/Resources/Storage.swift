//
//  Storage.swift
//  Instagram_App
//
//  Created by ZMQ MAC3 on 16/06/21.
//  Copyright © 2021 ZMQ MAC3. All rights reserved.
//

import Foundation

import FirebaseStorage

public class StorageManager{
    
    static let shared = StorageManager()
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageMannageError:Error {
        case failedToDownload
    }
    
    //MARK:-Public
    public func uploadUserPost(model:UserPost,completion:@escaping
        (Result<URL,Error>)->Void){
    }
    
   func downloadImage(with reference:String,completion:@escaping(Result<URL,IGStorageMannageError>)->Void){
        bucket.child(reference).downloadURL { (url, error) in
            
            guard let url = url,error == nil else{
                completion(.failure(.failedToDownload))
                return
            }
            
             completion(.success(url))
         }
       }
    
}
public enum UserPostType {
    case photo,video
}
public struct UserPost{
    
}
