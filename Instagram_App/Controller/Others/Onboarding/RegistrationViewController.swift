//
//  RegistrationViewController.swift
//  Instagram_App
//
//  Created by ZMQ MAC3 on 15/06/21.
//  Copyright © 2021 ZMQ MAC3. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class RegistrationViewController: UIViewController {
    
    private let usernameField:UITextField = {
           let field = UITextField()
           field.placeholder = "Username"
           field.returnKeyType = .next
           field.leftViewMode = .always
           field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
           field.autocapitalizationType = .none
           field.autocorrectionType = .no
           field.layer.masksToBounds = true
           field.layer.cornerRadius = Constant.cornerRadius
           field.backgroundColor = .secondarySystemBackground
           field.layer.borderWidth = 1.0
           field.layer.borderColor = UIColor.secondaryLabel.cgColor
           return field
       }()
    
       private let emailField:UITextField = {
           let field = UITextField()
           field.placeholder = "Email Address"
           field.returnKeyType = .next
           field.leftViewMode = .always
           field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
           field.autocapitalizationType = .none
           field.autocorrectionType = .no
           field.layer.masksToBounds = true
           field.layer.cornerRadius = Constant.cornerRadius
           field.backgroundColor = .secondarySystemBackground
           field.layer.borderWidth = 1.0
           field.layer.borderColor = UIColor.secondaryLabel.cgColor
           return field
       }()
    
       private let passwordField:UITextField = {
           let field = UITextField()
           field.isSecureTextEntry = true
           field.placeholder = "Password.."
           field.returnKeyType = .continue
           field.leftViewMode = .always
           field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
           field.autocapitalizationType = .none
           field.autocorrectionType = .no
           field.layer.masksToBounds = true
           field.layer.cornerRadius = Constant.cornerRadius
           field.backgroundColor = .secondarySystemBackground
           field.layer.borderWidth = 1.0
           field.layer.borderColor = UIColor.secondaryLabel.cgColor
           return field
           
       }()
       
       private let registerButton:UIButton = {
           let button = UIButton()
           button.setTitle("Sign Up", for: .normal)
           button.layer.masksToBounds = true
           button.layer.cornerRadius = Constant.cornerRadius
        button.backgroundColor = .green
           button.setTitleColor(.white, for: .normal)
           return button
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
        
        self.view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top+100, width: view.width-40, height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom+10, width: view.width-40, height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom+10, width: view.width-40, height: 52)
        registerButton.frame = CGRect(x: 20, y: passwordField.bottom+10, width: view.width-40, height: 52)
    }

    @objc private func didTapRegister(){
        print("didTapRegister press");
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty, let username = usernameField.text,!username.isEmpty, let password = passwordField.text, !password.isEmpty, password.count>=8 else{return}
        
        print("\(email) \(username) \(password)")
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) { (registered) in
            if(registered){
               // completion(true)
               // return
                print("registered called inside")
            }else{
               // completion(false)
               // return
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

@available(iOS 13.0, *)
extension RegistrationViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == usernameField){
            emailField.becomeFirstResponder()
        }else if(textField == emailField){
            passwordField.becomeFirstResponder()
        }else{
            didTapRegister()
        }
        return true
    }
    
}
