//
//  CycleModel.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/17.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    //标题
    var title: String = ""
    //图片链接
    var pic_url: String = ""
    //房间
    var room: [String : NSObject]? {
        didSet{
            guard let room = room else { return }
            anchor = AnchorModel(dict: room)
        }
    }
    //主播模型对象
    var anchor: AnchorModel?
    
    init(dict: [String : NSObject]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
