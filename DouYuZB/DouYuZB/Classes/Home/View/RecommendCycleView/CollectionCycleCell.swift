//
//  CollectionCycleCell.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/17.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionCycleCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    var cycleModel: CycleModel? {
        didSet{
            titleLabel.text = cycleModel?.title
            let iconURL = NSURL(string: cycleModel?.pic_url ?? "")!
            //设置图片
            let imageResource = ImageResource(downloadURL: iconURL as URL)
            iconImageView.kf.setImage(with: imageResource)
        }
    }

}
