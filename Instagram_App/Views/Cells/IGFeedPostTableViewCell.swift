//
//  IGFeedPostTableViewCell.swift
//  Instagram_App
//
//  Created by ZMQ MAC3 on 21/06/21.
//  Copyright © 2021 ZMQ MAC3. All rights reserved.
//

import UIKit

class IGFeedPostTableViewCell: UITableViewCell {
    
    static let identifier = "IGFeedPostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
