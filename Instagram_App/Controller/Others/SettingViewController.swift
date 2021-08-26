//
//  SettingViewController.swift
//  Instagram_App
//
//  Created by ZMQ MAC3 on 15/06/21.
//  Copyright © 2021 ZMQ MAC3. All rights reserved.
//

import UIKit
import SafariServices

struct SettingCellModel {
    let title:String
    let handler:(()->Void)
}
///View Controller to show user settings
@available(iOS 13.0, *)
final class SettingViewController: UIViewController {
    
    private let tableView:UITableView = {
        let tableView = UITableView(frame:.zero,style:.grouped)
        tableView.register(UITableViewCell.self,forCellReuseIdentifier:"cell")
        
        return tableView
    }()
    
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels(){
        //let section =
        data.append(
            [SettingCellModel(title: "Edit Profile"){
                [weak self] in
                self?.didTapEditProfle()
                },
             SettingCellModel(title: "Invite Friends"){
                [weak self] in
                self?.didTapInviteFriends()
                },
             SettingCellModel(title: "Save Original Posts"){
                [weak self] in
                self?.didTapSaveOriginalPosts()
                }
        ])
        
        
        data.append(
            [SettingCellModel(title: "Terms of Services"){[weak self] in
                self?.openeUrl(type:.terms)
                },
             SettingCellModel(title: "Privacy Policy"){[weak self] in
                self?.openeUrl(type:.privacy)
                },
             SettingCellModel(title: "Help / FeedBack"){[weak self]in
                self?.openeUrl(type:.help)
                }
        ])
        
        data.append([SettingCellModel(title: "Log Out"){[weak self ] in
            self?.didTapLogOut()
            }
        ])
        
    }
    enum SettingUrltype {
        case terms,privacy,help
    }
    
    private func openeUrl(type:SettingUrltype){
        let urlString:String
        
        switch type {
        case .terms:
            urlString = "https://www.instagram.com/about/legal/terms/before-january-19-2013/"
        case .privacy:
            urlString = "https://help.instagram.com/519522125107875"
        case .help:
            urlString = "https://help.instagram.com/"
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc,animated: true)
        
    }
    
    private func didTapEditProfle(){
        let vc = EditProfileViewController()
        vc.title = "Edit profile"
        let newVC = UINavigationController(rootViewController: vc)
        newVC.modalPresentationStyle = .fullScreen
        present(newVC,animated: true)
    }
    
    private func didTapInviteFriends(){
        
    }
    
    private func didTapSaveOriginalPosts(){
        
    }
    
    private func didTapLogOut(){
        
        let actionSheet = UIAlertController(title: "Log Out",
                                            message: "Are You sure you want to log out",
                                            preferredStyle:.actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out",
                                            style: .destructive,
                                            handler: { _ in
            DispatchQueue.main.async {
                AuthManager.shared.logOut { (Success) in
                    DispatchQueue.main.async {
                        if(Success){
                            // present log in
                            let loginVc = LoginViewController()
                            loginVc.modalPresentationStyle = .fullScreen
                            self.present(loginVc,animated: true){
                                self.tabBarController?.selectedIndex = 0
                                self.navigationController?.popToRootViewController(animated: false)
                               
                            }
                        }else{
                            //error occured.
                            fatalError("Could not user logout")
                        }
                    }
                    
                }
            }
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        present(actionSheet,animated:true)
        
    }
    
}
@available(iOS 13.0, *)
extension SettingViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.section][indexPath.row]
        model.handler()
    }
    
}
