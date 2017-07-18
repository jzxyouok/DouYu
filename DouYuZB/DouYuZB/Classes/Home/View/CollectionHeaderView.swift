//
//  CollectionHeaderView.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/4.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var group: AnchorGroup? {
        didSet{
            titleLabel.text = group?.tag_name
            iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        }
    }
}
