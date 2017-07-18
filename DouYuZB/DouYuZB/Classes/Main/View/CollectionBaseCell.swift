//
//  CollectionBaseCell.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/14.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionBaseCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
 
    var anchor : AnchorModel? {
        didSet{
            //校验模型是否有值
            guard let anchor = anchor else { return }
            //在线人数
            var onlineStr: String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            }else{
                onlineStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            //昵称
            nickNameLabel.text = anchor.nickname
            //设置封面图片
            guard let iconUrl = NSURL(string: anchor.vertical_src) else { return }
            let imageResource = ImageResource(downloadURL: iconUrl as URL)
            iconImageView.kf.setImage(with: imageResource)
        }
    }

}
