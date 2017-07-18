//
//  CollectionGameCell.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/18.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    var group: AnchorGroup? {
        didSet{
            titleLabel.text = group?.tag_name
            let iconURL = NSURL(string: (group?.icon_url)!)!
            let imageResource = ImageResource(downloadURL: iconURL as URL)
            iconImageView.kf.setImage(with: imageResource, placeholder: Image(named: "home_more_btn"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }

}
