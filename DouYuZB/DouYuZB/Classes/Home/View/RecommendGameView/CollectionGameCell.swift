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
    @IBOutlet weak var lineView: UIView!
    
    var baseGame: BaseGameModel? {
        didSet{
            titleLabel.text = baseGame?.tag_name
            let iconURL = NSURL(string: (baseGame?.icon_url)!)!
            let imageResource = ImageResource(downloadURL: iconURL as URL)
            iconImageView.kf.setImage(with: imageResource, placeholder: Image(named: "home_more_btn"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }

}
