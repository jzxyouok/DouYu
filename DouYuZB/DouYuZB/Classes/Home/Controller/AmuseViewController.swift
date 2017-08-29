//
//  AmuseViewController.swift
//  DouYuZB
//
//  Created by Leon on 2017/8/3.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

private let kMenuViewH : CGFloat = 200.0

class AmuseViewController: BaseAnchorViewController {
    fileprivate lazy var amuseVM: AmuseViewModel = AmuseViewModel()
    lazy var menuView: AmuseMenuView = {
        let menuView = AmuseMenuView.amuseMenuView()
        menuView.frame = CGRect(x: 0.0, y: -kMenuViewH, width: kScreenW, height: kMenuViewH)
        return menuView
    }()
}
//设置UI界面
extension AmuseViewController {
    override func setupUI() {
        super.setupUI()
        
        collectionView.addSubview(menuView)
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)
    }
}

extension AmuseViewController {
    override func loadData() {
        baseVM = amuseVM
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
            self.menuView.group = self.amuseVM.anchorGroup
            //MARK: 数据请求完成
            self.loadDataFinished()
        }
    }
}
