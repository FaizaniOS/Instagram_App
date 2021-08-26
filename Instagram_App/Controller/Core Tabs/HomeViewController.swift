//
//  ViewController.swift
//  Instagram_App
//
//  Created by ZMQ MAC3 on 15/06/21.
//  Copyright © 2021 ZMQ MAC3. All rights reserved.
//

import UIKit
import Firebase

@available(iOS 13.0, *)

class HomeViewController: UIViewController {

    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.identifier)
        return tableView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        let numbers = [1,2,3,4,5,6,7,8,9,10]
        numbers.map{$0*2}.filter {$0/5<20
        }.prefix(3)
        
        /*print( numbers.map{$0*2}.filter{$0 / 5 < 20}.prefix(3).reduce(1){ acc,value in acc+value
           print("acc:- \(acc) // value:-\(value)")
            return acc+value
            }.sink{ (receiveValue) in
                print(receiveValue)
                return  receiveValue
            })*/
        
        print(numbers.reduce(1){ acc,value in acc+value
           print("acc:- \(acc) // value:-\(value)")
            return acc+value
        })
             
        let list = [92,2,7,129,20,40,17]
        var x = 0
        
        for y in list{
            print("y is :- \(y)")
            x = y > x ? y : x
            print("x is :- \(x)")
        }
        
        print("x is :- \(x)") // 129
        RemoveDuplicay()
        
    }
    
    func RemoveDuplicay (){

        let array: [Int] = [0,0,1,1,1,2,2,2,3,3,4,5,6,7,7]
        print("array:-  \(array)")
        let set: Set<Int> = [0,0,1,1,1,2,2,2,3,3,4,5,6,7,7]
        print("set:-  \(set.sorted())")
        
        var num = [0,0,1,1,1,2] //[0,0,1,1,1,2,2,2,3,3,4,5,6,7,7]
        var tempNum = [String]()
        var count = 0
        
        for i in 0..<num.count{
            print("iii:-  \(i)")
            for j in 0..<num.count{
                print("jj is:- \(j)")
                if(num[i] == num[j]){
                    print(" condition true Countttt")
                    count += 1
                }
            }
            count = 0;
        }
        
        /*for i in 0..<num.count-1{
//            if (num[i] != num[i+1]) {
//                tempNum.append(String(num[i]))
//            }
             print(i)
             if(num[i] == num[i+1]){
                print(num[i])
                tempNum.append(String(num[i]))
                tempNum.append("_")
             }
            
        }*/
        
        /*for i in 0..<num.count{
                print("i is:- \(i)")
            for j in i+1..<num.count{
                //var ajj = j+i
                print("j is:- \(j)")
                if(num[i] == num[j]){
                    print("num i:- \(num[i]),,,  num j:- \(num[j])")
                    tempNum.append(String(num[i]))
                    tempNum.append("_")
                   
                }
                
                
            }
        }*/
        print("temp Num:- \(tempNum)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    override func viewDidAppear(_ animated: Bool) {
        // self.UserAuthenticate_Handle()
    }
    
    
    private func UserAuthenticate_Handle(){
         if(Auth.auth().currentUser == nil){
            let loginVc = LoginViewController()
            loginVc.modalPresentationStyle = .fullScreen
            present(loginVc,animated: false)
        }
        
        // let loginVc = LoginViewController()
        // loginVc.modalPresentationStyle = .fullScreen
        // present(loginVc,animated: false)
        
    }
}

@available(iOS 13.0, *)
extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:IGFeedPostTableViewCell.identifier, for: indexPath) as! IGFeedPostTableViewCell

        return cell
    }
    
}
