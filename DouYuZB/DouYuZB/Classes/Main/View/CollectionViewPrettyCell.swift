//
//  CollectionViewPrettyCell.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/4.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class CollectionViewPrettyCell: CollectionBaseCell {

    @IBOutlet weak var cityBtn: UIButton!
    
    override var anchor : AnchorModel? {
        didSet{
            super.anchor = anchor
            //所在城市
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)
        }
    }
}
