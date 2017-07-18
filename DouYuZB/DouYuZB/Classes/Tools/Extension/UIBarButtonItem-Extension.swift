//
//  UIBarButtonItem-Extension.swift
//  DouYuZB
//
//  Created by Leon on 2017/6/7.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    //类方法
    /*
    class func createItem(imageName: String, highImageName: String, size: CGSize) -> UIBarButtonItem {
        let button = UIButton();
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setImage(UIImage(named: highImageName), for: .highlighted)
        button.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        return UIBarButtonItem(customView: button)
    }
    */
    //便利构造函数: 1.以convenience开头，2.在构造函数中必须明确调用一个设计的构造函数（self）
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize(width: 0, height: 0)){
        
        let button = UIButton();
        button.setImage(UIImage(named: imageName), for: .normal)
        
        if highImageName != "" {
            button.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        if __CGSizeEqualToSize(size, CGSize(width: 0, height: 0)) {
            button.sizeToFit()
        }else{
            button.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        }
        
        self.init(customView: button)
    }
}
