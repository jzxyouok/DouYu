//
//  AnchorGroup.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/14.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class AnchorGroup: NSObject{
    //该组中对应的房间信息
    var room_list: [[String : NSObject]]? {
        //属性监听器
        didSet{
            guard let room_list = room_list else { return }
            for dict in room_list {
                let anchor = AnchorModel(dict: dict)
                anchors.append(anchor)
            }
        }
    }
    //组显示的标题
    var tag_name: String = ""
    //组显示的图标
    var icon_name: String = "home_header_normal"
    //游戏对应的图标
    var icon_url: String = ""
    //定义主播的模型对象数组
    lazy var anchors: [AnchorModel] = [AnchorModel]()
    
    override init() {
        
    }
    
    init(dict: [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
