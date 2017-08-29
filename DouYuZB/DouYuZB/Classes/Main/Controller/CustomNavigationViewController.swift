//
//  CustomNavigationViewController.swift
//  DouYuZB
//
//  Created by Leon on 2017/8/29.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class CustomNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1.获取系统pop手势
        guard let systemGes = interactivePopGestureRecognizer else {
            return
        }
        //2.获取手势添加到的view
        guard let gesView = systemGes.view else {
            return
        }
        //3.获取target/action
        let targets = systemGes.value(forKey: "_targets") as? [NSObject]
        guard let targetObjc = targets?.first else {
            return
        }
        guard let target = targetObjc.value(forKey: "target") else {
            return
        }
        let action = Selector(("handleNavigationTransition:"))
        //4.创建Pan手势
        let panGes = UIPanGestureRecognizer()
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //MARK: 隐藏要push的控制器的tabbar
        viewController.hidesBottomBarWhenPushed = true;
        
        super.pushViewController(viewController, animated: animated)
    }
}
