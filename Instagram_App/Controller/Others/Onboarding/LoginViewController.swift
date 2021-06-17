//
//  LoginViewController.swift
//  Instagram_App
//
//  Created by ZMQ MAC3 on 15/06/21.
//  Copyright © 2021 ZMQ MAC3. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {

    struct Constant {
        static let cornerRadius:CGFloat = 8.0
    }
    
    private let usernameTextField:UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Enail.."
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
    
    private let passwordTextField:UITextField = {
        
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
    
    private let loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constant.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let createAccoutButton:UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
    
    private let termsButton:UIButton = {
        let Tbutton = UIButton()
        Tbutton.setTitle("Terms of Services", for: .normal)
        Tbutton.setTitleColor(.secondaryLabel, for: .normal)
        return Tbutton
    }()
    
    private let servicesButton:UIButton = {
        let Sbutton = UIButton()
        Sbutton.setTitle("Privacy Policy", for: .normal)
        Sbutton.setTitleColor(.secondaryLabel, for: .normal)
        return Sbutton
    }()
    
    private let headerView:UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addTarget(self, action: #selector(didTaploginButton), for: .touchUpInside)
        
        createAccoutButton.addTarget(self, action: #selector(didTapcreateAccountButton), for: .touchUpInside)
        
        termsButton.addTarget(self, action: #selector(didTaptermsButton), for: .touchUpInside)
        
        servicesButton.addTarget(self, action: #selector(didTapServicesButton), for: .touchUpInside)
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        self.view.backgroundColor = .systemBackground
        
        self.addSubViews()
    }
    
    override func viewDidLayoutSubviews() {
        //assign Frames
        headerView.frame = CGRect(
            x:0,
            y: 0.0,
            width: view.width,
            height: view.height/3.0)
        
        usernameTextField.frame = CGRect(
            x:25,
            y: headerView.bottom + 40,
            width: view.width-50,
            height:52.0)
        
        passwordTextField.frame = CGRect(
            x:25,
            y: usernameTextField.bottom + 10,
            width: view.width-50,
            height:52.0)
        
        loginButton.frame = CGRect(
            x:25,
            y: passwordTextField.bottom + 10,
            width: view.width-50,
            height:52.0)
        
        createAccoutButton.frame = CGRect(
            x:25,
            y: loginButton.bottom + 10,
            width: view.width-50,
            height:52.0)
        
        termsButton.frame = CGRect(
            x:10,
            y: view.height-view.safeAreaInsets.bottom-100,
            width: view.width-50,
            height:52.0)
        
        servicesButton.frame = CGRect(
            x:10,
            y:view.height-view.safeAreaInsets.bottom-50,
            width: view.width-50,
            height:52.0)
        
        configureHeaderView()
    }
    
    private func configureHeaderView(){
        guard headerView.subviews.count == 1 else {
            return
        }
        guard let backgroundView = headerView.subviews.first else{
            return
        }
        backgroundView.frame = headerView.bounds
        
        let imageView = UIImageView(image: UIImage(named: "logo"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0, y: view.safeAreaInsets.top, width: headerView.width/2.0, height: headerView.height-view.safeAreaInsets.top)
        
    }
    
    private func addSubViews(){
        
        view.addSubview(headerView)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(servicesButton)
        view.addSubview(createAccoutButton)
        
    }
    
    @objc func didTaploginButton(){
        passwordTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        
        guard let usernameEmail = usernameTextField.text, !usernameEmail.isEmpty,let password = passwordTextField.text, !password.isEmpty,password.count>=8 else { return }
        
        //add login Functionality.
        print("didTaploginButton")
        
    }
    
    @objc func didTaptermsButton(){
         print("didTaptermsButton")
        guard  let url = URL(string: "https://www.instagram.com/about/legal/terms/before-january-19-2013/") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc func didTapServicesButton(){
          print("didTapServicesButton")
        guard  let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc func didTapcreateAccountButton(){
          print("didTapcreateAccountButton")
        let vc = RegistrationViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
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

extension LoginViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField == usernameTextField){
            passwordTextField.becomeFirstResponder()
        }else if(textField == passwordTextField){
            didTaploginButton()
        }
        return true
    }
    
}
