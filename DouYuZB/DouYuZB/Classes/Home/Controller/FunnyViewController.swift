//
//  FunnyViewController.swift
//  DouYuZB
//
//  Created by Leon on 2017/8/28.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

private let kTopMargin: CGFloat = 8.0

class FunnyViewController: BaseAnchorViewController {
    //MARK: 懒加载viewModel对象
    fileprivate lazy var funnyVM: FunnyViewModel = FunnyViewModel()
}

extension FunnyViewController{
    override func setupUI() {
        super.setupUI()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        
        collectionView.contentInset = UIEdgeInsetsMake(kTopMargin, 0.0, 0.0, 0.0)
    }
}

extension FunnyViewController {
    override func loadData() {
        baseVM = funnyVM
        
        funnyVM.loadFunnyData {
            self.collectionView.reloadData()
            //MARK: 数据请求完成
            self.loadDataFinished()
        }
    }
}
