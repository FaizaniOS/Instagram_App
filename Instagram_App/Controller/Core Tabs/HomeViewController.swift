//
//  ViewController.swift
//  Instagram_App
//
//  Created by ZMQ MAC3 on 15/06/21.
//  Copyright © 2021 ZMQ MAC3. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.UserAuthenticate_Handle()
        
    }
    
    private func UserAuthenticate_Handle(){
        if(Auth.auth().currentUser == nil){
           let loginVc = LoginViewController()
            loginVc.modalPresentationStyle = .fullScreen
            present(loginVc,animated: false)
        }
    }

}

