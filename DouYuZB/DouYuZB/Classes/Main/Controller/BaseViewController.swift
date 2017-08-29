//
//  BaseViewController.swift
//  DouYuZB
//
//  Created by Leon on 2017/8/29.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK: 定制属性
    var contentView: UIView?
    
    //MARK: 懒加载属性
    lazy var animImageView: UIImageView = { [unowned self] in
        let imageView = UIImageView(image: UIImage(named: "img_loading_1"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named: "img_loading_1")!, UIImage(named: "img_loading_2")!]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        return imageView
    }()
    
    //MARK: 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension BaseViewController{
    func setupUI() {
        view.backgroundColor = UIColor.white
        contentView?.isHidden = true
        view.addSubview(animImageView)
        animImageView.startAnimating()
    }
    
    func loadDataFinished() {
        animImageView.stopAnimating()
        animImageView.isHidden = true
        contentView?.isHidden = false
    }
}
