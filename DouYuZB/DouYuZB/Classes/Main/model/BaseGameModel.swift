//
//  BaseGameModel.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/31.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class BaseGameModel: NSObject {
    
    var tag_name : String = ""
    var icon_url : String = ""
    
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
