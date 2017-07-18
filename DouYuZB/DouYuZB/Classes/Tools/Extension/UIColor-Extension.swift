//
//  UIColor-Extension.swift
//  DouYuZB
//
//  Created by Leon on 2017/6/7.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
}
