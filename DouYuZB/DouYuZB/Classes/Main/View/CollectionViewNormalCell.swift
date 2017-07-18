//
//  CollectionViewNormalCell.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/4.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class CollectionViewNormalCell: CollectionBaseCell {

    @IBOutlet weak var roomNameLabel: UILabel!

    override var anchor : AnchorModel? {
        didSet{
            super.anchor = anchor
            //房间名称
            roomNameLabel.text = anchor?.room_name
        }
    }
    
}
