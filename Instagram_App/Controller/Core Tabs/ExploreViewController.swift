//
//  ExploreViewController.swift
//  Instagram_App
//
//  Created by ZMQ MAC3 on 15/06/21.
//  Copyright © 2021 ZMQ MAC3. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

    private let searchBar:UISearchBar = {
        let searchBar = UISearchBar()
        if #available(iOS 13, *){
        searchBar.backgroundColor = .secondarySystemBackground
        }else{
            searchBar.backgroundColor = .white
        }
            return searchBar
    }()
    
    private var collectionView:UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13, *){
        view.backgroundColor = .systemBackground
        }else{
           view.backgroundColor = .white
        }
            navigationController?.navigationBar.topItem?.titleView = searchBar
  
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero
            , collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        guard let collectionView = collectionView else{return}
        view.addSubview(collectionView)
        
    }
    
}

extension ExploreViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
    
    
}
